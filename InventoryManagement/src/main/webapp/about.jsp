<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - InventoryPro</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>

:root {
  --primary-color: #2563eb;
  --primary-dark: #1d4ed8;
  --secondary-color: #64748b;
  --success-color: #10b981;
  --danger-color: #ef4444;
  --warning-color: #f59e0b;
  --light-bg: #f8fafc;
  --dark-bg: #0f172a;
  --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  --card-shadow-hover: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Inter', sans-serif;
  line-height: 1.6;
  color: #334155;
  background-color: #ffffff;
}

.navbar-custom {
  background: linear-gradient(135deg, var(--dark-bg) 0%, #1e293b 100%);
  backdrop-filter: blur(10px);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  padding: 1rem 0;
}

.navbar-brand {
  font-weight: 700;
  font-size: 1.5rem;
  color: #fff !important;
}

.navbar-brand i {
  background: linear-gradient(45deg, var(--primary-color), var(--success-color));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  font-size: 1.8rem;
}

.hero-section {
  background: linear-gradient(135deg, var(--dark-bg) 0%, #1e293b 100%);
  color: white;
  padding: 120px 0 80px 0;
  margin-top: 76px;
  position: relative;
  overflow: hidden;
}

.hero-section::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%232563eb" fill-opacity="0.1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,101.3C1248,85,1344,75,1392,69.3L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
  background-size: cover;
}

.hero-section h1 {
  font-size: 3.5rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
}

.hero-section p {
  font-size: 1.3rem;
  opacity: 0.9;
  max-width: 700px;
  margin: 0 auto;
}

.section-title {
  font-weight: 700;
  color: var(--dark-bg);
  margin-bottom: 3rem;
  position: relative;
  display: inline-block;
}

.section-title:after {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-color), var(--success-color));
  border-radius: 2px;
}

.stats-card {
  background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
  border-radius: 20px;
  padding: 2rem;
  text-align: center;
  border: 1px solid #e2e8f0;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.stats-card:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-color), var(--success-color));
}

.stats-card:hover {
  transform: translateY(-10px);
  box-shadow: var(--card-shadow-hover);
}

.stats-card i {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.stats-number {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--primary-color);
  margin-bottom: 0.5rem;
}

.stats-label {
  color: var(--secondary-color);
  font-weight: 500;
}

.mission-card {
  background: white;
  border-radius: 20px;
  padding: 3rem;
  box-shadow: var(--card-shadow);
  transition: all 0.3s ease;
  height: 100%;
}

.mission-card:hover {
  transform: translateY(-5px);
  box-shadow: var(--card-shadow-hover);
}

.mission-icon {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
  margin-bottom: 1.5rem;
}

.mission-icon.primary {
  background: linear-gradient(135deg, rgba(37, 99, 235, 0.1) 0%, rgba(37, 99, 235, 0.2) 100%);
  color: var(--primary-color);
}

.mission-icon.success {
  background: linear-gradient(135deg, rgba(16, 185, 129, 0.1) 0%, rgba(16, 185, 129, 0.2) 100%);
  color: var(--success-color);
}

.mission-icon.warning {
  background: linear-gradient(135deg, rgba(245, 158, 11, 0.1) 0%, rgba(245, 158, 11, 0.2) 100%);
  color: var(--warning-color);
}

.team-card {
  background: white;
  border-radius: 20px;
  overflow: hidden;
  box-shadow: var(--card-shadow);
  transition: all 0.3s ease;
  border: 1px solid #e2e8f0;
}

.team-card:hover {
  transform: translateY(-10px);
  box-shadow: var(--card-shadow-hover);
}

.team-image {
  height: 280px;
  background: linear-gradient(135deg, var(--primary-color) 0%, var(--success-color) 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
}

.team-image i {
  font-size: 6rem;
  color: white;
  opacity: 0.9;
}

.team-content {
  padding: 2rem;
  text-align: center;
}

.team-name {
  font-size: 1.3rem;
  font-weight: 700;
  color: var(--dark-bg);
  margin-bottom: 0.5rem;
}

.team-role {
  color: var(--primary-color);
  font-weight: 600;
  margin-bottom: 1rem;
}

.team-bio {
  color: var(--secondary-color);
  font-size: 0.95rem;
}

.value-item {
  padding: 2rem;
  background: linear-gradient(135deg, #f8fafc 0%, #ffffff 100%);
  border-radius: 15px;
  border-left: 4px solid var(--primary-color);
  margin-bottom: 1.5rem;
  transition: all 0.3s ease;
}

.value-item:hover {
  transform: translateX(10px);
  box-shadow: var(--card-shadow);
}

.value-item h5 {
  color: var(--dark-bg);
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.value-item p {
  color: var(--secondary-color);
  margin: 0;
}

.search-form input {
  border-radius: 50px;
  border: 1px solid rgba(255, 255, 255, 0.3);
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  color: white;
  padding: 0.75rem 1.5rem;
}

.search-form input::placeholder {
  color: rgba(255, 255, 255, 0.7);
}

.hover-primary:hover {
  color: var(--primary-color) !important;
  opacity: 1 !important;
}
.search-form input:focus {
  background: rgba(255, 255, 255, 0.2);
  border-color: var(--primary-color);
  box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.25);
}

.search-form button {
  border-radius: 50px;
  padding: 0.75rem 1.5rem;
}

@media (max-width: 768px) {
  .hero-section h1 {
    font-size: 2.5rem;
  }
  
  .hero-section p {
    font-size: 1.1rem;
  }
  
  .stats-number {
    font-size: 2rem;
  }
}

</style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="home.jsp">
      <i class="bi bi-archive me-2"></i>
      InventoryPro
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="features.jsp">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active fw-semibold" href="about.jsp">About</a>
        </li>
      </ul>
      
      <form class="d-flex search-form">
        <input class="form-control me-2" type="search" placeholder="Search products...">
        <button class="btn btn-outline-light" type="submit">
          <i class="bi bi-search"></i>
        </button>
      </form>
    </div>
  </div>
</nav>

<section class="hero-section">
  <div class="container text-center">
    <h1>About InventoryPro</h1>
    <p class="lead">Revolutionizing inventory management with intelligent automation and powerful insights for businesses of all sizes.</p>
  </div>
</section>

<div class="container my-5 py-5">
  <div class="row g-4 mb-5">
    <div class="col-lg-3 col-md-6">
      <div class="stats-card">
        <i class="bi bi-people-fill text-primary"></i>
        <div class="stats-number">10,000+</div>
        <div class="stats-label">Active Users</div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="stats-card">
        <i class="bi bi-building text-success"></i>
        <div class="stats-number">500+</div>
        <div class="stats-label">Businesses Served</div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="stats-card">
        <i class="bi bi-graph-up text-warning"></i>
        <div class="stats-number">99.9%</div>
        <div class="stats-label">Uptime</div>
      </div>
    </div>
    <div class="col-lg-3 col-md-6">
      <div class="stats-card">
        <i class="bi bi-award text-danger"></i>
        <div class="stats-number">50M+</div>
        <div class="stats-label">Transactions</div>
      </div>
    </div>
  </div>
</div>



<div class="container my-5 py-5">
  <h2 class="text-center section-title mb-5">Meet Our Team</h2>
  <p class="text-center text-muted mb-5 fs-5">
    Passionate professionals dedicated to transforming inventory management
  </p>
  
  <div class="row g-4">
    <div class="col-lg-4 col-md-6">
      <div class="team-card">
        <div class="team-image" style="background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);">
          <i class="bi bi-person-circle"></i>
        </div>
        <div class="team-content">
          <div class="team-name">Pushpak Aher</div>
          <div class="team-role">Chief Executive Officer</div>
          <p class="team-bio">
            15+ years of experience in enterprise software development and business strategy. Leading InventoryPro's vision and growth.
          </p>
        </div>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="team-card">
        <div class="team-image" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%);">
          <i class="bi bi-person-circle"></i>
        </div>
        <div class="team-content">
          <div class="team-name">Harshad More</div>
          <div class="team-role">Chief Technology Officer</div>
          <p class="team-bio">
            Expert in cloud architecture and AI/ML integration. Driving innovation and technical excellence across our platform.
          </p>
        </div>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="team-card">
        <div class="team-image" style="background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);">
          <i class="bi bi-person-circle"></i>
        </div>
        <div class="team-content">
          <div class="team-name">Suvarna Sansare</div>
          <div class="team-role">Head of Customer Success</div>
          <p class="team-bio">
            Passionate about customer satisfaction and user experience. Ensuring every client achieves their inventory management goals.
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container my-5 py-5">
  <h2 class="text-center section-title mb-5">Our Core Values</h2>
  
  <div class="row">
    <div class="col-lg-6">
      <div class="value-item">
        <h5><i class="bi bi-lightbulb text-primary me-2"></i>Innovation First</h5>
        <p>We continuously push boundaries to deliver cutting-edge solutions that anticipate and meet evolving business needs.</p>
      </div>
      
      <div class="value-item">
        <h5><i class="bi bi-shield-check text-success me-2"></i>Trust & Security</h5>
        <p>Your data security is paramount. We maintain the highest standards of protection and compliance across our platform.</p>
      </div>
      
      <div class="value-item">
        <h5><i class="bi bi-people text-warning me-2"></i>Customer Centricity</h5>
        <p>Every decision we make is guided by our commitment to delivering exceptional value and support to our clients.</p>
      </div>
    </div>
    
    <div class="col-lg-6">
      <div class="value-item">
        <h5><i class="bi bi-star text-danger me-2"></i>Excellence</h5>
        <p>We strive for perfection in every aspect of our service, from product quality to customer support and beyond.</p>
      </div>
      
      <div class="value-item">
        <h5><i class="bi bi-graph-up-arrow text-info me-2"></i>Continuous Growth</h5>
        <p>We invest in learning, adapting, and growing alongside our customers and the evolving market landscape.</p>
      </div>
      
      <div class="value-item">
        <h5><i class="bi bi-hand-thumbs-up text-primary me-2"></i>Transparency</h5>
        <p>We believe in open, honest communication with our customers, partners, and team members at all times.</p>
      </div>
    </div>
  </div>
</div>

<footer class="bg-dark text-light py-5 mt-5">
  <div class="container">
    <div class="row g-4">
      <!-- Brand Section -->
      <div class="col-lg-4 col-md-6">
        <h5 class="fw-bold mb-3 text-white">
          <i class="bi bi-archive me-2 text-primary"></i>InventoryPro
        </h5>
        <p class="text-white-50 mb-4">
          Empowering businesses with intelligent inventory management solutions since 2020.
        </p>
        <div class="d-flex gap-3">
          <a href="#" class="text-white hover-primary" style="font-size: 1.5rem; transition: color 0.3s;">
            <i class="bi bi-facebook"></i>
          </a>
          <a href="#" class="text-white hover-primary" style="font-size: 1.5rem; transition: color 0.3s;">
            <i class="bi bi-twitter"></i>
          </a>
          <a href="#" class="text-white hover-primary" style="font-size: 1.5rem; transition: color 0.3s;">
            <i class="bi bi-linkedin"></i>
          </a>
          <a href="#" class="text-white hover-primary" style="font-size: 1.5rem; transition: color 0.3s;">
            <i class="bi bi-instagram"></i>
          </a>
        </div>
      </div>

      <!-- Quick Links -->
      <div class="col-lg-2 col-md-6">
        <h6 class="fw-bold mb-3 text-white">Product</h6>
        <ul class="list-unstyled">
          <li class="mb-2">
            <a href="features.jsp" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Features</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Pricing</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Demo</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Integrations</a>
          </li>
        </ul>
      </div>

      <!-- Company -->
      <div class="col-lg-2 col-md-6">
        <h6 class="fw-bold mb-3 text-white">Company</h6>
        <ul class="list-unstyled">
          <li class="mb-2">
            <a href="about.jsp" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">About Us</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Careers</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Blog</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Contact</a>
          </li>
        </ul>
      </div>

      <!-- Support -->
      <div class="col-lg-2 col-md-6">
        <h6 class="fw-bold mb-3 text-white">Support</h6>
        <ul class="list-unstyled">
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Help Center</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Documentation</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">API Reference</a>
          </li>
          <li class="mb-2">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Status</a>
          </li>
        </ul>
      </div>

      <!-- Contact Info -->
      <div class="col-lg-2 col-md-6">
        <h6 class="fw-bold mb-3 text-white">Contact</h6>
        <ul class="list-unstyled">
          <li class="mb-2 text-white" style="opacity: 0.8; font-size: 0.9rem;">
            <i class="bi bi-envelope me-2"></i>support@inventorypro.com
          </li>
          <li class="mb-2 text-white" style="opacity: 0.8; font-size: 0.9rem;">
            <i class="bi bi-telephone me-2"></i>+1 (555) 123-4567
          </li>
          <li class="mb-2 text-white" style="opacity: 0.8; font-size: 0.9rem;">
            <i class="bi bi-geo-alt me-2"></i>San Francisco, CA
          </li>
        </ul>
      </div>
    </div>

    <!-- Bottom Bar -->
    <hr class="my-4" style="border-color: rgba(255, 255, 255, 0.1);">
    
    <div class="row align-items-center">
      <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
        <p class="text-white mb-0" style="opacity: 0.7;">© 2024 InventoryPro. All rights reserved.</p>
      </div>
      <div class="col-md-6 text-center text-md-end">
        <ul class="list-inline mb-0">
          <li class="list-inline-item">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Privacy Policy</a>
          </li>
          <li class="list-inline-item">
            <span class="text-white" style="opacity: 0.5;">•</span>
          </li>
          <li class="list-inline-item">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Terms of Service</a>
          </li>
          <li class="list-inline-item">
            <span class="text-white" style="opacity: 0.5;">•</span>
          </li>
          <li class="list-inline-item">
            <a href="#" class="text-white text-decoration-none hover-primary" style="transition: color 0.3s; opacity: 0.8;">Cookie Policy</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
  const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
  };
  
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.style.opacity = '1';
        entry.target.style.transform = 'translateY(0)';
      }
    });
  }, observerOptions);
  
  document.querySelectorAll('.stats-card, .mission-card, .team-card, .value-item').forEach(element => {
    element.style.opacity = '0';
    element.style.transform = 'translateY(20px)';
    element.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
    observer.observe(element);
  });
});
</script>

</body>
</html>
