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
        <link rel="stylesheet" href="<%= request.getContextPath() %>/pages/Category.css" />
    </head>

    <body>

        <!-- Full-width Top Bar -->
        <jsp:include page="/pages/AdminNavbar.jsp" />

        <div class="body-layout">
            <!-- Sidebar -->
            <aside class="sidebar">
                <nav class="nav">
                    <a href="<%= request.getContextPath() %>/admin/users" class="nav-item">
                        <div class="nav-icon">
                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" alt="Users" />
                        </div>
                        USERS
                    </a>
                    <a href="<%= request.getContextPath() %>/admin/product" class="nav-item">
                        <div class="nav-icon">
                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                alt="Products" />
                        </div>
                        PRODUCTS
                    </a>
                    <a href="<%= request.getContextPath() %>/admin/category" class="nav-item active">
                        <div class="nav-icon">
                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png"
                                alt="Category" />
                        </div>
                        CATEGORIES
                    </a>
                </nav>
            </aside>

            <!-- MAIN CONTENT -->
            <main class="main">
                <div class="products-centered-container">

                    <!-- Page Header -->
                    <div class="page-header">
                        <div class="page-header-text">
                            <h1 class="page-title">CATEGORY</h1>
                            <p class="page-sub">CATEGORIES FOR THE MMP &bull; 6 TOTAL</p>
                        </div>
                        <div class="divider divider--blue"></div>
                    </div>

                    <!-- Category List -->
                    <ul class="product-list">

                        <!-- Category Card -->
                        <li class="category-card">
                            <div class="product-card-meta">
                                <span class="meta-label">ID</span>
                                <span class="meta-id">CAT-009</span>
                            </div>
                            <div class="category-name">Furniture</div>
                            <div class="field-row">
                                <span class="field-label">TOTAL PRODUCTS</span>
                                <span class="field-value">67</span>
                            </div>
                            <div class="divider"></div>
                            <div class="category-card-actions">
                                <button class="btn-icon" aria-label="Edit category">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/edit-pencil.svg"
                                        alt="Edit" style="width:15px; height:15px;" />
                                </button>
                                <button class="btn-icon" aria-label="Delete category">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                        alt="Delete" style="width:15px; height:15px;" />
                                </button>
                            </div>
                        </li>

                        <div class="divider"></div>

                        <!-- Category Card -->
                        <li class="category-card">
                            <div class="product-card-meta">
                                <span class="meta-label">ID</span>
                                <span class="meta-id">CAT-009</span>
                            </div>
                            <div class="category-name">Furniture</div>
                            <div class="field-row">
                                <span class="field-label">TOTAL PRODUCTS</span>
                                <span class="field-value">67</span>
                            </div>
                            <div class="divider"></div>
                            <div class="category-card-actions">
                                <button class="btn-icon" aria-label="Edit category">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/edit-pencil.svg"
                                        alt="Edit" style="width:15px; height:15px;" />
                                </button>
                                <button class="btn-icon" aria-label="Delete category">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                        alt="Delete" style="width:15px; height:15px;" />
                                </button>
                            </div>
                        </li>

                        <div class="divider"></div>

                        <!-- Category Card -->
                        <li class="category-card">
                            <div class="product-card-meta">
                                <span class="meta-label">ID</span>
                                <span class="meta-id">CAT-009</span>
                            </div>
                            <div class="category-name">Furniture</div>
                            <div class="field-row">
                                <span class="field-label">TOTAL PRODUCTS</span>
                                <span class="field-value">67</span>
                            </div>
                            <div class="divider"></div>
                            <div class="category-card-actions">
                                <button class="btn-icon" aria-label="Edit category">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/edit-pencil.svg"
                                        alt="Edit" style="width:15px; height:15px;" />
                                </button>
                                <button class="btn-icon" aria-label="Delete category">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                        alt="Delete" style="width:15px; height:15px;" />
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