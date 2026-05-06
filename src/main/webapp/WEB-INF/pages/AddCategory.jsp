<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AddCategory.css" />
    </head>

    <body>

        <!-- Full-width Top Bar -->
        <jsp:include page="/WEB-INF/pages/AdminNavbar.jsp" />

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
                            <h1 class="page-title">ADD CATEGORY</h1>
                            <p class="page-sub">ADD NEW CATEGORIES</p>
                        </div>
                        <div class="divider divider--blue"></div>
                    </div>

                    <!-- Category Form -->
                    <form method="POST" action="<%= request.getContextPath() %>/admin/category/add">
                    <div class="category-form-wrapper">
                        <div class="category-form-card">

                            <div class="category-field-group">
                                <span class="field-meta-label">NEW</span>
                                <label class="category-field-title">CATEGORY NAME</label>
                            </div>
                            <div class="category-input-block">
                            <c:if test="${not empty error}">
                                <div class="error-message" style="color:red; font-size:16px; margin-bottom:10px;">
                                    ${error}
                                </div>
                            </c:if>
                                <div class="category-input-border-blue"></div>
                                <input type="text" class="category-input" id="categoryname" name="categoryName" placeholder="Category Name"
                                    autocomplete="off" />
                                <div class="category-input-border-blue"></div>

                            </div>
                            <div class="category-input-border-grey"></div>

                            <div class="category-form-actions">
                                <button class="btn-approve" type="submit" aria-label="Confirm">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Category/Icon.svg"
                                        alt="tick icon" style="width:16px; height:16px;" />
                                </button>
                                <button class="btn-reject" type="submit" aria-label="Cancel">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/close-x-svgrepo-com.svg"
                                        alt="close icon" style="width:16px; height:16px;" />
                                </button>
                            </div>
                            <div class="category-input-border-grey" style="margin-top: 15px;"></div>


                        </div>
                    </div>
                    </form>

                </div>
            </main>
        </div>

        <button class="hamburger" id="hamburger" aria-label="Toggle menu">
            <span></span><span></span><span></span>
        </button>


    </body>

    </html>