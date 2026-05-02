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

    <div class="body-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="nav">
                <a href="<%= request.getContextPath() %>/admin/users" class="nav-item">
                    <div class="nav-icon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                            alt="Users" />
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
                    <c:if test="${not empty categories}">
                        <div class="page-header-text">
                            <h1 class="page-title">CATEGORY</h1>
                            <p class="page-sub">CATEGORIES FOR THE MMP &bull; &nbsp;
                                ${fn:length(categories)} TOTAL</p>
                        </div>
                    </c:if>

                    <div class="divider divider--blue"></div>
                </div>
                <c:choose>
                    <c:when test="${empty students}">
                        <div class="empty-state">
                            <i class="fa-regular fa-folder-open fa-3x"
                                style="margin-bottom: 1rem; opacity: 0.5;"></i>
                            <p>No student records found.</p>
                        </div>
                    </c:when>

                    <c:otherwise>
                        <table>
                            <thead>
                                <tr>
                                    <th>Student Details</th>
                                    <th>Email Address</th>
                                    <th>Date of Birth</th>
                                    <th>Enrolled Program</th>
                                    <th style="text-align: right;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="s" items="${students}">
                                    <tr>
                                        <td>
                                            <div class="user-info">
                                                <span class="user-name">${s.firstName}
                                                    ${s.lastName}</span>
                                                <span
                                                    class="user-handle">@${fn:toLowerCase(s.userName)}</span>
                                            </div>
                                        </td>
                                        <td>${s.email}</td>
                                        <td>
                                            <fmt:formatDate value="${s.dob}" pattern="dd MMM, yyyy" />
                                        </td>
                                        <td>
                                            <span class="program-tag">
                                                <c:choose>
                                                    <c:when test="${s.program == 2}">Bachelor in
                                                        Computing</c:when>
                                                    <c:when test="${s.program == 5}">Bachelor in
                                                        Multimedia</c:when>
                                                    <c:when test="${s.program == 6}">Bachelor in
                                                        Networking</c:when>
                                                    <c:otherwise>General Studies</c:otherwise>
                                                </c:choose>
                                            </span>
                                        </td>
                                        <td style="text-align: right;">
                                            <a href="edit?user=${s.userName}" class="edit-btn">
                                                <i class="fa fa-pen-to-square"></i> Edit
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
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
                                <img src="<%= request.getContextPath() %>/Assets/Admin Category/Button.png"
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
                                <img src="<%= request.getContextPath() %>/Assets/Admin Category/Button.png"
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
                                <img src="<%= request.getContextPath() %>/Assets/Admin Category/Button.png"
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


</body>

</html>