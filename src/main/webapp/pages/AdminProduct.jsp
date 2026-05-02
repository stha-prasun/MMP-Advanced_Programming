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
        <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminProduct.css" />
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
                    <a href="<%= request.getContextPath() %>/admin/product" class="nav-item active">
                        <div class="nav-icon">
                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                alt="Products" />
                        </div>
                        PRODUCTS
                    </a>
                    <a href="<%= request.getContextPath() %>/admin/category" class="nav-item">
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
                            <h1 class="page-title">PRODUCT</h1>
                            <p class="page-sub">REVIEW, APPROVE, AND MANAGE LISTINGS 5 TOTAL</p>
                        </div>
                        <div class="divider divider--blue"></div>
                    </div>

                    <!-- Product Cards -->
                    <ul class="product-list">

                        <!-- Product 1 -->
                        <li class="product-card">
                            <div class="product-card-meta">
                                <span class="meta-label">ID</span>
                                <span class="meta-id">PRO-1043</span>
                            </div>
                            <div class="product-card-identity">
                                <div class="product-thumb">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                        alt="Record Player" />
                                </div>
                                <span class="product-name">Record Player</span>
                            </div>
                            <div class="product-card-fields">
                                <div class="field-row">
                                    <span class="field-label">SELLER</span>
                                    <span class="field-value field-value--bold">Rohan Shrestha</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">PRICE</span>
                                    <span class="field-value">$4200.00</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">CATEGORY</span>
                                    <span class="field-value field-value--bold">FURNITURE</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">STATUS</span>
                                    <span class="badge badge--approved">APPROVED</span>
                                </div>
                            </div>
                            <div class="product-card-actions">
                                <button class="btn-delete" aria-label="Delete product">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                        alt="Delete" style="width:16px; height:16px;" />
                                </button>
                            </div>
                        </li>

                        <div class="divider"></div>

                        <!-- Product 2 -->
                        <li class="product-card">
                            <div class="product-card-meta">
                                <span class="meta-label">ID</span>
                                <span class="meta-id">PRO-1043</span>
                            </div>
                            <div class="product-card-identity">
                                <div class="product-thumb">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                        alt="Record Player" />
                                </div>
                                <span class="product-name">Record Player</span>
                            </div>
                            <div class="product-card-fields">
                                <div class="field-row">
                                    <span class="field-label">SELLER</span>
                                    <span class="field-value field-value--bold">Rohan Shrestha</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">PRICE</span>
                                    <span class="field-value">$4200.00</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">CATEGORY</span>
                                    <span class="field-value field-value--bold">FURNITURE</span>
                                </div>
                                <div class="field-row">
                                    <span class="field-label">STATUS</span>
                                    <span class="badge badge--pending">PENDING</span>
                                </div>
                            </div>
                            <div class="product-card-actions product-card-actions--pending">
                                <button class="btn-approve" aria-label="Approve product">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Category/Icon.svg"
                                        alt="tick icon" style="width:16px; height:16px;">
                                </button>
                                <button class="btn-reject" aria-label="Reject product">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/close-x-svgrepo-com.svg"
                                        alt="close icon" style="width:16px; height:16px;">
                                </button>
                            </div>
                        </li>

                        <div class="divider"></div>
                        <div class="divider"></div>

                    </ul>
                </div>
            </main>
        </div>

        <button class="hamburger" id="hamburger" aria-label="Toggle menu">
            <span></span><span></span><span></span>
        </button>


    </body>

    </html>