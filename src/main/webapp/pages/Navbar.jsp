<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
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

                <!-- Navbar -->
        <section class="navbarSection">
                <div class="navbar">
                    <div class="navLeft">
                        <div class="logo">MMP</div>
                        <ul class="navLinks">
                            <li>About us</li>
                            <li>Contact us</li>
                            <li class="dropdown">Shop <img src="<%= request.getContextPath() %>/Assets/Home/down.png" alt="" /></li>
                        </ul>
                    </div>
                    <div class="navRight">
                        <div class="searchWrapper">
                            <img class="searchIcon" src="<%= request.getContextPath() %>/Assets/Home/search.png" alt="" />
                            <input type="text" placeholder="Search..." />
                            <button class="searchBtn">Search</button>
                        </div>
                        <!--  IF user not logged in -->
                        <c:choose>
                            <c:when test="${empty sessionScope.Email}">
                                <a href="${pageContext.request.contextPath}/customer/register" class="navbarBtn">Sign up</a>
                            </c:when>

                            <c:otherwise>
                                <span>Welcome, ${sessionScope.Email}</span>
                                <a href="${pageContext.request.contextPath}/logout" class="navbarBtn">Logout</a>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
        <section>
        </body>