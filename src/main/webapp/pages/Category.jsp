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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Category.css" />
</head>

<body>

    <jsp:include page="/pages/AdminNavbar.jsp" />

    <div class="bodyLayout">
        <aside class="sidebar">
            <nav class="nav">
                <a href="<%= request.getContextPath() %>/admin/users" class="navItem">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" alt="Users" />
                    </div>
                    USERS
                </a>
                <a href="<%= request.getContextPath() %>/admin/product" class="navItem">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png" alt="Products" />
                    </div>
                    PRODUCTS
                </a>
                <a href="<%= request.getContextPath() %>/admin/category" class="navItem active">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png" alt="Category" />
                    </div>
                    CATEGORIES
                </a>
            </nav>
        </aside>

        <main class="main">
            <div class="productsCenteredContainer">

                <div class="pageHeader">
                    <c:if test="${not empty categories}">
                        <div class="pageHeaderText">
                            <h1 class="pageTitle">CATEGORY</h1>
                            <p class="pageSub">CATEGORIES FOR THE MMP &bull; &nbsp;${fn:length(categories)} TOTAL</p>
                        </div>
                    </c:if>
                    <div class="divider dividerBlue"></div>
                </div>

                <c:choose>
                    <c:when test="${empty categories}">
                        <div class="emptyState">
                            <p>No categories found.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="productList">
                            <c:forEach var="cat" items="${categories}">
                                <li class="categoryCard" id="card-${cat.categoryId}">

                                    <div class="productCardMeta">
                                        <span class="metaLabel">ID</span>
                                        <span class="metaId">CAT-00${cat.categoryId}</span>
                                    </div>

                                    <!-- VIEW MODE -->
                                    <div class="categoryName" id="view-${cat.categoryId}">${cat.type}</div>

                                    <!-- EDIT MODE -->
                                    <form method="POST"
                                          action="${pageContext.request.contextPath}/admin/category/edit"
                                          id="editForm-${cat.categoryId}"
                                          style="display:none;">
                                        <input type="hidden" name="catId" value="${cat.categoryId}" />
                                        <input type="text"
                                               class="category-inline-input"
                                               id="editInput-${cat.categoryId}"
                                               name="categoryName"
                                               value="${cat.type}"
                                               autocomplete="off" />
                                    </form>

                                    <div class="fieldRow">
                                        <span class="fieldLabel">TOTAL PRODUCTS</span>
                                        <span class="fieldValue">67</span>
                                    </div>

                                    <div class="divider"></div>

                                    <div class="categoryCardActions">
                                        <!-- Edit button -->
                                        <button class="btnIcon" id="editBtn-${cat.categoryId}"
                                                aria-label="Edit category"
                                                onclick="startEdit(${cat.categoryId})">
                                            <img src="<%= request.getContextPath() %>/Assets/Admin Category/Button.png"
                                                 alt="Edit" style="width:15px; height:15px;" />
                                        </button>

                                        <!-- Save button (hidden) -->
                                        <button class="btnIcon" id="saveBtn-${cat.categoryId}"
                                                aria-label="Save category"
                                                style="display:none;"
                                                onclick="saveEdit(${cat.categoryId})">
                                            <img src="<%= request.getContextPath() %>/Assets/Admin Category/Icon.svg"
                                                 alt="Save" style="width:15px; height:15px;" />
                                        </button>

                                        <!-- Cancel button (hidden) -->
                                        <button class="btnIcon" id="cancelBtn-${cat.categoryId}"
                                                aria-label="Cancel edit"
                                                style="display:none;"
                                                onclick="cancelEdit(${cat.categoryId}, '${cat.type}')">
                                            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/close-x-svgrepo-com.svg"
                                                 alt="Cancel" style="width:15px; height:15px;" />
                                        </button>

                                        <!-- Delete button -->
                                        <form method="POST"
                                              action="${pageContext.request.contextPath}/admin/category/delete"
                                              style="display:inline;">

                                            <input type="hidden" name="catId" value="${cat.categoryId}" />

                                            <button class="btnIcon" aria-label="Delete category" type="submit">
                                                <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                                     alt="Delete" style="width:15px; height:15px;" />
                                            </button>

                                        </form>
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

    <script>
        function startEdit(id) {
            document.getElementById('view-' + id).style.display = 'none';
            document.getElementById('editForm-' + id).style.display = 'block';
            document.getElementById('editBtn-' + id).style.display = 'none';
            document.getElementById('saveBtn-' + id).style.display = 'flex';
            document.getElementById('cancelBtn-' + id).style.display = 'flex';
            document.getElementById('editInput-' + id).focus();
        }

        function cancelEdit(id, originalName) {
            document.getElementById('editInput-' + id).value = originalName;
            document.getElementById('editForm-' + id).style.display = 'none';
            document.getElementById('view-' + id).style.display = 'block';
            document.getElementById('editBtn-' + id).style.display = 'flex';
            document.getElementById('saveBtn-' + id).style.display = 'none';
            document.getElementById('cancelBtn-' + id).style.display = 'none';
        }

        function saveEdit(id) {
            document.getElementById('editForm-' + id).submit();
        }
    </script>

</body>
</html>