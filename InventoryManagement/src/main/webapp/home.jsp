<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to the Inventory</title>

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

/* Custom Navbar */
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

/* Carousel Enhancements */
.carousel {
  height: 70vh;
  overflow: hidden;
}

.carousel-item img {
  height: 70vh;
  object-fit: cover;
  filter: brightness(0.7);
}

.carousel-caption {
  background: rgba(0, 0, 0, 0.3);
  backdrop-filter: blur(10px);
  border-radius: 20px;
  padding: 2rem;
  bottom: 3rem;
  left: 10%;
  right: 10%;
  transform: translateY(20px);
  animation: slideUp 0.6s ease-out forwards;
}

@keyframes slideUp {
  to {
    transform: translateY(0);
  }
}

.carousel-caption h1 {
  font-weight: 700;
  font-size: 3rem;
  margin-bottom: 1rem;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.carousel-caption p {
  font-size: 1.2rem;
  margin-bottom: 2rem;
  opacity: 0.9;
}

/* Enhanced Buttons */
.btn-custom {
  padding: 0.75rem 2rem;
  border-radius: 50px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  transition: all 0.3s ease;
  border: none;
  position: relative;
  overflow: hidden;
}

.btn-custom:before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
  transition: left 0.5s;
}

.btn-custom:hover:before {
  left: 100%;
}

.btn-primary-custom {
  background: linear-gradient(45deg, var(--primary-color), var(--primary-dark));
  color: white;
}

.btn-success-custom {
  background: linear-gradient(45deg, var(--success-color), #059669);
  color: white;
}

.btn-danger-custom {
  background: linear-gradient(45deg, var(--danger-color), #dc2626);
  color: white;
}

/* Feature Box */
.feature-box {
  background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
  border: 1px solid #e2e8f0;
  transition: all 0.3s ease;
}

.feature-box:hover {
  transform: translateY(-5px);
  box-shadow: var(--card-shadow-hover);
}

/* Cards Enhancement */
.card-modern {
  border: none;
  border-radius: 20px;
  overflow: hidden;
  transition: all 0.3s ease;
  background: white;
  box-shadow: var(--card-shadow);
}

.card-modern:hover {
  transform: translateY(-10px);
  box-shadow: var(--card-shadow-hover);
}

.pillar-card {
  border-radius: 20px;
  border: 1px solid #e2e8f0;
  background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.pillar-card:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-color), var(--success-color), var(--warning-color));
}

.pillar-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
}

/* Login Cards */
.login-card {
  border-radius: 25px;
  overflow: hidden;
  transition: all 0.3s ease;
  background: white;
  box-shadow: var(--card-shadow);
  position: relative;
}

.login-card:hover {
  transform: translateY(-15px) scale(1.02);
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.2);
}

.login-card img {
  height: 250px;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.login-card:hover img {
  transform: scale(1.1);
}

.card-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, rgba(37, 99, 235, 0.1) 0%, rgba(16, 185, 129, 0.1) 100%);
  opacity: 0;
  transition: opacity 0.3s ease;
}

.login-card:hover .card-overlay {
  opacity: 1;
}

/* Typography */
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

/* Search Bar */
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

.search-form input:focus {
  background: rgba(255, 255, 255, 0.2);
  border-color: var(--primary-color);
  box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.25);
}

.search-form button {
  border-radius: 50px;
  padding: 0.75rem 1.5rem;
}

/* Responsive Design */
@media (max-width: 768px) {
  .carousel-caption h1 {
    font-size: 2rem;
  }
  
  .carousel-caption {
    left: 5%;
    right: 5%;
    padding: 1.5rem;
  }
  
  .btn-custom {
    padding: 0.6rem 1.5rem;
    margin: 0.25rem;
  }
  /* Footer Link Hover Effects */
.hover-primary:hover {
  color: var(--primary-color) !important;
  opacity: 1 !important;
}
}


</style>


</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <i class="bi bi-archive me-2"></i>
      InventoryPro
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active fw-semibold" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="features.jsp">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="about.jsp">About</a>
        </li>
      </ul>
      
      <form class="d-flex search-form">
        <input class="form-control me-2" type="search" placeholder="Search...">
        <button class="btn btn-outline-light" type="submit">
          <i class="bi bi-search"></i>
        </button>
      </form>
    </div>
  </div>
</nav>

<div style="margin-top: 76px;"></div>

<div id="mainCarousel" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
  </div>
  
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://images.unsplash.com/photo-1560472355-536de3962603?w=1200&auto=format&fit=crop&q=80" class="d-block w-100" alt="Warehouse Management">
      <div class="carousel-caption">
        <h1>Smart Inventory Management</h1>
        <p class="lead">Streamline your business operations with intelligent stock tracking and automated reporting</p>
        <div class="mt-4">
          <button type="button" class="btn btn-custom btn-primary-custom me-3">
            <i class="bi bi-graph-up me-2"></i>Analytics
          </button>
          <button type="button" class="btn btn-custom btn-success-custom me-3">
            <i class="bi bi-gear me-2"></i>Management
          </button>
          <button type="button" class="btn btn-custom btn-danger-custom">
            <i class="bi bi-receipt me-2"></i>Billing
          </button>
        </div>
      </div>
    </div>
    
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=1200&auto=format&fit=crop&q=80" class="d-block w-100" alt="Modern Retail">
      <div class="carousel-caption">
        <h1>Efficient Store Operations</h1>
        <p class="lead">Optimize your retail workflow with real-time inventory updates and seamless transactions</p>
      </div>
    </div>
    
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=1200&auto=format&fit=crop&q=80" class="d-block w-100" alt="Business Growth">
      <div class="carousel-caption">
        <h1>Scale Your Business</h1>
        <p class="lead">From small shops to enterprise-level operations, grow with confidence using our platform</p>
      </div>
    </div>
  </div>
  
  <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<div class="container my-5">
  <div class="p-5 text-center feature-box">
    <i class="bi bi-lightning-charge text-primary mb-3" style="font-size: 3rem;"></i>
    <h2 class="fw-bold text-primary mb-3">Effortless Business Management</h2>
    <p class="fs-5 text-muted">
      Experience next-generation inventory control with intelligent automation, real-time analytics, and secure role-based access for your entire team.
    </p>
  </div>
</div>

<div class="container my-5">
  <h2 class="text-center section-title">Core Features That Drive Success</h2>
  <p class="text-center text-muted mb-5 fs-5">
    Discover the essential tools that make inventory management simple, accurate, and profitable.
  </p>

  <div class="row g-4">
    <div class="col-lg-4 col-md-6">
      <div class="card pillar-card h-100 p-4 text-center">
        <div class="card-body">
          <i class="bi bi-speedometer2 text-primary mb-3" style="font-size: 2.5rem;"></i>
          <h4 class="text-primary fw-bold mb-3">Real-Time Tracking</h4>
          <p class="text-muted">
            Monitor every transaction instantly. Sales, purchases, and returns automatically update your inventory with zero delays or manual intervention.
          </p>
        </div>
      </div>
    </div>

    <div class="col-lg-4 col-md-6">
      <div class="card pillar-card h-100 p-4 text-center">
        <div class="card-body">
          <i class="bi bi-graph-up-arrow text-success mb-3" style="font-size: 2.5rem;"></i>
          <h4 class="text-success fw-bold mb-3">Smart Optimization</h4>
          <p class="text-muted">
            AI-powered insights tell you exactly when to reorder and how much stock to maintain. Eliminate waste and prevent stockouts effortlessly.
          </p>
        </div>
      </div>
    </div>

    <div class="col-lg-4 col-md-6">
      <div class="card pillar-card h-100 p-4 text-center">
        <div class="card-body">
          <i class="bi bi-shield-check text-warning mb-3" style="font-size: 2.5rem;"></i>
          <h4 class="text-warning fw-bold mb-3">Precise Valuation</h4>
          <p class="text-muted">
            Get accurate financial reports and stock valuations in real-time. Keep your business audit-ready and make informed decisions daily.
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container my-5">
  <h2 class="text-center section-title mb-5">Choose Your Access Level</h2>
  
  <div class="row justify-content-center g-5">
    <div class="col-lg-5 col-md-6">
      <div class="card login-card h-100">
        <div class="card-overlay"></div>
        <img src="https://boostedcrm.com/wp-content/uploads/2025/06/Enhancing-Efficiency-with-a-Smart-Inventory-Management-System-1024x683.webp">
        <div class="card-body text-center p-4">
          <div class="mb-3">
            <i class="bi bi-person-gear text-primary" style="font-size: 2.5rem;"></i>
          </div>
          <h5 class="card-title fw-bold mb-3">Admin Control Center</h5>
          <p class="card-text text-muted mb-4">
            Complete system control with advanced analytics, user management, and comprehensive inventory oversight.
          </p>
          <a href="login.jsp" class="btn btn-custom btn-primary-custom">
            <i class="bi bi-box-arrow-in-right me-2"></i>Admin Login
          </a>
        </div>
      </div>
    </div>

    <div class="col-lg-5 col-md-6">
      <div class="card login-card h-100">
        <div class="card-overlay"></div>
        <img src="https://img.freepik.com/free-photo/futuristic-technology-concept_23-2151908129.jpg?semt=ais_hybrid&w=740&q=80" alt="Staff Interface">
        <div class="card-body text-center p-4">
          <div class="mb-3">
            <i class="bi bi-people-fill text-success" style="font-size: 2.5rem;"></i>
          </div>
          <h5 class="card-title fw-bold mb-3">Staff Dashboard</h5>
          <p class="card-text text-muted mb-4">
            Streamlined interface for daily operations, quick billing, inventory updates, and customer transactions.
          </p>
          <a href="login.jsp" class="btn btn-custom btn-success-custom">
            <i class="bi bi-box-arrow-in-right me-2"></i>Staff Login
          </a>
        </div>
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

  const carousel = new bootstrap.Carousel(document.getElementById('mainCarousel'), {
    interval: 5000,
    wrap: true
  });
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
  
  document.querySelectorAll('.card').forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(20px)';
    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
    observer.observe(card);
  });
});
</script>


</body>
</html>
