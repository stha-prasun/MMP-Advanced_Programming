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
            <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/EditProfile.css" </head>
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
       <div class="contact">Edit Personal Profile & Contact</div>
       <button class="editProfile">
         <span>SAVE CHANGES</span>
       </button>
     </div>

      <section class="Userprofile">
            <div class="profile">
              <div class="profilephoto">
                <div class="circle">
                  <img
                    src="<%= request.getContextPath() %>/Assets/Profile/img.png"
                    alt="User photo"
                  />
                </div>
              </div>
              <div class ="photoUpload">
                <input type="file" name="image" class="inputPhoto" /></div>
            </div>

            <div class="username">
                      <div class="fullname">Apple Banana</div>
                      <div class="editUsername">Edit Username</div>
            </div>

            <div class="mail">
                      <div class="mailAddress">rohanshrestha612@gmail.com</div>
                      <div class="editMail">Edit Email</div>
            </div>
        </section>
    </main>

    <div class="bottom">
      <img
        src="<%= request.getContextPath() %>/Assets/Profile/bottom.png"
        alt=""/>
    </div>

  </body>
</html>