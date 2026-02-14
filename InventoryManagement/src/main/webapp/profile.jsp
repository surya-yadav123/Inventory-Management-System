<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Staff" %>

<%
    Staff staff = (Staff) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - InventoryPro</title>
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

        .profile-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }

        /* Profile Card */
        .profile-card {
            background: var(--bg-secondary);
            border-radius: 20px;
            box-shadow: var(--shadow-xl);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .profile-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            padding: 3rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .profile-header::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 250px;
            height: 250px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            transform: translate(30%, -30%);
        }

        .avatar-wrapper {
            position: relative;
            display: inline-block;
            z-index: 1;
        }

        .avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--secondary) 0%, var(--secondary-dark) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
            font-weight: 700;
            box-shadow: var(--shadow-xl);
            border: 5px solid white;
            margin: 0 auto 1rem;
        }

        .profile-name {
            font-size: 2rem;
            font-weight: 700;
            color: white;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .profile-role {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1.25rem;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            color: white;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
            position: relative;
            z-index: 1;
        }

        .profile-body {
            padding: 2rem;
        }

        .info-row {
            display: flex;
            align-items: center;
            padding: 1.25rem;
            border-bottom: 1px solid var(--border);
            transition: all 0.2s;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-row:hover {
            background: var(--bg-primary);
        }

        .info-icon {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, var(--primary-light) 0%, #DBEAFE 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 1.25rem;
            margin-right: 1.25rem;
            flex-shrink: 0;
        }

        .info-row:nth-child(2) .info-icon {
            background: linear-gradient(135deg, #D1FAE5 0%, #A7F3D0 100%);
            color: var(--secondary);
        }

        .info-content {
            flex: 1;
        }

        .info-label {
            font-size: 0.875rem;
            color: var(--text-secondary);
            font-weight: 500;
            margin-bottom: 0.25rem;
        }

        .info-value {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text-primary);
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            flex: 1;
            padding: 1rem 1.5rem;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.95rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.625rem;
            transition: all 0.2s;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            box-shadow: 0 4px 14px rgba(79, 70, 229, 0.3);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--primary-dark) 0%, #3730A3 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(79, 70, 229, 0.4);
        }

        .btn-secondary {
            background: var(--bg-primary);
            color: var(--text-primary);
            border: 2px solid var(--border);
        }

        .btn-secondary:hover {
            background: white;
            border-color: var(--primary);
            color: var(--primary);
            transform: translateY(-2px);
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
            .profile-container {
                padding: 1.5rem;
            }

            .profile-header {
                padding: 2rem 1.5rem;
            }

            .avatar {
                width: 100px;
                height: 100px;
                font-size: 2.5rem;
            }

            .profile-name {
                font-size: 1.5rem;
            }

            .profile-body {
                padding: 1.5rem;
            }

            .action-buttons {
                flex-direction: column;
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
            <a href="dashboard.jsp" class="sidebar-logo">
                <div class="sidebar-logo-icon">📦</div>
                <span class="sidebar-logo-text">InventoryPro</span>
            </a>
        </div>

        <!-- User Info in Sidebar -->
        <div class="sidebar-user">
            <div class="sidebar-user-avatar"><%= staff.getName().substring(0, 1).toUpperCase() %></div>
            <div class="sidebar-user-info">
                <div class="sidebar-user-name"><%= staff.getName() %></div>
                <div class="sidebar-user-role">Staff</div>
            </div>
        </div>

        <!-- Sidebar Navigation -->
        <nav class="sidebar-nav">
            <!-- Main Navigation -->
            <div class="sidebar-section">
                <div class="sidebar-section-title">Main</div>
                <a href="dashboard.jsp" class="sidebar-link">
                    <span class="sidebar-link-icon">🏠</span>
                    <span>Dashboard</span>
                </a>
                <a href="billing" class="sidebar-link">
                    <span class="sidebar-link-icon">💳</span>
                    <span>Billing</span>
                </a>
                <a href="products" class="sidebar-link">
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
                <a href="profile.jsp" class="sidebar-link active">
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
        <div class="profile-container">
            <!-- Profile Card -->
            <div class="profile-card">
                <!-- Profile Header -->
                <div class="profile-header">
                    <div class="avatar-wrapper">
                        <div class="avatar">
                            <%= staff.getName().substring(0, 1).toUpperCase() %>
                        </div>
                    </div>
                    <h1 class="profile-name"><%= staff.getName() %></h1>
                    <div class="profile-role">
                        <i class="bi bi-shield-check"></i>
                        <span><%= staff.getRole() %></span>
                    </div>
                </div>

                <!-- Profile Body -->
                <div class="profile-body">
                    <!-- Staff ID -->
                    <div class="info-row">
                        <div class="info-icon">
                            <i class="bi bi-person-badge"></i>
                        </div>
                        <div class="info-content">
                            <div class="info-label">Staff ID</div>
                            <div class="info-value"><%= staff.getStaffId() %></div>
                        </div>
                    </div>

                    <!-- Username -->
                    <div class="info-row">
                        <div class="info-icon">
                            <i class="bi bi-person-circle"></i>
                        </div>
                        <div class="info-content">
                            <div class="info-label">Username</div>
                            <div class="info-value"><%= staff.getUsername() %></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">

                <a href="dashboard.jsp" class="btn btn-secondary">
                    <i class="bi bi-house-door"></i>
                    <span>Dashboard</span>
                </a>
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