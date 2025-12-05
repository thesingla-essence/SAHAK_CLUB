<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String err = (String) request.getAttribute("error");
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Admin Login • SAHAK</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
</head>
<body class="admin-shell">

<nav class="navbar navbar-expand-lg brand-nav py-3">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">SAHAK • Admin Access</a>
    <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/">Back to site</a>
  </div>
</nav>

<section class="login-shell">
  <div class="login-card">
    <div class="text-center mb-3">
      <span class="chip"><i class="bi bi-shield-lock"></i> Secure Login</span>
    </div>
    <h4>Administrator Portal</h4>
    <p class="form-text">Use your credentials to manage clubs, events and updates.</p>
    <% if (err != null) { %>
      <div class="alert alert-danger" role="alert">
        <i class="bi bi-exclamation-triangle me-2"></i><%= err %>
      </div>
    <% } %>
    <form action="${pageContext.request.contextPath}/admin/login" method="post" class="mt-3">
      <div class="mb-3">
        <label class="form-label" for="username">Username</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-person"></i></span>
          <input name="username" id="username" class="form-control" placeholder="Enter username" required>
        </div>
      </div>
      <div class="mb-3">
        <label class="form-label" for="password">Password</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-lock"></i></span>
          <input name="password" id="password" type="password" class="form-control" placeholder="Enter password" required>
        </div>
      </div>
      <button class="btn-brand w-100" type="submit">Sign In</button>
    </form>
    
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
