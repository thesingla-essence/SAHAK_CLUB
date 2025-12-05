<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sahakclub.model.Club" %>
<%
    List<Club> clubs = (List<Club>) request.getAttribute("clubs");
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
  <title>Admin Dashboard • SAHAK</title>
  <link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="admin-shell">

<nav class="navbar navbar-expand-lg brand-nav py-3">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">SAHAK • Admin HQ</a>
    <div class="d-flex flex-column flex-lg-row align-items-lg-center ms-auto gap-2">
      <span class="text-muted small">Signed in as <strong><%= adminUser %></strong></span>
      <form action="${pageContext.request.contextPath}/admin/logout" method="post" class="mb-0">
        <button class="btn btn-outline-light">Logout</button>
      </form>
    </div>
  </div>
</nav>

<section class="py-5">
  <div class="container">
    <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
      <div>
        <h2 class="mb-1">Clubs Management</h2>
        <p class="text-muted mb-0">Create, update and celebrate every club in the SAHAK ecosystem.</p>
      </div>
      <div class="d-flex gap-2">
        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/clubs" target="_blank"><i class="bi bi-eye"></i> View site</a>
        <a class="btn-brand" href="${pageContext.request.contextPath}/admin/add-club"><i class="bi bi-plus-circle"></i> Add Club</a>
      </div>
    </div>

    <div class="row g-3 mb-4">
      <div class="col-md-4">
        <div class="glass-card h-100">
          <h6 class="text-uppercase text-muted">Total Clubs</h6>
          <h2 class="mt-2"> <%= clubs != null ? clubs.size() : 0 %></h2>
          <p class="mb-0 small text-muted">Track active initiatives and identify scope for new cells.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="glass-card h-100">
          <h6 class="text-uppercase text-muted">Faculty coordinators</h6>
          <p class="mb-0">Ensure each club has updated faculty details to streamline approvals.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="glass-card h-100">
          <h6 class="text-uppercase text-muted">Student leadership</h6>
          <p class="mb-0">Empower student coordinators with clear visibility on this portal.</p>
        </div>
      </div>
    </div>

    <div class="admin-card">
      <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-3">
        <h5 class="mb-0">Registered Clubs</h5>
        <div class="search-bar" style="max-width:320px;">
          <i class="bi bi-search"></i>
          <input type="search" id="adminClubSearch" placeholder="Filter by name or coordinator" aria-label="Filter clubs">
        </div>
      </div>

      <div class="table-responsive">
        <table class="table table-hover align-middle admin-table" id="adminClubTable">
          <thead>
          <tr><th>#</th><th>Name</th><th>Faculty</th><th>Student</th><th>Actions</th></tr>
          </thead>
          <tbody>
          <% if (clubs != null && !clubs.isEmpty()) {
               for (Club c : clubs) { %>
                 <tr data-search="<%= (c.getName() + " " + c.getFacultyCoordinator() + " " + c.getStudentCoordinator()).toLowerCase() %>">
                   <td><strong><%= c.getId() %></strong></td>
                   <td><%= c.getName() %></td>
                   <td><%= c.getFacultyCoordinator() != null ? c.getFacultyCoordinator() : "—" %></td>
                   <td><%= c.getStudentCoordinator() != null ? c.getStudentCoordinator() : "—" %></td>
                   <td>
                     <div class="table-action">
                       <a class="btn btn-sm btn-brand" href="${pageContext.request.contextPath}/admin/edit-club?id=<%= c.getId() %>"><i class="bi bi-pencil-square"></i> Edit</a>
                       <form action="${pageContext.request.contextPath}/admin/delete-club" method="post" onsubmit="return confirm('Delete this club?');">
                         <input type="hidden" name="id" value="<%= c.getId() %>">
                         <button type="submit" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i> Delete</button>
                       </form>
                     </div>
                   </td>
                 </tr>
          <%   }
             } else { %>
            <tr>
              <td colspan="5" class="text-center py-4 text-muted">No clubs added yet. Use “Add Club” to create one.</td>
            </tr>
          <% } %>
          </tbody>
        </table>
      </div>
      <div class="text-center d-none" id="adminNoResults">
        <div class="empty-state mt-4">No clubs match your filter criteria.</div>
      </div>
    </div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js" defer></script>
</body>
</html>
