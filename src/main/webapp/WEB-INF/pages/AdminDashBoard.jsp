<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MMP</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminDashBoard.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet" />
</head>

<body>
    <jsp:include page="/WEB-INF/pages/AdminNavbar.jsp" />

    <!-- Body: Sidebar + Main -->
    <div class="bodyLayout">

        <aside class="sidebar">
            <nav class="nav">
                <a href="<%= request.getContextPath() %>/admin/users" class="navItem">
                    <img class="navIcon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png"
                        alt="Users" />
                    USERS
                </a>
                <a href="<%= request.getContextPath() %>/admin/product" class="navItem">
                    <img class="navIcon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png"
                        alt="Products" />
                    PRODUCTS
                </a>
                <a href="#" class="navItem">
                    <img class="navIcon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png"
                        alt="Categories" />
                    CATEGORIES
                </a>
            </nav>
        </aside>

        <main class="main">
            <div class="hero">
                <h1 class="heroTitle">SYSTEM<br />INDEX</h1>
                <p class="heroSub">CONTROL PANEL</p>
            </div>

            <div class="divider dividerBlue"></div>

            <ul class="indexList">
                <li class="indexItem">
                    <span class="indexNum">01</span>
                    <div class="indexContent">
                        <h2 class="indexName">USERS</h2>
                        <p class="indexDesc">Manage accounts, roles, and status.</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/admin/users" class="indexArrow"
                        aria-label="Go to Users">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/right arrow.png"
                            alt="Arrow" />
                    </a>
                </li>

                <div class="divider"></div>

                <li class="indexItem">
                    <span class="indexNum">02</span>
                    <div class="indexContent">
                        <h2 class="indexName">PRODUCTS</h2>
                        <p class="indexDesc">Review, approve, and filter listings.</p>
                    </div>
                    <a href="<%= request.getContextPath() %>/admin/product" class="indexArrow"
                        aria-label="Go to Products">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/right arrow.png"
                            alt="Arrow" />
                    </a>
                </li>

                <div class="divider"></div>

                <li class="indexItem">
                    <span class="indexNum">03</span>
                    <div class="indexContent">
                        <h2 class="indexName">CATEGORIES</h2>
                        <p class="indexDesc">Organize the platform taxonomy.</p>
                    </div>
                    <a href="#" class="indexArrow" aria-label="Go to Categories">
                        <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/right arrow.png"
                            alt="Arrow" />
                    </a>
                </li>

                <div class="divider"></div>
            </ul>
        </main>
    </div>

</body>

</html>