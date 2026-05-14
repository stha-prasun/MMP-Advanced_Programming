<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />

    <title>MMP - Sellers</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
          rel="stylesheet" />

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/CSS/AdminUsers.css" />
</head>

<body>

    <jsp:include page="/WEB-INF/pages/AdminNavbar.jsp" />

    <div class="bodyLayout">

        <!-- Sidebar -->
        <aside class="sidebar">

            <nav class="nav">

              <a href="<%= request.getContextPath() %>/admin/customer" class="navItem">
                <div class="navIcon">
                  <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" />
                </div>
                USERS
              </a>

              <a href="<%= request.getContextPath() %>/admin/seller" class="navItem active">
                <div class="navIcon">
                  <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" />
                </div>
                SELLERS
              </a>

              <a href="<%= request.getContextPath() %>/admin/product" class="navItem">
                <div class="navIcon">
                  <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png" />
                </div>
                PRODUCTS
              </a>
              <a href="<%= request.getContextPath() %>/admin/category" class="navItem">
                <div class="navIcon">
                  <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png" alt="User Avatar" />
                </div>
                CATEGORIES
              </a>

            </nav>

        </aside>

        <!-- MAIN -->
        <main class="main">

            <div class="usersCenteredContainer">

                <!-- HEADER -->
                <div class="pageHeader">

                    <c:if test="${not empty sellers}">
                        <div class="pageHeaderText">

                            <h1 class="pageTitle">SELLERS</h1>

                            <p class="pageSub">
                                MANAGE SELLERS &bull;
                                ${fn:length(sellers)} REGISTERED
                            </p>

                        </div>
                    </c:if>

                    <c:if test="${empty sellers}">
                        <div class="pageHeaderText">

                            <h1 class="pageTitle">SELLERS</h1>

                            <p class="pageSub">
                                NO SELLERS REGISTERED
                            </p>

                        </div>
                    </c:if>

                    <div class="divider dividerBlue"></div>

                </div>

                <!-- SELLER LIST -->
                <c:choose>

                    <c:when test="${empty sellers}">

                        <div class="emptyState">
                            <p>No SELLERS found.</p>
                        </div>

                    </c:when>

                    <c:otherwise>

                        <ul class="userList">

                            <c:forEach var="seller" items="${sellers}">

                                <li class="userCard">

                                    <!-- ID -->
                                    <div class="userCardMeta">

                                        <span class="metaLabel">
                                            ID
                                        </span>

                                        <span class="metaId">
                                            S-00${seller.sellerId}
                                        </span>

                                    </div>

                                    <!-- Identity -->
                                    <div class="userCardIdentity">

                                        <div class="userAvatar">

                                            <div class="avatar">
                                                <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                                     alt="Seller Avatar" />
                                            </div>

                                        </div>

                                        <span class="userName">
                                            ${seller.sellerName}
                                        </span>

                                    </div>

                                    <!-- Fields -->
                                    <div class="userCardFields">

                                        <div class="fieldRow">

                                            <span class="fieldLabel">
                                                EMAIL
                                            </span>

                                            <span class="fieldValue">
                                                ${seller.sellerEmail}
                                            </span>

                                        </div>

                                        <div class="fieldRow">

                                            <span class="fieldLabel">
                                                ROLE
                                            </span>

                                            <span class="fieldValue fieldValueBold">
                                                SELLER
                                            </span>

                                        </div>

                                        <div class="fieldRow">

                                            <span class="fieldLabel">
                                                STATUS
                                            </span>

                                            <span class="badge badgeActive">${seller.sellerIsActive ? 'Active' : 'InActive'}</span>

                                        </div>

                                    </div>

                                    <!-- ACTIONS -->
                                    <c:choose>

                                        <c:when test="${seller.sellerIsActive}">

                                            <div class="userCardActions">

                                                <form action="<%= request.getContextPath() %>/admin/seller"
                                                      method="post">

                                                    <input type="hidden"
                                                           name="sellerId"
                                                           value="${seller.sellerId}" />

                                                    <input type="hidden"
                                                           name="status"
                                                           value="false" />

                                                    <button type="submit"
                                                            class="btnSubmit">

                                                        Deactivate

                                                    </button>

                                                </form>

                                            </div>

                                        </c:when>

                                        <c:otherwise>

                                            <div class="userCardActions">

                                                <form action="<%= request.getContextPath() %>/admin/seller"
                                                      method="post">

                                                    <input type="hidden"
                                                           name="sellerId"
                                                           value="${seller.sellerId}" />

                                                    <input type="hidden"
                                                           name="status"
                                                           value="true" />

                                                    <button type="submit"
                                                            class="btnSubmit">

                                                        Activate

                                                    </button>

                                                </form>

                                            </div>

                                        </c:otherwise>

                                    </c:choose>

                                </li>

                                <div class="divider"></div>

                            </c:forEach>

                        </ul>

                    </c:otherwise>

                </c:choose>

            </div>

        </main>

    </div>

</body>

</html>