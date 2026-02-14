<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Staff" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - InventoryPro</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  --primary: #4F46E5;
  --primary-dark: #4338CA;
  --primary-light: #EEF2FF;
  --secondary: #10B981;
  --secondary-dark: #059669;
  --accent: #F59E0B;
  --danger: #EF4444;
  --text-primary: #1F2937;
  --text-secondary: #6B7280;
  --text-light: #9CA3AF;
  --bg-primary: #F9FAFB;
  --bg-secondary: #FFFFFF;
  --border: #E5E7EB;
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  
  --primary-color: #2563eb;
  --primary-dark-color: #1d4ed8;
  --success-color: #10b981;
  --danger-color: #ef4444;
  --warning-color: #f59e0b;
  --info-color: #3b82f6;
  --secondary-color: #64748b;
  --dark-bg: #0f172a;
  --card-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  --card-shadow-hover: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
}

html, body {
  height: 100%;
  overflow: hidden;
  font-family: 'Inter', sans-serif;
}

body {
  background: var(--bg-primary);
  color: var(--text-primary);
  line-height: 1.6;
  display: flex;
}

/* Sidebar Styles */
.sidebar {
  width: 240px;
  background: var(--bg-secondary);
  border-right: 1px solid var(--border);
  height: 100vh;
  overflow-y: hidden;
  flex-shrink: 0;
  box-shadow: var(--shadow);
  display: flex;
  flex-direction: column;
  position: fixed;
  left: 0;
  top: 0;
  z-index: 1000;
}

.sidebar-header {
  padding: 0.875rem 1rem;
  border-bottom: 1px solid var(--border);
  flex-shrink: 0;
}

.sidebar-logo {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  text-decoration: none;
}

.sidebar-logo-icon {
  width: 32px;
  height: 32px;
  background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 1rem;
}

.sidebar-logo-text {
  font-size: 1rem;
  font-weight: 700;
  color: var(--primary);
}

.sidebar-user {
  padding: 0.875rem 1rem;
  border-bottom: 1px solid var(--border);
  display: flex;
  align-items: center;
  gap: 0.625rem;
  flex-shrink: 0;
}

.sidebar-user-avatar {
  width: 36px;
  height: 36px;
  background: linear-gradient(135deg, var(--secondary) 0%, var(--secondary-dark) 100%);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-weight: 600;
  font-size: 0.9rem;
  flex-shrink: 0;
}

.sidebar-user-info {
  flex: 1;
  overflow: hidden;
}

.sidebar-user-name {
  font-weight: 600;
  color: var(--text-primary);
  font-size: 0.8rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.sidebar-user-role {
  font-size: 0.7rem;
  color: var(--text-secondary);
}

.sidebar-nav {
  padding: 0.75rem 0;
  flex: 1;
  overflow-y: hidden;
  display: flex;
  flex-direction: column;
}

.sidebar-section {
  margin-bottom: 0.75rem;
}

.sidebar-section-title {
  padding: 0 1rem;
  margin-bottom: 0.375rem;
  font-size: 0.65rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  color: var(--text-light);
}

.sidebar-link {
  display: flex;
  align-items: center;
  gap: 0.625rem;
  padding: 0.625rem 1rem;
  color: var(--text-secondary);
  text-decoration: none;
  transition: all 0.2s;
  font-weight: 500;
  font-size: 0.8rem;
  border-left: 3px solid transparent;
}

.sidebar-link:hover {
  background: var(--primary-light);
  color: var(--primary);
  border-left-color: var(--primary);
}

.sidebar-link.active {
  background: var(--primary-light);
  color: var(--primary);
  border-left-color: var(--primary);
  font-weight: 600;
}

.sidebar-link-icon {
  width: 18px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 0.9rem;
  flex-shrink: 0;
}

.sidebar-footer {
  padding: 0.875rem 1rem;
  border-top: 1px solid var(--border);
  flex-shrink: 0;
}

.sidebar-logout-btn {
  width: 100%;
  padding: 0.625rem;
  background: var(--danger);
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-weight: 600;
  transition: all 0.2s;
  font-size: 0.8rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.375rem;
}

.sidebar-logout-btn:hover {
  background: #DC2626;
  transform: translateY(-1px);
  box-shadow: var(--shadow);
}

/* Mobile Toggle Button */
.sidebar-toggle {
  display: none;
  position: fixed;
  top: 1rem;
  left: 1rem;
  z-index: 1002;
  width: 44px;
  height: 44px;
  background: var(--primary);
  color: white;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  align-items: center;
  justify-content: center;
  font-size: 1.25rem;
  box-shadow: var(--shadow-lg);
}

/* Main Content */
.main-content {
  margin-left: 240px;
  width: calc(100% - 240px);
  height: 100vh;
  overflow-y: auto;
  overflow-x: hidden;
  background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
}

.main-content::-webkit-scrollbar {
  width: 10px;
}

.main-content::-webkit-scrollbar-track {
  background: var(--bg-primary);
}

.main-content::-webkit-scrollbar-thumb {
  background: var(--border);
  border-radius: 5px;
}

.main-content::-webkit-scrollbar-thumb:hover {
  background: var(--text-light);
}

/* Dashboard Header */
.dashboard-header {
  background: linear-gradient(135deg, var(--dark-bg) 0%, #1e293b 100%);
  color: white;
  padding: 2rem;
  margin-bottom: 2rem;
  border-radius: 0 0 30px 30px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.dashboard-header h2 {
  font-size: 2rem;
  font-weight: 700;
  margin: 0;
}

.dashboard-header .subtitle {
  opacity: 0.8;
  font-size: 1.1rem;
}

/* Stats Cards */
.stats-card {
  border: none;
  border-radius: 20px;
  transition: all 0.3s ease;
  box-shadow: var(--card-shadow);
  overflow: hidden;
  position: relative;
}

.stats-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: rgba(255, 255, 255, 0.3);
}

.stats-card:hover {
  transform: translateY(-8px);
  box-shadow: var(--card-shadow-hover);
}

.stats-card .card-body {
  padding: 2rem;
}

.stats-card h6 {
  font-size: 0.85rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: 1rem;
  opacity: 0.9;
}

.stats-card h3 {
  font-size: 2.2rem;
  font-weight: 700;
  margin: 0;
}

.stats-card i {
  font-size: 2.5rem;
  opacity: 0.3;
  position: absolute;
  right: 1.5rem;
  top: 50%;
  transform: translateY(-50%);
}

/* Quick Actions Card */
.quick-actions-card {
  border: none;
  border-radius: 20px;
  box-shadow: var(--card-shadow);
  overflow: hidden;
}

.quick-actions-card .card-header {
  background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
  border-bottom: 2px solid #e2e8f0;
  padding: 1.5rem;
  font-weight: 700;
  font-size: 1.1rem;
  color: var(--dark-bg);
}

.quick-actions-card .card-body {
  padding: 2rem;
}

/* Action Buttons */
.action-btn {
  border-radius: 15px;
  padding: 1.2rem;
  font-weight: 600;
  transition: all 0.3s ease;
  border: 2px solid;
  position: relative;
  overflow: hidden;
}

.action-btn::before {
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  background: rgba(255, 255, 255, 0.1);
  transition: left 0.3s ease;
}

.action-btn:hover::before {
  left: 100%;
}

.action-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.action-btn i {
  font-size: 1.2rem;
  margin-right: 0.5rem;
}

/* Custom colors for action buttons */
.btn-outline-primary {
  border-color: var(--primary-color);
  color: var(--primary-color);
}

.btn-outline-primary:hover {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
  color: white;
}

.btn-outline-success {
  border-color: var(--success-color);
  color: var(--success-color);
}

.btn-outline-success:hover {
  background-color: var(--success-color);
  border-color: var(--success-color);
  color: white;
}

.btn-outline-warning {
  border-color: var(--warning-color);
  color: var(--warning-color);
}

.btn-outline-warning:hover {
  background-color: var(--warning-color);
  border-color: var(--warning-color);
  color: white;
}

.btn-outline-info {
  border-color: var(--info-color);
  color: var(--info-color);
}

.btn-outline-info:hover {
  background-color: var(--info-color);
  border-color: var(--info-color);
  color: white;
}

.btn-outline-secondary {
  border-color: var(--secondary-color);
  color: var(--secondary-color);
}

.btn-outline-secondary:hover {
  background-color: var(--secondary-color);
  border-color: var(--secondary-color);
  color: white;
}

.btn-outline-danger {
  border-color: var(--danger-color);
  color: var(--danger-color);
}

.btn-outline-danger:hover {
  background-color: var(--danger-color);
  border-color: var(--danger-color);
  color: white;
}

/* Animations */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.stats-card, .quick-actions-card {
  animation: fadeInUp 0.6s ease-out;
}

.stats-card:nth-child(1) {
  animation-delay: 0.1s;
}

.stats-card:nth-child(2) {
  animation-delay: 0.2s;
}

.stats-card:nth-child(3) {
  animation-delay: 0.3s;
}

.stats-card:nth-child(4) {
  animation-delay: 0.4s;
}

/* Responsive */
@media (max-width: 1024px) {
  .sidebar {
    transform: translateX(-100%);
    transition: transform 0.3s ease;
  }

  .sidebar.active {
    transform: translateX(0);
  }

  .main-content {
    margin-left: 0;
    width: 100%;
  }

  .sidebar-toggle {
    display: flex;
  }

  .sidebar-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.5);
    z-index: 999;
  }

  .sidebar-overlay.active {
    display: block;
  }
}

@media (max-width: 768px) {
  .dashboard-header h2 {
    font-size: 1.5rem;
  }
  
  .stats-card h3 {
    font-size: 1.8rem;
  }
  
  .action-btn {
    padding: 1rem;
  }
}
</style>

</head>

<body>

<!-- Sidebar Toggle Button (Mobile) -->
<button class="sidebar-toggle" onclick="toggleSidebar()">☰</button>

<!-- Sidebar Overlay (Mobile) -->
<div class="sidebar-overlay" onclick="toggleSidebar()"></div>

<!-- Sidebar -->
<aside class="sidebar" id="sidebar">
  <!-- Sidebar Header -->
  <div class="sidebar-header">
    <a href="#" class="sidebar-logo">
      <div class="sidebar-logo-icon">📦</div>
      <span class="sidebar-logo-text">InventoryPro</span>
    </a>
  </div>

  <!-- User Info in Sidebar -->
  <div class="sidebar-user">
    <div class="sidebar-user-avatar">A</div>
    <div class="sidebar-user-info">
      <div class="sidebar-user-name">Admin</div>
      <div class="sidebar-user-role">Administrator</div>
    </div>
  </div>

  <!-- Sidebar Navigation -->
  <nav class="sidebar-nav">
    <!-- Main Navigation -->
    <div class="sidebar-section">
      <div class="sidebar-section-title">Main</div>
      <a href="#" class="sidebar-link active">
        <span class="sidebar-link-icon">🏠</span>
        <span>Dashboard</span>
      </a>
      <a href="<%= request.getContextPath() %>/billing" class="sidebar-link">
        <span class="sidebar-link-icon">💳</span>
        <span>Billing</span>
      </a>
      <a href="<%= request.getContextPath() %>/viewProducts" class="sidebar-link">
        <span class="sidebar-link-icon">📦</span>
        <span>Products</span>
      </a>
      <a href="<%= request.getContextPath() %>/getBill" class="sidebar-link">
        <span class="sidebar-link-icon">📄</span>
        <span>Bills</span>
      </a>
    </div>

    <!-- Management -->
    <div class="sidebar-section">
      <div class="sidebar-section-title">Management</div>
      <a href="<%= request.getContextPath() %>/register.jsp" class="sidebar-link">
        <span class="sidebar-link-icon">👥</span>
        <span>Staff</span>
      </a>
      <a href="<%= request.getContextPath() %>/addProduct.jsp" class="sidebar-link">
        <span class="sidebar-link-icon">➕</span>
        <span>Add Product</span>
      </a>
    </div>

    <!-- Settings -->
    <div class="sidebar-section">
      <div class="sidebar-section-title">Account</div>
      <a href="profile.jsp" class="sidebar-link">
        <span class="sidebar-link-icon">👤</span>
        <span>Profile</span>
      </a>
      <a href="#" class="sidebar-link">
        <span class="sidebar-link-icon">⚙️</span>
        <span>Settings</span>
      </a>
    </div>
  </nav>

  <!-- Sidebar Footer -->
  <div class="sidebar-footer">
    <button class="sidebar-logout-btn" onclick="window.location.href='<%= request.getContextPath() %>/logout'">
      <span>🚪</span>
      <span>Logout</span>
    </button>
  </div>
</aside>

<!-- Main Content -->
<main class="main-content">

<div class="dashboard-header">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center flex-wrap">
      <div>
        <h2><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</h2>
        <p class="subtitle mb-0">Overview of your shop performance</p>
      </div>
      <div class="text-end">
        <small class="d-block opacity-75">Last updated</small>
        <strong id="currentDateTime"></strong>
      </div>
    </div>
  </div>
</div>

<div class="container my-5">

  <div class="row g-4 mb-5">

    <div class="col-lg-3 col-md-6">
      <div class="stats-card bg-primary text-white">
        <div class="card-body position-relative">
          <h6>Total Products Sold Today</h6>
          <h3><%=request.getAttribute("totalProducts")%></h3>
          <i class="bi bi-bag-check"></i>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <div class="stats-card bg-success text-white">
        <div class="card-body position-relative">
          <h6>Inventory Value</h6>
          <h3>₹ <%=request.getAttribute("totalValue") %></h3>
          <i class="bi bi-cash-stack"></i>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <div class="stats-card bg-danger text-white">
        <div class="card-body position-relative">
          <h6>Low Stock Alerts</h6>
          <h3><%=request.getAttribute("lowStockCount") %></h3>
          <i class="bi bi-exclamation-triangle"></i>
        </div>
      </div>
    </div>

    <div class="col-lg-3 col-md-6">
      <div class="stats-card bg-secondary text-white">
        <div class="card-body position-relative">
          <h6>Today's Sales</h6>
          <h3>Rs. <%=request.getAttribute("todaySales")%></h3>
          <i class="bi bi-graph-up-arrow"></i>
        </div>
      </div>
    </div>

  </div>

  <!-- Quick Actions -->
  <div class="quick-actions-card">
    <div class="card-header">
      <i class="bi bi-lightning-charge-fill me-2"></i>Quick Actions
    </div>
    <div class="card-body">
      <div class="row g-4">

        <div class="col-lg-4 col-md-6">
          <a href="<%= request.getContextPath() %>/register.jsp"
             class="btn btn-outline-primary action-btn w-100">
             <i class="bi bi-person-plus-fill"></i>Register New Staff
          </a>
        </div>

        <div class="col-lg-4 col-md-6">
          <a href="<%= request.getContextPath() %>/addProduct.jsp"
             class="btn btn-outline-success action-btn w-100">
             <i class="bi bi-plus-circle-fill"></i>Add Product
          </a>
        </div>

        <div class="col-lg-4 col-md-6">
          <a href="<%= request.getContextPath() %>/billing"
             class="btn btn-outline-warning action-btn w-100">
             <i class="bi bi-receipt"></i>Billing
          </a>
        </div>

        <div class="col-lg-4 col-md-6">
          <a href="<%= request.getContextPath() %>/viewProducts"
             class="btn btn-outline-info action-btn w-100">
             <i class="bi bi-box-seam"></i>View Products
          </a>
        </div>

        <div class="col-lg-4 col-md-6">
          <a href="<%= request.getContextPath() %>/getBill"
             class="btn btn-outline-secondary action-btn w-100">
             <i class="bi bi-file-earmark-text"></i>See Bills
          </a>
        </div>

        <div class="col-lg-4 col-md-6">
          <a href="<%= request.getContextPath() %>/logout"
             class="btn btn-outline-danger action-btn w-100">
             <i class="bi bi-box-arrow-right"></i>Logout
          </a>
        </div>

      </div>
    </div>
  </div>

</div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<script>

function updateDateTime() {
  const now = new Date();
  const options = { 
    year: 'numeric', 
    month: 'short', 
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
  };
  document.getElementById('currentDateTime').textContent = now.toLocaleDateString('en-US', options);
}

updateDateTime();
setInterval(updateDateTime, 60000); 

function toggleSidebar() {
  const sidebar = document.getElementById('sidebar');
  const overlay = document.querySelector('.sidebar-overlay');
  sidebar.classList.toggle('active');
  overlay.classList.toggle('active');
}

// Close sidebar when clicking on a link (mobile)
document.querySelectorAll('.sidebar-link').forEach(link => {
  link.addEventListener('click', () => {
    if (window.innerWidth <= 1024) {
      toggleSidebar();
    }
  });
});

</script>

</body>
</html>