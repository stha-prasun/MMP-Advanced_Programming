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
      href="<%= request.getContextPath() %>/CSS/Login.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- LEFT -->
      <div class="left">
        <h2 class="logo">MMP</h2>
        <img
          src="<%= request.getContextPath() %>/Assets/Login/peep.png"
          class="illustration"
        />
      </div>

      <!-- RIGHT -->
      <div class="right">
        <div class="form-box">
          <h1>Welcome back!</h1>
          <p class="signup-text">
            Don’t have an account?
            <a href="<%= request.getContextPath() %>/customer/register">Sign up now</a>
          </p>
          <% if (request.getAttribute("error") !=null) { %>
          <p style="color: red">
          <%= request.getAttribute("error") %>
          </p>
          <% } %>
          <form method="POST" action="<%= request.getContextPath() %>/login">

            <input type="email" placeholder="Email address" name="Email" class="input" />

              <div class="password-wrapper">
                <input
                  type="password"
                  placeholder="Password"
                  name = "custPassword"
                  class="input"
                  id="password"
                />

                <img
                  src="<%= request.getContextPath() %>/Assets/Login/view.png"
                  id="togglePassword"
                  class="eye-icon"
                />
              </div>

              <p class="role-text">Login as a customer or seller?</p>

              <div class="roles">
                <label><input type="radio" name="role" value="Customer"/> Customer</label>
                <label><input type="radio" name="role" value="Seller"/> Seller</label>
              </div>

              <button class="login-btn">Login</button>

              <div class="bottom-row">
                <label><input type="checkbox" /> Remember me</label>
                <a href="#" class="forgot">Forgot password?</a>
              </div>

              <button class="google-btn">
                <img
                  src="https://cdn-icons-png.flaticon.com/512/2991/2991148.png"
                />
                Continue with Google
              </button>
          </form>
        </div>
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
