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
      href="<%= request.getContextPath() %>/CSS/EditProfile.css"
    />
  </head>
  <body>

    <header class="navbar">
      <div class="brand">MMP</div>
      <button class="navbar-logout">Logout</button>
    </header>

    <main class="content">
      <section class="hero">
        <div class="hero-text">
          <h1>HELLO USER!</h1>
          <p>EDIT PERSONAL PROFILE &amp; CONTACT</p>
        </div>
        <button class="save">SAVE CHANGES</button>
      </section>

      <section class="Userprofile">
        <div class="profile">
          <div class="profilephoto">
            <div class="circle">
              <img
                src="<%= request.getContextPath() %>/Assets/Profile/img.png"
                alt="User photo"
              />
            </div>
            <div>
              <p class="profile-title">Apple Banana</p>
            </div>
          </div>
          <button class="change">CHANGE PROFILE</button>
        </div>

        <div class="profile-info">
          <div class="apple">
            <b>Apple Banana</b>
            <button class="edit-link">EDIT USERNAME</button>
          </div>
          <div class="mail">
            <span>rohanshrestha612@gmail.com</span>
            <button class="edit-link">EDIT EMAIL</button>
          </div>
        </div>
      </section>
    </main>

    <div class="bottom">
      <img
        src="<%= request.getContextPath() %>/Assets/Profile/bottom.png"
        alt=""
      />
    </div>

  </body>
</html>