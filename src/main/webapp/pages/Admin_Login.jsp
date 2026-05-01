<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Modak&display=swap"
      rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/CSS/Admin_Login.css"
    />
  </head>
  <body>
    <div class="container">

      <!-- RIGHT -->
      <div class="right">
      <div class="crowd-bg">
        <img class="crowd-img" src="<%= request.getContextPath() %>/Assets/Login/apple.png">
      </div>
        <div class="form-box">
          <h1>Hello Admin?</h1>
          <% if (request.getAttribute("error") !=null) { %>
             <p style="color: red">
                <%= request.getAttribute("error") %>
                </p>
             <% } %>
          <form method="POST" action="<%= request.getContextPath() %>/admin/login">
          <input type="email" name="AdminEmail" placeholder="Email address" class="input" />
          <div class="password-wrapper">
            <input
              type="password"
              name="AdminPass"
              placeholder="Password"
              class="input"
              id="password"
            />
            <img
              src="<%= request.getContextPath() %>/Assets/Login/view.png"
              id="togglePassword"
              class="eye-icon"
            />
          </div>
          <button type="submit" class="login-btn">Login</button>
        </div>
        </form>
      </div>
    </div>

    <script>
      const toggle = document.getElementById("togglePassword");
      const password = document.getElementById("password");

      toggle.addEventListener("click", () => {
        if (password.type === "password") {
          password.type = "text";
          toggle.src = "<%= request.getContextPath() %>/Assets/Login/hide.png";
        } else {
          password.type = "password";
          toggle.src = "<%= request.getContextPath() %>/Assets/Login/view.png";
        }
      });
    </script>
  </body>
</html>
