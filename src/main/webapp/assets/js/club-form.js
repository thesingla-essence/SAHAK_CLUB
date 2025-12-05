// Club Form Enhancement Script
(function() {
  'use strict';

  const form = document.getElementById('addClubForm') || document.getElementById('editClubForm');
  if (!form) return;

  const isEditMode = form.id === 'editClubForm';
  const formKey = isEditMode ? 'editClubDraft_' + document.querySelector('input[name="id"]').value : 'addClubDraft';
  const allowDraft = (() => {
    try { return new URLSearchParams(window.location.search).get('restoreDraft') === '1'; } catch (_) { return false; }
  })();
  
  // Elements
  const imageInput = document.getElementById('image');
  const imageUploadArea = document.getElementById('imageUploadArea');
  const uploadPlaceholder = document.getElementById('uploadPlaceholder');
  const imagePreview = document.getElementById('imagePreview');
  const previewImg = document.getElementById('previewImg');
  const fileName = document.getElementById('fileName');
  const imageError = document.getElementById('imageError');
  const charCount = document.getElementById('charCount');
  const description = document.getElementById('description');
  const engagementCharCount = document.getElementById('engagementCharCount');
  const engagement = document.getElementById('engagement');
  const progressBar = document.getElementById('formProgress');
  const progressPercent = document.getElementById('progressPercent');
  const draftStatus = document.getElementById('draftStatus');
  const submitBtn = document.getElementById('submitBtn');

  // Initialize
  init();

  function init() {
    // Initialize tooltips
    if (typeof bootstrap !== 'undefined') {
      const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
      tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
      });
    }

    // Character counter
    if (description && charCount) {
      updateCharCount();
      description.addEventListener('input', updateCharCount);
    }
    
    // Engagement character counter
    if (engagement && engagementCharCount) {
      updateEngagementCharCount();
      engagement.addEventListener('input', updateEngagementCharCount);
    }

    // Image upload handlers
    setupImageUpload();

    // Form progress tracking
    updateFormProgress();
    form.addEventListener('input', updateFormProgress);
    form.addEventListener('change', updateFormProgress);

    // Auto-save draft
    loadDraft();
    form.addEventListener('input', debounce(saveDraft, 1000));
    form.addEventListener('change', debounce(saveDraft, 500));

    // Clear/Reset form
    const clearBtn = document.getElementById('clearForm') || document.getElementById('resetForm');
    if (clearBtn) {
      clearBtn.addEventListener('click', handleClearForm);
    }

    // Form submission
    form.addEventListener('submit', handleFormSubmit);

    // Prevent accidental navigation
    let formChanged = false;
    form.addEventListener('input', () => { formChanged = true; });
    form.addEventListener('change', () => { formChanged = true; });
    
    window.addEventListener('beforeunload', (e) => {
      if (formChanged) {
        e.preventDefault();
        e.returnValue = '';
      }
    });

    // Change image button (edit mode)
    const changeImageBtn = document.getElementById('changeImage');
    if (changeImageBtn) {
      changeImageBtn.addEventListener('click', () => {
        document.getElementById('currentImageDisplay').classList.add('d-none');
        uploadPlaceholder.classList.remove('d-none');
        imageInput.click();
      });
    }

    // Cancel change button (edit mode)
    const cancelChangeBtn = document.getElementById('cancelChange');
    if (cancelChangeBtn) {
      cancelChangeBtn.addEventListener('click', () => {
        imagePreview.classList.add('d-none');
        imageInput.value = '';
        const currentDisplay = document.getElementById('currentImageDisplay');
        if (currentDisplay) {
          currentDisplay.classList.remove('d-none');
        } else {
          uploadPlaceholder.classList.remove('d-none');
        }
        hideImageError();
      });
    }
  }

  function setupImageUpload() {
    if (!imageInput || !imageUploadArea) return;

    // Click to upload
    imageUploadArea.addEventListener('click', (e) => {
      if (e.target !== imageInput && !e.target.closest('button')) {
        imageInput.click();
      }
    });

    // File input change
    imageInput.addEventListener('change', handleImageSelect);

    // Drag and drop
    imageUploadArea.addEventListener('dragover', (e) => {
      e.preventDefault();
      e.stopPropagation();
      imageUploadArea.style.borderColor = 'rgba(33, 85, 255, 0.6)';
      imageUploadArea.style.background = 'rgba(33, 85, 255, 0.08)';
    });

    imageUploadArea.addEventListener('dragleave', (e) => {
      e.preventDefault();
      e.stopPropagation();
      imageUploadArea.style.borderColor = 'rgba(33, 85, 255, 0.3)';
      imageUploadArea.style.background = 'rgba(33, 85, 255, 0.02)';
    });

    imageUploadArea.addEventListener('drop', (e) => {
      e.preventDefault();
      e.stopPropagation();
      imageUploadArea.style.borderColor = 'rgba(33, 85, 255, 0.3)';
      imageUploadArea.style.background = 'rgba(33, 85, 255, 0.02)';

      const files = e.dataTransfer.files;
      if (files.length > 0) {
        imageInput.files = files;
        handleImageSelect({ target: imageInput });
      }
    });
  }

  function handleImageSelect(e) {
    const file = e.target.files[0];
    if (!file) return;

    // Validate file
    const maxSize = 8 * 1024 * 1024; // 8MB
    const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/webp'];

    if (!allowedTypes.includes(file.type)) {
      showImageError('Please upload a valid image file (JPG, PNG, GIF, or WebP).');
      imageInput.value = '';
      return;
    }

    if (file.size > maxSize) {
      showImageError('Image size must be less than 8MB. Please compress the image and try again.');
      imageInput.value = '';
      return;
    }

    hideImageError();

    // Show preview
    const reader = new FileReader();
    reader.onload = (e) => {
      previewImg.src = e.target.result;
      fileName.textContent = file.name + ' (' + formatFileSize(file.size) + ')';
      
      // Hide current image display if in edit mode
      const currentDisplay = document.getElementById('currentImageDisplay');
      if (currentDisplay) {
        currentDisplay.classList.add('d-none');
      }
      
      uploadPlaceholder.classList.add('d-none');
      imagePreview.classList.remove('d-none');
    };
    reader.readAsDataURL(file);
  }

  function removeImage() {
    imageInput.value = '';
    imagePreview.classList.add('d-none');
    const currentDisplay = document.getElementById('currentImageDisplay');
    if (currentDisplay) {
      currentDisplay.classList.remove('d-none');
    } else {
      uploadPlaceholder.classList.remove('d-none');
    }
    hideImageError();
  }

  const removeImageBtn = document.getElementById('removeImage');
  if (removeImageBtn) {
    removeImageBtn.addEventListener('click', removeImage);
  }

  function showImageError(message) {
    if (imageError) {
      imageError.textContent = message;
      imageError.classList.remove('d-none');
    }
  }

  function hideImageError() {
    if (imageError) {
      imageError.classList.add('d-none');
    }
  }

  function formatFileSize(bytes) {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round(bytes / Math.pow(k, i) * 100) / 100 + ' ' + sizes[i];
  }

  function updateCharCount() {
    if (!description || !charCount) return;
    const count = description.value.length;
    charCount.textContent = count;
    
    // Change color based on usage
    if (count > 900) {
      charCount.style.color = '#dc3545';
    } else if (count > 700) {
      charCount.style.color = '#ffc107';
    } else {
      charCount.style.color = '';
    }
  }

  function updateEngagementCharCount() {
    if (!engagement || !engagementCharCount) return;
    const count = engagement.value.length;
    engagementCharCount.textContent = count;
    
    // Change color based on usage
    if (count > 450) {
      engagementCharCount.style.color = '#dc3545';
    } else if (count > 350) {
      engagementCharCount.style.color = '#ffc107';
    } else {
      engagementCharCount.style.color = '';
    }
  }

  function updateFormProgress() {
    if (!progressBar || !progressPercent) return;

    const fields = [
      form.querySelector('#clubName'),
      form.querySelector('#facultyCoordinator'),
      form.querySelector('#studentCoordinator'),
      form.querySelector('#description'),
      form.querySelector('#engagement'),
      form.querySelector('#image')
    ];

    let filled = 0;
    fields.forEach(field => {
      if (field) {
        if (field.type === 'file') {
          if (field.files && field.files.length > 0) filled++;
        } else if (field.value && field.value.trim() !== '') {
          filled++;
        }
      }
    });

    // Club name is required, so give it more weight
    const nameField = form.querySelector('#clubName');
    const nameWeight = nameField && nameField.value.trim() ? 30 : 0;
    const otherFields = (filled - (nameField && nameField.value.trim() ? 1 : 0)) * 15;
    const progress = Math.min(100, nameWeight + otherFields);

    progressBar.style.width = progress + '%';
    progressBar.setAttribute('aria-valuenow', progress);
    progressPercent.textContent = Math.round(progress) + '%';
    
    // Update progress bar color
    if (progress === 100) {
      progressBar.classList.remove('bg-primary');
      progressBar.classList.add('bg-success');
    } else {
      progressBar.classList.remove('bg-success');
      progressBar.classList.add('bg-primary');
    }
  }

  function saveDraft() {
    if (!form) return;
    
        const formData = {
      name: form.querySelector('#clubName')?.value || '',
      facultyCoordinator: form.querySelector('#facultyCoordinator')?.value || '',
      studentCoordinator: form.querySelector('#studentCoordinator')?.value || '',
      description: form.querySelector('#description')?.value || '',
      engagement: form.querySelector('#engagement')?.value || ''
    };

    try {
      localStorage.setItem(formKey, JSON.stringify(formData));
      if (draftStatus) {
        draftStatus.textContent = 'Draft saved';
        draftStatus.style.color = '#28a745';
        setTimeout(() => {
          draftStatus.textContent = '';
        }, 2000);
      }
    } catch (e) {
      console.warn('Could not save draft:', e);
    }
  }

  function loadDraft() {
    if (isEditMode) return;
    if (!allowDraft) return;
    
    try {
      const saved = localStorage.getItem(formKey);
      if (saved) {
        const formData = JSON.parse(saved);
        if (form.querySelector('#clubName')) form.querySelector('#clubName').value = formData.name || '';
        if (form.querySelector('#facultyCoordinator')) form.querySelector('#facultyCoordinator').value = formData.facultyCoordinator || '';
        if (form.querySelector('#studentCoordinator')) form.querySelector('#studentCoordinator').value = formData.studentCoordinator || '';
        if (form.querySelector('#description')) {
          form.querySelector('#description').value = formData.description || '';
          updateCharCount();
        }
        if (form.querySelector('#engagement')) {
          form.querySelector('#engagement').value = formData.engagement || '';
          updateEngagementCharCount();
        }
        updateFormProgress();
        
        if (draftStatus) {
          draftStatus.textContent = 'Draft loaded';
          draftStatus.style.color = '#17a2b8';
          setTimeout(() => {
            draftStatus.textContent = '';
          }, 3000);
        }
      }
    } catch (e) {
      console.warn('Could not load draft:', e);
    }
  }

  function handleClearForm() {
    if (!confirm('Are you sure you want to clear all form data? This cannot be undone.')) {
      return;
    }

    form.reset();
    if (imagePreview) imagePreview.classList.add('d-none');
    if (uploadPlaceholder) uploadPlaceholder.classList.remove('d-none');
    const currentDisplay = document.getElementById('currentImageDisplay');
    if (currentDisplay) currentDisplay.classList.remove('d-none');
    
    updateCharCount();
    updateFormProgress();
    hideImageError();
    
    // Clear draft
    try {
      localStorage.removeItem(formKey);
      if (draftStatus) draftStatus.textContent = '';
    } catch (e) {
      console.warn('Could not clear draft:', e);
    }
  }

  function handleFormSubmit(e) {
    // Validate form
    if (!form.checkValidity()) {
      e.preventDefault();
      e.stopPropagation();
      form.classList.add('was-validated');
      
      // Scroll to first invalid field
      const firstInvalid = form.querySelector(':invalid');
      if (firstInvalid) {
        firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
        firstInvalid.focus();
      }
      return false;
    }

    // Show loading state
    if (submitBtn) {
      submitBtn.disabled = true;
      submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Processing...';
    }

    // Clear draft on successful submit
    try {
      localStorage.removeItem(formKey);
    } catch (e) {
      console.warn('Could not clear draft:', e);
    }

    return true;
  }

  function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
      const later = () => {
        clearTimeout(timeout);
        func(...args);
      };
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
    };
  }

    // Initialize character count on page load (for edit mode)
    if (isEditMode && description) {
      updateCharCount();
    }
    if (isEditMode && engagement) {
      updateEngagementCharCount();
    }

})();


