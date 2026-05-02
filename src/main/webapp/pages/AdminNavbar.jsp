<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>MMP</title>
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
            <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminNavbar.css">
        </head>

        <body>

                <!-- Navbar -->
        <header class="topbar">

              <a href="<%= request.getContextPath() %>/admin/dashboard" class="logo-anchor">
                <div class="logo">MMP</div>
              </a>

              <div class="search-wrap">
                <img class="search-icon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/Search.png" alt="Search" />
                <input type="text" class="search-input" placeholder="Search..." />
                <button class="search-btn">Search</button>
              </div>

              <div class="topbar-right">
              <a href="<%= request.getContextPath() %>/admin/category/add">
                <button class="add-btn">
                  <span class="add-plus">+</span> ADD NEW
                </button>
              </a>
                <div class="divider-v"></div>
                <div class="user-info">
                  <span class="username">JOHN DOE</span>
                  <div class="avatar">
                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" alt="User Avatar" />
                  </div>
                </div>
              </div>

            </header>