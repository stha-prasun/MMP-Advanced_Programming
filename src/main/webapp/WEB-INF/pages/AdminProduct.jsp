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
    <jsp:include page="/WEB-INF/pages/AdminNavbar.jsp" />

    <div class="bodyLayout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="nav">
                <a href="<%= request.getContextPath() %>/admin/users" class="navItem">
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
                    <div class="pageHeaderText">
                        <h1 class="pageTitle">PRODUCT</h1>
                        <p class="pageSub">REVIEW, APPROVE, AND MANAGE LISTINGS 5 TOTAL</p>
                    </div>
                    <div class="divider dividerBlue"></div>
                </div>

                <!-- Product Cards -->
                <ul class="productList">

                    <!-- Product 1 -->
                    <li class="productCard">
                        <div class="productCardMeta">
                            <span class="metaLabel">ID</span>
                            <span class="metaId">PRO-1043</span>
                        </div>
                        <div class="productCardIdentity">
                            <div class="productThumb">
                                <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                    alt="Record Player" />
                            </div>
                            <span class="productName">Record Player</span>
                        </div>
                        <div class="productCardFields">
                            <div class="fieldRow">
                                <span class="fieldLabel">SELLER</span>
                                <span class="fieldValue fieldValueBold">Rohan Shrestha</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">PRICE</span>
                                <span class="fieldValue">$4200.00</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">CATEGORY</span>
                                <span class="fieldValue fieldValueBold">FURNITURE</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">STATUS</span>
                                <span class="badge badgeApproved">APPROVED</span>
                            </div>
                        </div>
                        <div class="productCardActions">
                            <button class="btnDelete" aria-label="Delete product">
                                <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png"
                                    alt="Delete" style="width:16px; height:16px;" />
                            </button>
                        </div>
                    </li>

                    <div class="divider"></div>

                    <!-- Product 2 -->
                    <li class="productCard">
                        <div class="productCardMeta">
                            <span class="metaLabel">ID</span>
                            <span class="metaId">PRO-1043</span>
                        </div>
                        <div class="productCardIdentity">
                            <div class="productThumb">
                                <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                                    alt="Record Player" />
                            </div>
                            <span class="productName">Record Player</span>
                        </div>
                        <div class="productCardFields">
                            <div class="fieldRow">
                                <span class="fieldLabel">SELLER</span>
                                <span class="fieldValue fieldValueBold">Rohan Shrestha</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">PRICE</span>
                                <span class="fieldValue">$4200.00</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">CATEGORY</span>
                                <span class="fieldValue fieldValueBold">FURNITURE</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">STATUS</span>
                                <span class="badge badgePending">PENDING</span>
                            </div>
                        </div>
                        <div class="productCardActions productCardActionsPending">
                            <button class="btnApprove" aria-label="Approve product">
                                <img src="<%= request.getContextPath() %>/Assets/Admin Category/Icon.svg"
                                    alt="tick icon" style="width:16px; height:16px;">
                            </button>
                            <button class="btnReject" aria-label="Reject product">
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