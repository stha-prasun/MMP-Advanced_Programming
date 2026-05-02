<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />
        <title>MMP</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminUsers.css" />
    </head>

    <body>

        <!-- Full-width Top Bar -->
        <jsp:include page="/pages/AdminNavbar.jsp" />

        <div class="body-layout">
            <!-- Sidebar -->
            <aside class="sidebar">
                <nav class="nav">
                    <a href="<%= request.getContextPath() %>/admin/users" class="nav-item active">
                        <div class="nav-icon">
                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                alt="User Avatar" />
                        </div>
                        USERS
                    </a>
                    <a href="<%= request.getContextPath() %>/admin/product" class="nav-item">
                        <div class="nav-icon">
                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                alt="User Avatar" />
                        </div>
                        PRODUCTS
                    </a>
                    <a href="#" class="nav-item">
                        <div class="nav-icon">
                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png"
                                alt="User Avatar" />
                        </div>
                        CATEGORIES
                    </a>
                </nav>
            </aside>

            <!-- MAIN CONTENT: fully centered user list -->
            <main class="main">
                <div class="users-centered-container">
                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="page-header-text">
                            <h1 class="page-title">USERS</h1>
                            <p class="page-sub">MANAGE ACCOUNTS, ROLES, AND STATUS &bull; 5 REGISTERED</p>
                        </div>
                        <div class="divider divider--blue"></div>
                    </div>

                    <!-- User Cards -->
                    <ul class="user-list">
                        <!-- User 1 - Admin -->
                        <li class="user-card">
                            <div class="user-card-meta">
                                <span class="meta-label">ID</span>
                                <span class="meta-id">U-001</span>
                            </div>
                            <div class="user-card-identity">
                                <div class="user-avatar">
                                    <div class="avatar">
                                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                            alt="User Avatar" />
                                    </div>
                                </div>
                                <span class="user-name">Rohan Shrestha</span>
                            </div>
                            <div class="user-card-fields">
                                <div class="field-row">
                                    <span class="field-label">EMAIL</span>
                                    <span class="field-value">rohanshrestha612@gmail.com</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">ROLE</span>
                                    <span class="field-value field-value--bold">ADMIN</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">STATUS</span>
                                    <span class="badge badge--active">ACTIVE</span>
                                </div>
                            </div>
                            <div class="user-card-actions">
                                <button class="btn-delete" aria-label="Delete user">
                                    <div>
                                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                            alt="dustbin icon" style="width:16px; height:16px;">
                                    </div>
                                </button>
                            </div>
                        </li>

                        <div class="divider"></div>

                        <!-- User 2 - Seller -->
                        <li class="user-card">
                            <div class="user-card-meta">
                                <span class="meta-label">ID</span>
                                <span class="meta-id">S-001</span>
                            </div>
                            <div class="user-card-identity">
                                <div class="user-avatar">
                                    <div class="avatar">
                                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                            alt="User Avatar" />
                                    </div>
                                </div>
                                <span class="user-name">Samira Thapa</span>
                            </div>
                            <div class="user-card-fields">
                                <div class="field-row">
                                    <span class="field-label">EMAIL</span>
                                    <span class="field-value">samira.thapa@mmp.com</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">ROLE</span>
                                    <span class="field-value field-value--bold">SELLER</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">STATUS</span>
                                    <span class="badge badge--active">ACTIVE</span>
                                </div>
                            </div>
                            <div class="user-card-actions">
                                <button class="btn-delete" aria-label="Delete user">
                                    <div>
                                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                            alt="dustbin icon" style="width:16px; height:16px;">
                                    </div>
                                </button>
                            </div>
                        </li>

                        <div class="divider"></div>
                    </ul>
                </div>
            </main>
        </div>

        <button class="hamburger" id="hamburger" aria-label="Toggle menu">
            <span></span><span></span><span></span>
        </button>

        <!-- Separate JavaScript file (behavior moved to external script.js) -->
        <script>
            (function () {
                const hamburger = document.getElementById('hamburger');
                const sidebar = document.querySelector('.sidebar');
                if (hamburger && sidebar) {
                    hamburger.addEventListener('click', () => {
                        sidebar.classList.toggle('open');
                        hamburger.classList.toggle('active');
                    });
                }
            })();
        </script>
    </body>

    </html>