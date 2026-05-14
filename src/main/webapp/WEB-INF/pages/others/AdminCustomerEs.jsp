<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminEmptyState.css" />
            </head>

            <body>

                <!-- Full-width Top Bar -->
                <jsp:include page="/WEB-INF/pages/AdminNavbar.jsp" />

                <div class="bodyLayout">
                    <!-- Sidebar -->
                    <aside class="sidebar">
                        <nav class="nav">
                            <a href="<%= request.getContextPath() %>/admin/customer" class="navItem active">
                                <div class="navIcon">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                        alt="User Avatar" />
                                </div>
                                CUSTOMERS
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/seller" class="navItem">
                                <div class="navIcon">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                        alt="User Avatar" />
                                </div>
                                SELLERS
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/product" class="navItem">
                                <div class="navIcon">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                        alt="User Avatar" />
                                </div>
                                PRODUCTS
                            </a>
                            <a href="<%= request.getContextPath() %>/admin/category" class="navItem">
                                <div class="navIcon">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png"
                                        alt="User Avatar" />
                                </div>
                                CATEGORIES
                            </a>
                        </nav>
                    </aside>

                    <!-- MAIN CONTENT -->
                    <main class="main">
                        <div class="usersCenteredContainer">

                            <!-- Page Header -->
                            <div class="pageHeader">
                                <c:if test="${not empty customers}">
                                    <div class="pageHeaderText">
                                        <h1 class="pageTitle">CUSTOMERS</h1>
                                        <p class="pageSub">MANAGE ACCOUNTS, ROLES, AND STATUS &bull;
                                            &nbsp;${fn:length(customers)} REGISTERED</p>
                                    </div>
                                </c:if>
                                <c:if test="${empty customers}">
                                    <div class="pageHeaderText">
                                        <h1 class="pageTitle">USERS</h1>
                                        <p class="pageSub">MANAGE ACCOUNTS, ROLES, AND STATUS &bull; NO CUSTOMERS
                                            CURRENLTY
                                            RESGISTERED</p>
                                    </div>
                                </c:if>

                                <div class="divider dividerBlue"></div>
                            </div>

            <section class="emptyState">
            <img src="<%= request.getContextPath() %>/Assets/User/peeps.png" alt="profile" />
            <h1 class="emptyText">
              No customers <br>
              <span>yet</span>
            </h1>
            </section>
            </body>

            </html>