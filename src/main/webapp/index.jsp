<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sahakclub.model.Club" %>
<%
    List<Club> clubs = (List<Club>) request.getAttribute("clubs");
    if (clubs == null) {
        // If someone opens root directly, fetch clubs by forwarding to /clubs
        response.sendRedirect(request.getContextPath() + "/clubs");
        return;
    }
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>DCSA - SAHAK Clubs</title>
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/dcsa_logo.png">
  <!-- Preload critical resources for faster loading -->
  <link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin>
  <link rel="preconnect" href="https://unpkg.com" crossorigin>
  <link rel="dns-prefetch" href="https://cdn.jsdelivr.net">
  <link rel="dns-prefetch" href="https://unpkg.com">
  <!-- CSS files - loaded in parallel -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg brand-nav py-3">
  <div class="container">
    <a class="navbar-brand" href="#home">SAHAK • DCSA Clubs</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" href="#home">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
        <li class="nav-item"><a class="nav-link" href="#clubsSection">Clubs</a></li>
        <li class="nav-item"><a class="nav-link" href="#connect">Connect</a></li>
      </ul>
      <a class="btn btn-outline-light ms-lg-3" href="${pageContext.request.contextPath}/admin/login">Admin Portal</a>
    </div>
  </div>
</nav>

<header class="hero-shell" id="home">
  <div class="container">
    <div class="row align-items-center gy-5">
      <div class="col-lg-6 hero-content" data-aos="fade-right">
        <span class="hero-badge"><i class="bi bi-stars"></i> Department Clubs Collective</span>
        <h1 class="hero-title">Department of Computer Science &amp; Applications</h1>
        <p class="hero-subtitle">SAHAK brings every innovation-driven club &amp; cell under one roof. Explore collaborations, upcoming initiatives, student coordinators and the energy driving DCSA Panjab University.</p>
        <div class="d-flex flex-wrap align-items-center gap-3 mt-4">
          <a href="#clubsSection" class="btn-brand">Browse Clubs</a>
          <a href="#about" class="btn-ghost">Why DCSA?</a>
        </div>
        <ul class="list-inline mt-4">
          <li>Innovation</li>
          <li>Community</li>
          <li>Research</li>
          <li>Leadership</li>
        </ul>
      </div>
      <div class="col-lg-6" data-aos="zoom-in">
        <div class="image-frame">
          <img src="${pageContext.request.contextPath}/images/dcsa_logo.png" alt="DCSA Logo">
        </div>
      </div>
        </div>
      </div>
</header>

<section class="py-5" id="about">
  <div class="container">
    <div class="row gy-4 align-items-stretch">
      <div class="col-lg-6" data-aos="fade-up">
        <div class="floating-card h-100">
          <h3>Experience Learning Beyond Classrooms</h3>
          <p class="mb-3">The Department of Computer Science &amp; Applications (DCSA) at Panjab University empowers students with cutting-edge curriculum, research-driven opportunities and industry collaborations. SAHAK helps students discover every club, event and initiative with clarity.</p>
          <div class="chip mt-2"><i class="bi bi-lightning-charge"></i> Driven by students &amp; mentors</div>
        </div>
      </div>
      <div class="col-lg-6" data-aos="fade-up" data-aos-delay="120">
        <div class="row g-3">
          <div class="col-sm-6">
            <div class="stat-chip">
              <span>Programs</span>
              <span>M.C.A • Msc</span>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="stat-chip">
              <span>Active Clubs</span>
              <span><%= clubs.size() %>+</span>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="stat-chip">
              <span>Research Areas</span>
              <span>AI •ML  •Databse</span>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="stat-chip">
              <span>Student Leaders</span>
              <span>50+ mentors</span>
            </div>
          </div>
        </div>
         </div>
    </div>
  </div>
</section>

<section class="py-5" id="highlights">
  <div class="container">
    <div class="section-heading" data-aos="fade-up">
      <div>
        <h2>What Makes Our Clubs Special</h2>
        <p>Hands-on projects, community outreach and a culture of mentorship.</p>
      </div>
      <div class="filter-pill"><i class="bi bi-people"></i> For students, by students</div>
    </div>
    <div class="row g-4">
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="60">
        <div class="glass-card h-100">
          <h5>Industry Guided</h5>
          <p class="mb-0">Clubs actively collaborate with professionals and alumni to bring real-world problems, bootcamps and upskilling sprints.</p>
        </div>
      </div>
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="120">
        <div class="glass-card h-100">
          <h5>Inclusive Community</h5>
          <p class="mb-0">SAHAK ensures every student finds a domain to explore — coding, design, research, entrepreneurship, social impact and more.</p>
        </div>
      </div>
      <div class="col-md-4" data-aos="fade-up" data-aos-delay="180">
        <div class="glass-card h-100">
          <h5>Events &amp; Showcases</h5>
          <p class="mb-0">Stay updated with hackathons, workshops, outreach drives and flagship events conducted round the year.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="py-5" id="clubsSection">
  <div class="container">
    <div class="section-heading" data-aos="fade-up">
      <div>
        <h2>Explore SAHAK Clubs</h2>
        <p>Search and discover clubs that match your interest areas.</p>
      </div>
      <div class="search-bar">
        <i class="bi bi-search"></i>
        <input id="clubSearch" type="search" placeholder="Search by club name, coordinator or keywords" aria-label="Search clubs">
      </div>
    </div>

    <div class="row g-4" id="clubsGrid">
      <% if (clubs.isEmpty()) { %>
        <div class="col-12">
          <div class="empty-state">No clubs registered yet. Check back soon!</div>
        </div>
      <% } else {
           for (Club c : clubs) {
               String name = c.getName() != null ? c.getName() : "";
               String description = c.getDescription() != null ? c.getDescription() : "";
               String faculty = c.getFacultyCoordinator() != null ? c.getFacultyCoordinator() : "";
               String student = c.getStudentCoordinator() != null ? c.getStudentCoordinator() : "";
               String rawImage = c.getImageUrl();
               String imageFile = (rawImage != null && !rawImage.isEmpty()) ? rawImage : "placeholder.png";
               if (imageFile.contains("/") || imageFile.contains("\\")) {
                   imageFile = new java.io.File(imageFile).getName();
               }
               String imagePath = request.getContextPath() + "/images/" + imageFile;
      %>
        <div class="col-md-6 col-xl-4" data-aos="fade-up">
          <div class="card club-card" data-search="<%= (name + " " + description + " " + faculty + " " + student).toLowerCase() %>">
            <img src="<%= imagePath %>" alt="<%= name %> club poster" loading="lazy" decoding="async">
                  <div class="card-body">
              <span class="chip"><i class="bi bi-person-workspace"></i> Coordinated by <%= faculty.isEmpty() ? "Team" : faculty %></span>
              <h5 class="card-title"><%= name %></h5>
              <p class="card-text"><%= (description != null && description.length() > 150) ? description.substring(0, 147) + "..." : (description != null ? description : "No description available.") %></p>
              <div class="d-flex justify-content-between align-items-center">
                <a href="${pageContext.request.contextPath}/club?id=<%= c.getId() %>" class="btn-brand">View Details</a>
                <small class="text-muted">Student Lead: <%= student.isEmpty() ? "TBA" : student %></small>
              </div>
                 </div>
               </div>
             </div>
      <%     }
         } %>
    </div>
    <div class="text-center d-none" id="noResults">
      <div class="empty-state mt-4">No clubs match your search right now. Try a different keyword.</div>
    </div>
  </div>
</section>

<section class="py-5" id="connect">
  <div class="container">
    <div class="row gy-4 align-items-center">
      <div class="col-lg-7" data-aos="fade-right">
        <h2>Connect With DCSA SAHAK</h2>
        <p class="mb-4">Have an idea for a new club or want to collaborate for events? Reach out to the SAHAK coordination team — we love co-creating with students, faculty, alumni and partners.</p>
        <div class="row g-3">
          <div class="col-md-6">
            <div class="glass-card">
              <h6 class="mb-1">Drop an email</h6>
              <a href="mailto:chairpersondcsa@pu.ac.in" class="text-decoration-none">chairpersondcsa@pu.ac.in</a>
            </div>
          </div>
      <div class="col-md-6">
            <div class="glass-card">
              <h6 class="mb-1">Visit Us</h6>
              <p class="mb-0">Top Floor C.I.L Building Panjab University sector 14 Chandigarh</p>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-5" data-aos="fade-left">
        <div class="floating-card">
          <h4>Become a Student Leader</h4>
          <p class="mb-4">Tell us how you want to contribute or lead initiatives — SAHAK enables mentorship, resources and visibility for your ideas.</p>
          <a href="mailto:chairpersondcsa@pu.ac.in?subject=SAHAK%20Club%20Inquiry" class="btn-brand w-100 text-center">Start a Conversation</a>
        </div>
      </div>
    </div>
  </div>
</section>

<footer class="footer-shell">
  <div class="container">
    <div class="row gy-4 align-items-center">
      <div class="col-lg-7">
        <h5>Department of Computer Science &amp; Applications</h5>
        <p class="mb-2">Panjab University, Chandigarh</p>
        <p class="mb-0">Contact: chairpersondcsa@pu.ac.in • +91-1722534063</p>
        <p class="tagline mt-3">Built for the DCSA community</p>
      </div>
      <div class="col-lg-5 text-lg-end">
        <div class="footer-badge">SAHAK • Student &amp; Alumni Hub for Aspirational Knowledge</div>
        <p class="mt-3 mb-0 small">Crafted by Sahak — DCSA Portal</p>
      </div>
    </div>
  </div>
</footer>

<!-- Defer non-critical scripts for faster page load -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" defer></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js" defer></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js" defer></script>
<script>
  // Initialize AOS after page load
  document.addEventListener('DOMContentLoaded', function() {
    if (typeof AOS !== 'undefined') {
      AOS.init({ duration: 700, once: true });
    }
  });
</script>
</body>
</html>
