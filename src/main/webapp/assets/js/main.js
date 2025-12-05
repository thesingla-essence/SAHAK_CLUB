// SAHAK Clubs - Main JavaScript
(function() {
  'use strict';

  // Club search functionality on homepage
  const clubSearchInput = document.getElementById('clubSearch');
  if (clubSearchInput) {
    clubSearchInput.addEventListener('input', function(e) {
      const query = e.target.value.toLowerCase().trim();
      const cards = document.querySelectorAll('#clubsGrid .club-card');
      const noResults = document.getElementById('noResults');
      let visibleCount = 0;

      cards.forEach(card => {
        const searchText = card.getAttribute('data-search') || '';
        if (searchText.includes(query)) {
          card.closest('.col-md-6, .col-xl-4').style.display = '';
          visibleCount++;
        } else {
          card.closest('.col-md-6, .col-xl-4').style.display = 'none';
        }
      });

      if (visibleCount === 0 && query.length > 0) {
        noResults.classList.remove('d-none');
      } else {
        noResults.classList.add('d-none');
      }
    });
  }

  // Admin dashboard search
  const adminSearchInput = document.getElementById('adminClubSearch');
  if (adminSearchInput) {
    adminSearchInput.addEventListener('input', function(e) {
      const query = e.target.value.toLowerCase().trim();
      const rows = document.querySelectorAll('#adminClubTable tbody tr');
      const noResults = document.getElementById('adminNoResults');
      let visibleCount = 0;

      rows.forEach(row => {
        const searchText = row.getAttribute('data-search') || '';
        if (searchText.includes(query)) {
          row.style.display = '';
          visibleCount++;
        } else {
          row.style.display = 'none';
        }
      });

      if (visibleCount === 0 && query.length > 0) {
        noResults.classList.remove('d-none');
      } else {
        noResults.classList.add('d-none');
      }
    });
  }

  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      const href = this.getAttribute('href');
      if (href !== '#' && href.length > 1) {
        const target = document.querySelector(href);
        if (target) {
          e.preventDefault();
          target.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
          });
          // Update active nav link
          document.querySelectorAll('.nav-link').forEach(link => {
            link.classList.remove('active');
          });
          this.classList.add('active');
        }
      }
    });
  });

  // Navbar scroll effect
  const navbar = document.querySelector('.brand-nav');
  if (navbar) {
    let lastScroll = 0;
    window.addEventListener('scroll', function() {
      const currentScroll = window.pageYOffset;
      if (currentScroll > 100) {
        navbar.style.boxShadow = '0 12px 32px rgba(15, 23, 42, 0.15)';
      } else {
        navbar.style.boxShadow = '0 12px 32px rgba(15, 23, 42, 0.1)';
      }
      lastScroll = currentScroll;
    });
  }

  // Form validation enhancement
  const forms = document.querySelectorAll('form');
  forms.forEach(form => {
    form.addEventListener('submit', function(e) {
      if (!form.checkValidity()) {
        e.preventDefault();
        e.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });

  // Image error handling
  document.querySelectorAll('img').forEach(img => {
    img.addEventListener('error', function() {
      this.src = 'https://via.placeholder.com/800x450?text=Club+Image';
      this.alt = 'Placeholder image';
    });
  });

  // Initialize tooltips if Bootstrap is available
  if (typeof bootstrap !== 'undefined') {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function(tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl);
    });
  }

  console.log('SAHAK Clubs - UI initialized');
})();

