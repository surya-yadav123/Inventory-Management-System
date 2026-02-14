<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Staff" %>
<%
    Staff s = (Staff) session.getAttribute("staff");
    if (s == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - InventoryPro</title>
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

        .container-custom {
            padding: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Welcome Section */
        .welcome-section {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: 16px;
            padding: 2rem 2.5rem;
            margin-bottom: 2rem;
            color: white;
            box-shadow: var(--shadow-xl);
            position: relative;
            overflow: hidden;
        }

        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            transform: translate(30%, -30%);
        }

        .welcome-content {
            position: relative;
            z-index: 1;
        }

        .welcome-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .welcome-subtitle {
            font-size: 1.1rem;
            opacity: 0.95;
            font-weight: 400;
        }

        /* Action Cards Grid */
        .action-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .action-card {
            background: var(--bg-secondary);
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid var(--border);
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
        }

        .action-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
        }

        .action-card-header {
            padding: 1.5rem;
            position: relative;
            background: linear-gradient(135deg, var(--primary-light) 0%, #DBEAFE 100%);
            display: flex;
            align-items: center;
            gap: 1.25rem;
        }

        .action-card:nth-child(2) .action-card-header {
            background: linear-gradient(135deg, #D1FAE5 0%, #A7F3D0 100%);
        }

        .action-card-icon {
            width: 56px;
            height: 56px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.75rem;
            box-shadow: var(--shadow-lg);
            flex-shrink: 0;
        }

        .action-card:nth-child(1) .action-card-icon {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
        }

        .action-card:nth-child(2) .action-card-icon {
            background: linear-gradient(135deg, var(--secondary) 0%, var(--secondary-dark) 100%);
            color: white;
        }

        .action-card-header-text {
            flex: 1;
        }

        .action-card-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.375rem;
        }

        .action-card-status {
            padding: 0.375rem 0.75rem;
            background: white;
            border-radius: 14px;
            font-size: 0.75rem;
            font-weight: 600;
            color: var(--secondary);
            display: inline-flex;
            align-items: center;
            gap: 0.375rem;
        }

        .status-dot {
            width: 6px;
            height: 6px;
            background: var(--secondary);
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        .action-card-body {
            padding: 1.5rem;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .action-card-description {
            color: var(--text-secondary);
            line-height: 1.7;
            margin-bottom: 1.25rem;
            font-size: 0.95rem;
            flex: 1;
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.625rem;
            padding: 0.875rem 1.5rem;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.2s;
            font-size: 0.95rem;
            border: none;
            cursor: pointer;
        }

        .action-card:nth-child(1) .action-btn {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            box-shadow: 0 4px 14px rgba(79, 70, 229, 0.3);
        }

        .action-card:nth-child(1) .action-btn:hover {
            background: linear-gradient(135deg, var(--primary-dark) 0%, #3730A3 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(79, 70, 229, 0.4);
        }

        .action-card:nth-child(2) .action-btn {
            background: linear-gradient(135deg, var(--secondary) 0%, var(--secondary-dark) 100%);
            color: white;
            box-shadow: 0 4px 14px rgba(16, 185, 129, 0.3);
        }

        .action-card:nth-child(2) .action-btn:hover {
            background: linear-gradient(135deg, var(--secondary-dark) 0%, #047857 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(16, 185, 129, 0.4);
        }

        /* Quick Links */
        .quick-links-section {
            background: var(--bg-secondary);
            border-radius: 16px;
            padding: 2rem;
            box-shadow: var(--shadow);
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .section-title::before {
            content: '';
            width: 4px;
            height: 28px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: 4px;
        }

        .quick-links-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1rem;
        }

        .quick-link {
            padding: 1.25rem;
            background: var(--bg-primary);
            border: 2px solid var(--border);
            border-radius: 12px;
            text-decoration: none;
            color: var(--text-primary);
            transition: all 0.2s;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.75rem;
            font-weight: 600;
            font-size: 0.9rem;
            text-align: center;
        }

        .quick-link:hover {
            border-color: var(--primary);
            background: var(--primary-light);
            transform: translateY(-2px);
        }

        .quick-link-icon {
            width: 42px;
            height: 42px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.125rem;
        }

        .quick-link:nth-child(2) .quick-link-icon {
            background: linear-gradient(135deg, var(--secondary) 0%, var(--secondary-dark) 100%);
        }

        .quick-link:nth-child(3) .quick-link-icon {
            background: linear-gradient(135deg, var(--accent) 0%, #D97706 100%);
        }

        .quick-link:nth-child(4) .quick-link-icon {
            background: linear-gradient(135deg, var(--danger) 0%, #DC2626 100%);
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .action-grid {
                grid-template-columns: 1fr;
            }
            .quick-links-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

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
            .container-custom {
                padding: 1.5rem;
            }

            .welcome-section {
                padding: 1.5rem;
            }

            .welcome-title {
                font-size: 1.5rem;
            }

            .welcome-subtitle {
                font-size: 0.95rem;
            }

            .action-grid {
                grid-template-columns: 1fr;
            }

            .quick-links-grid {
                grid-template-columns: 1fr;
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
            <div class="sidebar-user-avatar"><%= s.getName().substring(0, 1).toUpperCase() %></div>
            <div class="sidebar-user-info">
                <div class="sidebar-user-name"><%= s.getName() %></div>
                <div class="sidebar-user-role">Staff</div>
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
                <a href="billing" class="sidebar-link">
                    <span class="sidebar-link-icon">💳</span>
                    <span>Billing</span>
                </a>
                <a href="viewProducts" class="sidebar-link">
                    <span class="sidebar-link-icon">📦</span>
                    <span>Products</span>
                </a>
            </div>

            <!-- Quick Actions -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Quick</div>
                <a href="billing" class="sidebar-link">
                    <span class="sidebar-link-icon">🧾</span>
                    <span>New Bill</span>
                </a>
                <a href="products" class="sidebar-link">
                    <span class="sidebar-link-icon">🔍</span>
                    <span>Search</span>
                </a>
            </div>

            <!-- Settings -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Account</div>
                <a href="profile" class="sidebar-link">
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
            <button class="sidebar-logout-btn" onclick="window.location.href='logout'">
                <span>🚪</span>
                <span>Logout</span>
            </button>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container-custom">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <div class="welcome-content">
                    <h1 class="welcome-title">Welcome Back, <%= s.getName() %>! 👋</h1>
                    <p class="welcome-subtitle">Ready to make today productive? Let's get started with your daily tasks.</p>
                </div>
            </div>

            <!-- Quick Access Section -->
            <div class="action-grid">
                <!-- Billing Card -->
                <div class="action-card">
                    <div class="action-card-header">
                        <div class="action-card-icon">💳</div>
                        <div class="action-card-header-text">
                            <h3 class="action-card-title">Start Billing</h3>
                            <div class="action-card-status">
                                <span class="status-dot"></span>
                                Ready
                            </div>
                        </div>
                    </div>
                    <div class="action-card-body">
                        <p class="action-card-description">
                            Process customer purchases, generate invoices, and manage transactions quickly and efficiently.
                        </p>
                        <a href="billing" class="action-btn">
                            Go to Billing
                            <span>→</span>
                        </a>
                    </div>
                </div>

                <!-- Inventory Card -->
                <div class="action-card">
                    <div class="action-card-header">
                        <div class="action-card-icon">📊</div>
                        <div class="action-card-header-text">
                            <h3 class="action-card-title">View Inventory</h3>
                            <div class="action-card-status">
                                <span class="status-dot"></span>
                                Ready
                            </div>
                        </div>
                    </div>
                    <div class="action-card-body">
                        <p class="action-card-description">
                            Check product availability, stock levels, and search through the complete product catalog.
                        </p>
                        <a href="products" class="action-btn">
                            View Products
                            <span>→</span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Quick Links Section -->
            <div class="quick-links-section">
                <h2 class="section-title">Quick Links</h2>
                <div class="quick-links-grid">
                    <a href="billing" class="quick-link">
                        <div class="quick-link-icon">🧾</div>
                        <span>New Bill</span>
                    </a>
                    <a href="viewProducts" class="quick-link">
                        <div class="quick-link-icon">🔍</div>
                        <span>Search Products</span>
                    </a>
                    <a href="profile" class="quick-link">
                        <div class="quick-link-icon">⚙️</div>
                        <span>My Profile</span>
                    </a>
                    <a href="logout" class="quick-link">
                        <div class="quick-link-icon">🚪</div>
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script>
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