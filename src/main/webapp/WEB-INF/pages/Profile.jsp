<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
            <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Profile.css" </head>

  <body>

    <nav class="navbar">
      <div class= "navLinks">
      <div class="logo">MMP</div>
        <button class="navbarLogout">
          <span>Logout</span>
          <img src="<%= request.getContextPath() %>/Assets/Profile/logout.png" alt="Logout" />
        </button>
      </div>
    </nav>

    <div class="user">
      <h1>HELLO USER!</h1>
    </div>

    <div class="editPadding">
      <div class="contact">Personal Profile and Contact</div>
      <a href="<%= request.getContextPath() %>/profile/edit" class="editProfile">
        <img src="<%= request.getContextPath() %>/Assets/Profile/edit.png" alt="Edit" />
        <span>EDIT PROFILE</span>
      </a>
    </div>

    <div class="profile">
      <div class="circle">
        <img
          src="${pageContext.request.contextPath}/${sessionScope.custProfileImg}"
          alt="User photo"
        />
      </div>

    <div class="text">
      <div class="textTop">
        <h6>FULL NAME</h6>
        <h1>${sessionScope.Name}</h1>
        </div>

      <div class="textBottom">
        <h6>EMAIL ADDRESS</h6>
        <h3>${sessionScope.Email}</h3>
        </div>
      </div>
    </div>


    <div class="bottom">
      <img
        src="<%= request.getContextPath() %>/Assets/Profile/bottom.png"
        alt=""/>
    </div>

  </body>
</html>