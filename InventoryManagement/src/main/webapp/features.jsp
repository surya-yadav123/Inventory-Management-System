<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Features - InventoryPro</title>

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
  --info-color: #3b82f6;
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

/* Hero Section */
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
  background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%2310b981" fill-opacity="0.1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,101.3C1248,85,1344,75,1392,69.3L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
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

/* Section Title */
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

/* Feature Cards */
.feature-card {
  background: white;
  border-radius: 20px;
  padding: 2.5rem;
  box-shadow: var(--card-shadow);
  transition: all 0.3s ease;
  border: 1px solid #e2e8f0;
  height: 100%;
  position: relative;
  overflow: hidden;
}

.feature-card:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, var(--primary-color), var(--success-color));
}

.feature-card:hover {
  transform: translateY(-10px);
  box-shadow: var(--card-shadow-hover);
}

.feature-icon {
  width: 70px;
  height: 70px;
  border-radius: 15px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
  margin-bottom: 1.5rem;
}

.feature-icon.primary {
  background: linear-gradient(135deg, rgba(37, 99, 235, 0.1) 0%, rgba(37, 99, 235, 0.2) 100%);
  color: var(--primary-color);
}

.feature-icon.success {
  background: linear-gradient(135deg, rgba(16, 185, 129, 0.1) 0%, rgba(16, 185, 129, 0.2) 100%);
  color: var(--success-color);
}

.feature-icon.warning {
  background: linear-gradient(135deg, rgba(245, 158, 11, 0.1) 0%, rgba(245, 158, 11, 0.2) 100%);
  color: var(--warning-color);
}

.feature-icon.danger {
  background: linear-gradient(135deg, rgba(239, 68, 68, 0.1) 0%, rgba(239, 68, 68, 0.2) 100%);
  color: var(--danger-color);
}

.feature-icon.info {
  background: linear-gradient(135deg, rgba(59, 130, 246, 0.1) 0%, rgba(59, 130, 246, 0.2) 100%);
  color: var(--info-color);
}

.feature-card h4 {
  font-weight: 700;
  color: var(--dark-bg);
  margin-bottom: 1rem;
}

.feature-card p {
  color: var(--secondary-color);
  margin: 0;
}

/* Detailed Feature Section */
.detailed-feature {
  padding: 4rem 0;
  background: linear-gradient(135deg, #f8fafc 0%, #ffffff 100%);
}

.detailed-feature:nth-child(even) {
  background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
}

.feature-image {
  width: 100%;
  height: 400px;
  border-radius: 20px;
  background: linear-gradient(135deg, var(--primary-color) 0%, var(--success-color) 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: var(--card-shadow-hover);
}

.feature-image i {
  font-size: 8rem;
  color: white;
  opacity: 0.9;
}

.feature-content h3 {
  font-size: 2rem;
  font-weight: 700;
  color: var(--dark-bg);
  margin-bottom: 1.5rem;
}

.feature-content ul {
  list-style: none;
  padding: 0;
}

.feature-content ul li {
  padding: 0.75rem 0;
  color: var(--secondary-color);
  position: relative;
  padding-left: 2rem;
}

.feature-content ul li:before {
  content: '\F26B';
  font-family: 'Bootstrap-icons';
  position: absolute;
  left: 0;
  color: var(--success-color);
  font-weight: bold;
}

/* Benefits Grid */
.benefit-item {
  background: white;
  padding: 2rem;
  border-radius: 15px;
  border-left: 4px solid var(--primary-color);
  box-shadow: var(--card-shadow);
  transition: all 0.3s ease;
  margin-bottom: 1.5rem;
}

.benefit-item:hover {
  transform: translateX(10px);
  box-shadow: var(--card-shadow-hover);
}

.benefit-item h5 {
  font-weight: 700;
  color: var(--dark-bg);
  margin-bottom: 0.5rem;
  display: flex;
  align-items: center;
}

.benefit-item h5 i {
  margin-right: 0.75rem;
  font-size: 1.5rem;
}

.benefit-item p {
  color: var(--secondary-color);
  margin: 0;
}

/* CTA Section */
.cta-section {
  background: linear-gradient(135deg, var(--dark-bg) 0%, #1e293b 100%);
  color: white;
  padding: 5rem 0;
  border-radius: 30px;
  position: relative;
  overflow: hidden;
}

.cta-section::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: radial-gradient(circle at 20% 50%, rgba(37, 99, 235, 0.2) 0%, transparent 50%),
              radial-gradient(circle at 80% 50%, rgba(16, 185, 129, 0.2) 0%, transparent 50%);
}

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
/* Footer Link Hover Effects */
.hover-primary:hover {
  color: var(--primary-color) !important;
  opacity: 1 !important;
}
.search-form button {
  border-radius: 50px;
  padding: 0.75rem 1.5rem;
}

/* Responsive */
@media (max-width: 768px) {
  .hero-section h1 {
    font-size: 2.5rem;
  }
  
  .hero-section p {
    font-size: 1.1rem;
  }
  
  .feature-image {
    height: 300px;
  }
  
  .feature-image i {
    font-size: 5rem;
  }
  
  .detailed-feature {
    padding: 2rem 0;
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
          <a class="nav-link active fw-semibold" href="features.jsp">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-semibold" href="about.jsp">About</a>
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
    <h1>Powerful Features</h1>
    <p class="lead">Discover the comprehensive tools and capabilities that make InventoryPro the ultimate solution for modern inventory management.</p>
  </div>
</section>

<div class="container my-5 py-5">
  <h2 class="text-center section-title mb-5">Core Features</h2>
  
  <div class="row g-4">
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon primary">
          <i class="bi bi-lightning-charge"></i>
        </div>
        <h4>Real-Time Inventory Tracking</h4>
        <p>Monitor stock levels instantly across all locations. Automatic updates ensure you always have accurate visibility into your inventory status.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon success">
          <i class="bi bi-bar-chart"></i>
        </div>
        <h4>Advanced Analytics</h4>
        <p>Gain deep insights with customizable reports, trend analysis, and predictive forecasting to make data-driven decisions.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon warning">
          <i class="bi bi-receipt"></i>
        </div>
        <h4>Smart Billing System</h4>
        <p>Generate professional invoices automatically, track payments, and manage customer accounts with ease.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon danger">
          <i class="bi bi-shield-lock"></i>
        </div>
        <h4>Role-Based Access</h4>
        <p>Secure your data with granular permission controls. Define user roles and restrict access to sensitive information.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon info">
          <i class="bi bi-bell"></i>
        </div>
        <h4>Smart Alerts</h4>
        <p>Receive automated notifications for low stock, expiring products, and unusual activities. Never miss critical events.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon primary">
          <i class="bi bi-cloud-arrow-up"></i>
        </div>
        <h4>Cloud-Based Platform</h4>
        <p>Access your inventory from anywhere, anytime. Secure cloud storage ensures your data is always available and backed up.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon success">
          <i class="bi bi-phone"></i>
        </div>
        <h4>Mobile Ready</h4>
        <p>Manage inventory on-the-go with our responsive mobile interface. Perfect for warehouse operations and field work.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon warning">
          <i class="bi bi-arrow-repeat"></i>
        </div>
        <h4>Automated Reordering</h4>
        <p>Set reorder points and let the system automatically generate purchase orders when stock runs low.</p>
      </div>
    </div>
    
    <div class="col-lg-4 col-md-6">
      <div class="feature-card">
        <div class="feature-icon danger">
          <i class="bi bi-filetype-csv"></i>
        </div>
        <h4>Import & Export</h4>
        <p>Seamlessly import existing data and export reports in multiple formats including CSV, Excel, and PDF.</p>
      </div>
    </div>
  </div>
</div>

<section class="detailed-feature">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-6 mb-4 mb-lg-0">
        <div class="feature-image">
          <i class="bi bi-graph-up-arrow"></i>
        </div>
      </div>
      <div class="col-lg-6 feature-content">
        <h3>Intelligent Analytics Dashboard</h3>
        <p class="text-muted mb-4">Transform raw data into actionable insights with our comprehensive analytics suite.</p>
        <ul>
          <li>Customizable KPI dashboards with real-time metrics</li>
          <li>Sales performance tracking and trend analysis</li>
          <li>Inventory turnover ratio calculations</li>
          <li>Profit margin analysis by product category</li>
          <li>Predictive demand forecasting using AI</li>
          <li>Visual reports with interactive charts and graphs</li>
          <li>Export reports in multiple formats for presentations</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section class="detailed-feature">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-6 order-lg-2 mb-4 mb-lg-0">
        <div class="feature-image" style="background: linear-gradient(135deg, var(--success-color) 0%, #059669 100%);">
          <i class="bi bi-gear-fill"></i>
        </div>
      </div>
      <div class="col-lg-6 order-lg-1 feature-content">
        <h3>Complete Inventory Management</h3>
        <p class="text-muted mb-4">Take full control of your stock with powerful management tools.</p>
        <ul>
          <li>Multi-location inventory tracking and transfers</li>
          <li>Barcode scanning for quick item identification</li>
          <li>Batch and serial number tracking</li>
          <li>Product categorization and variant management</li>
          <li>Expiration date monitoring and alerts</li>
          <li>Stock adjustment and audit trail logging</li>
          <li>Supplier management and purchase order tracking</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section class="detailed-feature">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-6 mb-4 mb-lg-0">
        <div class="feature-image" style="background: linear-gradient(135deg, var(--warning-color) 0%, #d97706 100%);">
          <i class="bi bi-credit-card"></i>
        </div>
      </div>
      <div class="col-lg-6 feature-content">
        <h3>Streamlined Billing & Invoicing</h3>
        <p class="text-muted mb-4">Professional billing tools to accelerate your cash flow and improve customer experience.</p>
        <ul>
          <li>Quick point-of-sale interface for fast transactions</li>
          <li>Professional invoice templates with customization</li>
          <li>Multiple payment method support</li>
          <li>Automatic tax calculations and compliance</li>
          <li>Customer credit management and history</li>
          <li>Email invoices directly to customers</li>
          <li>Payment tracking and reminder automation</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<div class="container my-5 py-5">
  <h2 class="text-center section-title mb-5">Business Benefits</h2>
  <p class="text-center text-muted mb-5 fs-5">
    See how InventoryPro transforms your operations and drives growth
  </p>
  
  <div class="row">
    <div class="col-lg-6">
      <div class="benefit-item">
        <h5>
          <i class="bi bi-clock-history text-primary"></i>
          Save Time & Reduce Errors
        </h5>
        <p>Automate manual tasks and eliminate data entry errors. Free your team to focus on strategic activities instead of paperwork.</p>
      </div>
      
      <div class="benefit-item">
        <h5>
          <i class="bi bi-currency-dollar text-success"></i>
          Optimize Costs
        </h5>
        <p>Reduce carrying costs by maintaining optimal stock levels. Prevent overstocking and stockouts with intelligent forecasting.</p>
      </div>
      
      <div class="benefit-item">
        <h5>
          <i class="bi bi-emoji-smile text-warning"></i>
          Improve Customer Satisfaction
        </h5>
        <p>Always have the right products in stock. Faster checkout and accurate order fulfillment lead to happier customers.</p>
      </div>
    </div>
    
    <div class="col-lg-6">
      <div class="benefit-item">
        <h5>
          <i class="bi bi-speedometer2 text-danger"></i>
          Increase Efficiency
        </h5>
        <p>Streamline operations with integrated workflows. From procurement to sales, everything works seamlessly together.</p>
      </div>
      
      <div class="benefit-item">
        <h5>
          <i class="bi bi-graph-up text-info"></i>
          Make Better Decisions
        </h5>
        <p>Access real-time data and comprehensive reports. Make informed decisions backed by accurate insights and analytics.</p>
      </div>
      
      <div class="benefit-item">
        <h5>
          <i class="bi bi-shield-check text-success"></i>
          Ensure Compliance
        </h5>
        <p>Maintain accurate records and audit trails. Meet regulatory requirements with built-in compliance features.</p>
      </div>
    </div>
  </div>
</div>

<div class="container my-5">
  <div class="cta-section text-center p-5">
    <div class="position-relative">
      <h2 class="fw-bold mb-4">Ready to Transform Your Inventory Management?</h2>
      <p class="lead mb-4">Join thousands of businesses that trust InventoryPro for their operations</p>
      <a href="login.jsp" class="btn btn-custom btn-primary-custom btn-lg">
        <i class="bi bi-rocket-takeoff me-2"></i>Get Started Today
      </a>
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
  
  document.querySelectorAll('.feature-card, .benefit-item, .feature-image').forEach(element => {
    element.style.opacity = '0';
    element.style.transform = 'translateY(20px)';
    element.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
    observer.observe(element);
  });
});
</script>

</body>
</html>
