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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminProduct.css" />
</head>

<body>

    <!-- Full-width Top Bar -->
    <jsp:include page="/WEB-INF/pages/AdminNavbar.jsp" />

    <div class="bodyLayout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="nav">
                <a href="<%= request.getContextPath() %>/admin/customer" class="navItem">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" alt="Users" />
                    </div>
                    USERS
                </a>
                <a href="<%= request.getContextPath() %>/admin/product" class="navItem active">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                            alt="Products" />
                    </div>
                    PRODUCTS
                </a>
                <a href="<%= request.getContextPath() %>/admin/category" class="navItem">
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
                    <c:if test="${not empty productList}">
                        <div class="pageHeaderText">
                            <h1 class="pageTitle">PRODUCT</h1>
                            <p class="pageSub">REVIEW, APPROVE, AND MANAGE LISTINGS &bull; &nbsp;${fn:length(productList)} TOTAL</p>
                        </div>
                    </c:if>
                    <c:if test="${empty productList}">
                        <div class="pageHeaderText">
                            <h1 class="pageTitle">PRODUCT</h1>
                            <p class="pageSub">REVIEW, APPROVE, AND MANAGE LISTINGS &bull; &nbsp;0 TOTAL</p>
                        </div>
                    </c:if>
                    <div class="divider dividerBlue"></div>
                </div>

                <c:choose>
                    <c:when test="${empty productList}">
                        <div class="usersCenteredContainer">
                                                            <!-- Page Header -->
                                                            <section class="emptyState">
                                                              <img src="<%= request.getContextPath() %>/Assets/User/peeps.png" alt="profile" />
                                                              <h1 class="emptyText">
                                                                No Customers <br>
                                                                <span>yet</span>
                                                              </h1>
                                                            </section>
                                                          </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Product Cards -->
                        <ul class="productList">
                            <c:forEach var="product" items="${productList}" varStatus="status">
                                <li class="productCard">
                                    <div class="productCardMeta">
                                        <span class="metaLabel">ID</span>
                                        <span class="metaId">PRO-${product.productId}</span>
                                    </div>
                                    <div class="productCardIdentity">
                                        <div class="productThumb">
                                            <img src="${not empty product.productImageUrl ? pageContext.request.contextPath.concat(product.productImageUrl) : pageContext.request.contextPath.concat('/Assets/Admin Dashboard/products.png')}"
                                                alt="${product.productName}" />
                                        </div>
                                        <span class="productName">${product.productName}</span>
                                    </div>
                                    <div class="productCardFields">
                                        <div class="fieldRow">
                                            <span class="fieldLabel">SELLER</span>
                                            <span class="fieldValue fieldValueBold">${product.sellerName}</span>
                                        </div>
                                        <div class="fieldRow">
                                            <span class="fieldLabel">PRICE</span>
                                            <span class="fieldValue">
                                                $ ${product.productPrice}
                                            </span>
                                        </div>
                                        <div class="fieldRow">
                                            <span class="fieldLabel">CATEGORY</span>
                                            <span class="fieldValue fieldValueBold">${product.productCategory}</span>
                                        </div>
                                        <div class="fieldRow">
                                            <span class="fieldLabel">STATUS</span>
                                            <c:choose>
                                                <c:when test="${product.productIsSold}">
                                                    <span class="badge badgeApproved">APPROVED</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badgePending">PENDING</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <div class="productCardActions ${!product.productIsSold ? 'productCardActionsPending' : ''}">
                                        <c:choose>
                                            <c:when test="${!product.productIsSold}">
                                                <!-- PENDING: Show Approve and Reject buttons -->
                                                <form method="POST" action="${pageContext.request.contextPath}/admin/product" style="display:inline;">
                                                    <input type="hidden" name="action" value="approve" />
                                                    <input type="hidden" name="productId" value="${product.productId}" />
                                                    <button class="btnApprove" aria-label="Approve product" type="submit">
                                                        <img src="<%= request.getContextPath() %>/Assets/Admin Category/Icon.svg"
                                                            alt="tick icon" style="width:16px; height:16px;">
                                                    </button>
                                                </form>

                                                <form method="POST" action="${pageContext.request.contextPath}/admin/product" style="display:inline;">
                                                    <input type="hidden" name="action" value="reject" />
                                                    <input type="hidden" name="productId" value="${product.productId}" />
                                                    <button class="btnReject" aria-label="Reject product" type="submit">
                                                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/close-x-svgrepo-com.svg"
                                                            alt="close icon" style="width:16px; height:16px;">
                                                    </button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- APPROVED: Show Delete button -->
                                                <form method="POST" action="${pageContext.request.contextPath}/admin/product" style="display:inline;">
                                                    <input type="hidden" name="action" value="delete" />
                                                    <input type="hidden" name="productId" value="${product.productId}" />
                                                    <button class="btnDelete" aria-label="Delete product" type="submit">
                                                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                                            alt="Delete" style="width:16px; height:16px;" />
                                                    </button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </li>

                                <c:if test="${!status.last}">
                                    <div class="divider"></div>
                                </c:if>
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