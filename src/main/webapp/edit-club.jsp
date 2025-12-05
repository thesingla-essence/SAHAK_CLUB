<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sahakclub.model.Club" %>
<%
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
    Club club = (Club) request.getAttribute("club");
    if (club == null) {
        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        return;
    }
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Edit Club • SAHAK Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
</head>
<body class="admin-shell">

<nav class="navbar navbar-expand-lg brand-nav py-3">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">SAHAK • Admin HQ</a>
    <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/admin/dashboard">Back to dashboard</a>
  </div>
</nav>

<section class="py-5">
  <div class="container">
    <div class="form-shell">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <div>
          <h3 class="mb-1">Edit Club Details</h3>
          <p class="text-muted mb-0">Update information for <strong><%= club.getName() %></strong>.</p>
        </div>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-link"><i class="bi bi-arrow-left"></i> Back</a>
      </div>

      <!-- Progress Indicator -->
      <div class="mb-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
          <small class="text-muted">Form Completion</small>
          <small class="text-muted" id="progressPercent">0%</small>
        </div>
        <div class="progress" style="height: 6px;">
          <div class="progress-bar" id="formProgress" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
      </div>

      <form id="editClubForm" action="${pageContext.request.contextPath}/admin/update-club" method="post" enctype="multipart/form-data" class="row g-3" novalidate autocomplete="off">
    <input type="hidden" name="id" value="<%= club.getId() %>">
        <div class="col-12">
          <label class="form-label" for="clubName">
            Club name <span class="text-danger">*</span>
            <i class="bi bi-info-circle text-muted ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Enter the official name of the club"></i>
          </label>
          <input class="form-control" id="clubName" name="name" value="<%= club.getName() != null ? club.getName() : "" %>" required autocomplete="off">
          <div class="invalid-feedback">Please provide a club name.</div>
        </div>
        <div class="col-md-6">
          <label class="form-label" for="facultyCoordinator">
            Faculty coordinator
            <i class="bi bi-info-circle text-muted ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Name of the faculty member overseeing this club"></i>
          </label>
          <input class="form-control" id="facultyCoordinator" name="facultyCoordinator" value="<%= club.getFacultyCoordinator() != null ? club.getFacultyCoordinator() : "" %>" placeholder="Professor / Mentor" autocomplete="off">
        </div>
        <div class="col-md-6">
          <label class="form-label" for="studentCoordinator">
            Student coordinator
            <i class="bi bi-info-circle text-muted ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Name of the student leading this club"></i>
          </label>
          <input class="form-control" id="studentCoordinator" name="studentCoordinator" value="<%= club.getStudentCoordinator() != null ? club.getStudentCoordinator() : "" %>" placeholder="Lead student name" autocomplete="off">
        </div>
        <div class="col-12">
          <label class="form-label" for="description">
            About the club
            <i class="bi bi-info-circle text-muted ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Describe the club's mission, activities, and achievements"></i>
          </label>
          <textarea class="form-control" id="description" name="description" rows="5" placeholder="Describe mission, flagship events, achievements" maxlength="1000" autocomplete="off"><%= club.getDescription() != null ? club.getDescription() : "" %></textarea>
          <div class="d-flex justify-content-between align-items-center mt-1">
            <div class="form-text">Provide a detailed description to help students understand what this club offers.</div>
            <small class="text-muted"><span id="charCount">0</span>/1000 characters</small>
          </div>
        </div>
        <div class="col-12">
          <label class="form-label" for="engagement">
            Engagement & Opportunities
            <i class="bi bi-info-circle text-muted ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Describe how students can engage with the club, volunteering opportunities, workshops, events, etc."></i>
          </label>
          <%
            String engagementValue = "";
            try {
              String eng = club.getEngagement();
              engagementValue = (eng != null) ? eng : "";
            } catch (Exception e) {
              engagementValue = "";
            }
          %>
          <textarea class="form-control" id="engagement" name="engagement" rows="4" placeholder="e.g. Connect with the club leadership for volunteering, workshops, hackathons, and campus outreach opportunities. Join our weekly meetings every Friday at 4 PM." maxlength="500" autocomplete="off"><%= engagementValue %></textarea>
          <div class="d-flex justify-content-between align-items-center mt-1">
            <div class="form-text">Explain how students can get involved and what opportunities are available.</div>
            <small class="text-muted"><span id="engagementCharCount">0</span>/500 characters</small>
          </div>
        </div>
        <div class="col-12">
          <label class="form-label" for="image">
            Upload new image
            <i class="bi bi-info-circle text-muted ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Upload a high-quality image representing the club"></i>
          </label>
          <div class="image-upload-area border rounded p-4 text-center" id="imageUploadArea" style="border-style: dashed !important; border-color: rgba(33, 85, 255, 0.3) !important; background: rgba(33, 85, 255, 0.02); cursor: pointer; transition: all 0.3s ease;">
            <input class="form-control d-none" id="image" type="file" name="image" accept="image/*">
            <% if (club.getImageUrl() != null && !club.getImageUrl().isEmpty()) {
                 String currentImagePath = request.getContextPath() + "/images/" + club.getImageUrl();
            %>
            <div id="currentImageDisplay">
              <img src="<%= currentImagePath %>" alt="Current club image" class="img-fluid rounded mb-2" style="max-height: 300px; object-fit: cover;" id="currentImage">
              <div>
                <small class="text-muted d-block mb-2">Current image: <%= club.getImageUrl() %></small>
                <button type="button" class="btn btn-sm btn-outline-primary" id="changeImage"><i class="bi bi-arrow-repeat"></i> Change Image</button>
              </div>
            </div>
            <div id="uploadPlaceholder" class="d-none">
              <i class="bi bi-cloud-upload fs-1 text-muted mb-2"></i>
              <p class="mb-1"><strong>Click to upload</strong> or drag and drop</p>
              <p class="small text-muted mb-0">PNG, JPG, GIF up to 8MB (Recommended: 1200x800px)</p>
            </div>
            <div id="imagePreview" class="d-none">
              <img id="previewImg" src="" alt="Preview" class="img-fluid rounded mb-2" style="max-height: 300px; object-fit: cover;">
              <div>
                <button type="button" class="btn btn-sm btn-outline-danger" id="removeImage"><i class="bi bi-trash"></i> Remove</button>
                <button type="button" class="btn btn-sm btn-outline-secondary ms-2" id="cancelChange"><i class="bi bi-x-circle"></i> Cancel</button>
              </div>
              <small class="text-muted d-block mt-2" id="fileName"></small>
            </div>
            <% } else { %>
            <div id="uploadPlaceholder">
              <i class="bi bi-cloud-upload fs-1 text-muted mb-2"></i>
              <p class="mb-1"><strong>Click to upload</strong> or drag and drop</p>
              <p class="small text-muted mb-0">PNG, JPG, GIF up to 8MB (Recommended: 1200x800px)</p>
            </div>
            <div id="imagePreview" class="d-none">
              <img id="previewImg" src="" alt="Preview" class="img-fluid rounded mb-2" style="max-height: 300px; object-fit: cover;">
              <div>
                <button type="button" class="btn btn-sm btn-outline-danger" id="removeImage"><i class="bi bi-trash"></i> Remove</button>
              </div>
              <small class="text-muted d-block mt-2" id="fileName"></small>
            </div>
            <% } %>
          </div>
          <div class="form-text mt-2">If skipped, the current image will be kept.</div>
          <div id="imageError" class="text-danger small mt-1 d-none"></div>
        </div>
        <div class="col-12">
          <div class="d-flex justify-content-between align-items-center">
            <div>
              <button type="button" class="btn btn-sm btn-outline-secondary" id="resetForm"><i class="bi bi-arrow-clockwise"></i> Reset Changes</button>
              <small class="text-muted ms-2" id="draftStatus"></small>
            </div>
            <div class="d-flex gap-2">
              <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-secondary">Cancel</a>
              <button class="btn-brand" type="submit" id="submitBtn">
                <i class="bi bi-check-circle"></i> Save Changes
              </button>
            </div>
          </div>
        </div>
  </form>
</div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/club-form.js"></script>
</body>
</html>
