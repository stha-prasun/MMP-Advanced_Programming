<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>MMP - Buy Smart. Sell Easy. Repeat.</title>
            <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet" />
            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link
                href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
                rel="stylesheet" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link
                href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
                rel="stylesheet" />
            <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Navbar.css" </head>

        <body>
            <section class="navbarSection">
                <!-- Navbar -->
                <div class="navbar">
                    <div class="navLeft">
                        <div class="logo">MMP</div>
                        <ul class="navLinks">
                            <li>About us</li>
                            <li>Contact us</li>
                            <li class="dropdown">Shop <img src="Assets/Home/down.png" alt="" /></li>
                        </ul>
                    </div>
                    <div class="navRight">
                        <div class="searchWrapper">
                            <img class="searchIcon" src="Assets/Home/search.png" alt="" />
                            <input type="text" placeholder="Search..." />
                            <button class="searchBtn">Search</button>
                        </div>
                        <!--  IF user not logged in -->
                        <c:if test="${empty sessionScope.Email}">
                            <a href="${pageContext.request.contextPath}/favourites" href class="favBtn">
                                <img src="Assets/Home/fav.png" alt="favourites" />
                            </a>

                            <a href="${pageContext.request.contextPath}/customer/login" class="cta">Sign up</a>
                        </c:if>

                    </div>
                </div>
            </section>
        </body>