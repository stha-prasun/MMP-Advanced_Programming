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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminUsers.css" />
</head>

<body>

    <!-- Full-width Top Bar -->
    <jsp:include page="/WEB-INF/pages/AdminNavbar.jsp" />

    <div class="bodyLayout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="nav">
                <a href="<%= request.getContextPath() %>/admin/users" class="navItem active">
                    <div class="navIcon">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                            alt="User Avatar" />
                    </div>
                    USERS
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
                    <div class="pageHeaderText">
                        <h1 class="pageTitle">USERS</h1>
                        <p class="pageSub">MANAGE ACCOUNTS, ROLES, AND STATUS &bull; 5 REGISTERED</p>
                    </div>
                    <div class="divider dividerBlue"></div>
                </div>

                <!-- User Cards -->
                <ul class="userList">

                    <!-- User 1 -->
                    <li class="userCard">
                        <div class="userCardMeta">
                            <span class="metaLabel">ID</span>
                            <span class="metaId">U-001</span>
                        </div>

                        <div class="userCardIdentity">
                            <div class="userAvatar">
                                <div class="avatar">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                        alt="User Avatar" />
                                </div>
                            </div>
                            <span class="userName">Rohan Shrestha</span>
                        </div>

                        <div class="userCardFields">
                            <div class="fieldRow">
                                <span class="fieldLabel">EMAIL</span>
                                <span class="fieldValue">rohanshrestha612@gmail.com</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">ROLE</span>
                                <span class="fieldValue fieldValueBold">ADMIN</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">STATUS</span>
                                <span class="badge badgeActive">ACTIVE</span>
                            </div>
                        </div>

                        <div class="userCardActions">
                            <button type="submit" class="btnSubmit">Deactivate</button>
                        </div>
                    </li>

                    <div class="divider"></div>

                    <!-- User 2 -->
                    <li class="userCard">
                        <div class="userCardMeta">
                            <span class="metaLabel">ID</span>
                            <span class="metaId">S-001</span>
                        </div>

                        <div class="userCardIdentity">
                            <div class="userAvatar">
                                <div class="avatar">
                                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                                        alt="User Avatar" />
                                </div>
                            </div>
                            <span class="userName">Samira Thapa</span>
                        </div>

                        <div class="userCardFields">
                            <div class="fieldRow">
                                <span class="fieldLabel">EMAIL</span>
                                <span class="fieldValue">samira.thapa@mmp.com</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">ROLE</span>
                                <span class="fieldValue fieldValueBold">SELLER</span>
                            </div>
                            <div class="fieldRow">
                                <span class="fieldLabel">STATUS</span>
                                <span class="badge badgeActive">ACTIVE</span>
                            </div>
                        </div>

                        <div class="userCardActions">
                            <button type="submit" class="btnSubmit">Deactivate</button>
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