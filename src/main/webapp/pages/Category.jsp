<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />
    <title>MMP</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Category.css" />
</head>

<body>

    <!-- Full-width Top Bar -->
    <jsp:include page="/pages/AdminNavbar.jsp" />

    <div class="bodyLayout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="nav">
                <a href="<%= request.getContextPath() %>/admin/users" class="navItem">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                            alt="Users" />
                    </div>
                    USERS
                </a>
                <a href="<%= request.getContextPath() %>/admin/product" class="navItem">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                            alt="Products" />
                    </div>
                    PRODUCTS
                </a>
                <a href="<%= request.getContextPath() %>/admin/category" class="navItem active">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png"
                            alt="Category" />
                    </div>
                    CATEGORIES
                </a>
            </nav>
        </aside>

        <!-- MAIN CONTENT -->
        <main class="main">
            <div class="productsCenteredContainer">

                <!-- Page Header -->
                <div class="pageHeader">
                    <c:if test="${not empty categories}">
                        <div class="pageHeaderText">
                            <h1 class="pageTitle">CATEGORY</h1>
                            <p class="pageSub">CATEGORIES FOR THE MMP &bull; &nbsp;
                                ${fn:length(categories)} TOTAL</p>
                        </div>
                    </c:if>

                    <div class="divider dividerBlue"></div>
                </div>

                <c:choose>
                    <c:when test="${empty categories}">
                        <div class="emptyState">
                            <i class="fa-regular fa-folder-open fa-3x"
                                style="margin-bottom: 1rem; opacity: 0.5;"></i>
                            <p>No student records found.</p>
                        </div>
                    </c:when>

                    <c:otherwise>

                        <!-- Category List -->
                        <ul class="productList">
                            <c:forEach var="cat" items="${categories}">
                                <!-- Category Card -->
                                <li class="categoryCard">
                                    <div class="productCardMeta">
                                        <span class="metaLabel">ID</span>
                                        <span class="metaId">CAT-00${cat.categoryId}</span>
                                    </div>
                                    <div class="categoryName">${cat.type}</div>
                                    <div class="fieldRow">
                                        <span class="fieldLabel">TOTAL PRODUCTS</span>
                                        <span class="fieldValue">67</span>
                                    </div>
                                    <div class="divider"></div>
                                    <div class="categoryCardActions">
                                        <button class="btnIcon" aria-label="Edit category">
                                            <img src="<%= request.getContextPath() %>/Assets/Admin Category/Button.png"
                                                alt="Edit" style="width:15px; height:15px;" />
                                        </button>
                                        <button class="btnIcon" aria-label="Delete category">
                                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                                alt="Delete" style="width:15px; height:15px;" />
                                        </button>
                                    </div>
                                </li>

                                <div class="divider"></div>
                            </c:forEach>
                        </ul>

                    </c:otherwise>
                </c:choose>

            </div>
        </main>
    </div>

    <button class="hamburger" id="hamburger" aria-label="Toggle menu">
        <span></span><span></span><span></span>
    </button>

</body>

</html>