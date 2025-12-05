<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login");
        return;
    }
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Add Club • SAHAK Admin</title>
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
          <h3 class="mb-1">Add a New Club</h3>
          <p class="text-muted mb-0">Share essential information to onboard a club onto SAHAK.</p>
        </div>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-link"><i class="bi bi-arrow-left"></i> Back</a>
      </div>
      <form action="${pageContext.request.contextPath}/admin/add-club" method="post" enctype="multipart/form-data" class="row g-3">
        <div class="col-12">
          <label class="form-label" for="clubName">Club name</label>
          <input class="form-control" id="clubName" name="name" placeholder="e.g. AI Innovation Club" required>
        </div>
        <div class="col-md-6">
          <label class="form-label" for="facultyCoordinator">Faculty coordinator</label>
          <input class="form-control" id="facultyCoordinator" name="facultyCoordinator" placeholder="Professor / Mentor">
        </div>
        <div class="col-md-6">
          <label class="form-label" for="studentCoordinator">Student coordinator</label>
          <input class="form-control" id="studentCoordinator" name="studentCoordinator" placeholder="Lead student name">
        </div>
        <div class="col-12">
          <label class="form-label" for="description">About the club</label>
          <textarea class="form-control" id="description" name="description" rows="4" placeholder="Describe mission, flagship events, achievements"></textarea>
        </div>
        <div class="col-12">
          <label class="form-label" for="image">Upload feature image</label>
          <input class="form-control" id="image" type="file" name="image" accept="image/*">
          <div class="form-text">Recommended 1200x800 px JPG/PNG. If skipped, a placeholder is used.</div>
        </div>
        <div class="col-12 d-flex justify-content-end gap-2">
          <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-outline-secondary">Cancel</a>
          <button class="btn-brand" type="submit">Create Club</button>
        </div>
      </form>
    </div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
