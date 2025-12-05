<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sahakclub.model.Club" %>
<%
    Club club = (Club) request.getAttribute("club");
    if (club == null) {
        response.sendRedirect(request.getContextPath() + "/clubs");
        return;
    }
    String rawImage = club.getImageUrl();
    String imageFile = (rawImage != null && !rawImage.isEmpty()) ? rawImage : "";
    if (!imageFile.isEmpty() && (imageFile.contains("/") || imageFile.contains("\\"))) {
        imageFile = new java.io.File(imageFile).getName();
    }
    String imagePath = !imageFile.isEmpty()
            ? request.getContextPath() + "/images/" + imageFile
            : "https://via.placeholder.com/800x450?text=Club";
%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title><%= club.getName() %> - DCSA</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg brand-nav py-3">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/clubs">SAHAK • DCSA Clubs</a>
    <div class="d-flex align-items-center gap-2 ms-auto">
      <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
      <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/admin/login">Admin</a>
    </div>
  </div>
</nav>

<section class="detail-hero">
  <div class="container">
    <div class="row align-items-center gy-4">
      <div class="col-lg-7">
        <h1><%= club.getName() %></h1>
        <p class="fs-5 mb-3">Discover what makes this club unique at the Department of Computer Science &amp; Applications.</p>
        <div class="d-flex flex-wrap gap-3">
          <span class="chip"><i class="bi bi-person-video"></i> Faculty: <%= club.getFacultyCoordinator() != null ? club.getFacultyCoordinator() : "TBA" %></span>
          <span class="chip"><i class="bi bi-award"></i> Student Lead: <%= club.getStudentCoordinator() != null ? club.getStudentCoordinator() : "TBA" %></span>
        </div>
      </div>
      <div class="col-lg-5 text-lg-end">
        <a href="${pageContext.request.contextPath}/clubs" class="btn btn-outline-light">&larr; Back to all clubs</a>
      </div>
    </div>
  </div>
</section>

<section class="py-5 detail-body">
  <div class="container">
    <div class="row gy-4 align-items-start">
      <div class="col-lg-6">
        <div class="image-frame">
          <img src="<%= imagePath %>" alt="<%= club.getName() %> visual" loading="eager" fetchpriority="high">
        </div>
      </div>
      <div class="col-lg-6">
        <div class="info-card mb-3">
          <h5>Coordinators</h5>
          <span class="d-block mb-2"><i class="bi bi-person-workspace me-2"></i>Faculty: <strong><%= club.getFacultyCoordinator() != null ? club.getFacultyCoordinator() : "To be announced" %></strong></span>
          <span class="d-block"><i class="bi bi-people me-2"></i>Student: <strong><%= club.getStudentCoordinator() != null ? club.getStudentCoordinator() : "To be announced" %></strong></span>
        </div>
        <div class="info-card mb-3">
          <h5>Engagement & Opportunities</h5>
          <%
            String engagementText = null;
            try {
              engagementText = club.getEngagement();
            } catch (Exception e) {
              engagementText = null;
            }
            if (engagementText == null || engagementText.isEmpty()) {
              engagementText = "Connect with the club leadership for volunteering, workshops, hackathons, and campus outreach opportunities.";
            }
          %>
          <p class="mb-0 text-muted"><%= engagementText %></p>
        </div>
      </div>
      <div class="col-12">
        <div class="description-card">
          <h4 class="mb-3">About the Club</h4>
          <p class="mb-0"><%= club.getDescription() != null ? club.getDescription() : "Details coming soon." %></p>
        </div>
      </div>
    </div>
  </div>
</section>

<footer class="footer-shell">
  <div class="container">
    <div class="row gy-3 align-items-center">
      <div class="col-lg-8">
        <h5>Department of Computer Science &amp; Applications</h5>
        <p class="mb-1">Panjab University, Chandigarh</p>
        <p class="mb-0">Contact: chairpersondcsa@pu.ac.in • +91-1722534063</p>
      </div>
      <div class="col-lg-4 text-lg-end">
        <div class="footer-badge">SAHAK • Empowering Student Clubs</div>
      </div>
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js" defer></script>
</body>
</html>
