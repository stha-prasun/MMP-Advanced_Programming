<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Modak&family=DM+Sans:wght@400;500;600;700;900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/CSS/Profile.css"
    />
  </head>
  <body>

    <nav class="navbar">
      <div class="navbar-brand">MMP</div>
      <button class="navbar-logout">Logout</button>
    </nav>

    <div class="user">
      <h1>HELLO USER!</h1>
    </div>

    <div class="weluser">
      <div class="contact">Personal Profile and Contact</div>
      <button class="edit">Edit Profile</button>
    </div>

    <div class="photo">
      <div class="circle">
        <img
          src="<%= request.getContextPath() %>/Assets/Profile/img.png"
          alt="User photo"
        />
      </div>
      <div class="text">
        <div class="name">FULL NAME</div>
        <div class="app"><h1>Apple Banana</h1></div>
        <div class="mail">EMAIL ADDRESS</div>
        <div class="mailname"><h3>user@gmail.com</h3></div>
      </div>
    </div>

    <div class="bottom">
      <img
        src="<%= request.getContextPath() %>/Assets/Profile/bottom.png"
        alt=""
      />
    </div>

  </body>
</html>