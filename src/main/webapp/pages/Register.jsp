<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
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
      href="<%= request.getContextPath() %>/CSS/Register.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- LEFT -->
      <div class="left">
        <h2 class="logo">MMP</h2>
        <img
          src="<%= request.getContextPath() %>/Assets/Login/peep.svg"
          class="illustration"
        />
      </div>

      <!-- RIGHT -->
      <div class="right">
        <div class="form-box">
          <h1>Create Your Account</h1>
          <p class="signup-text">
            Already have an account?
            <a href="<%= request.getContextPath() %>/login">Login</a>
          </p>

          <input type="text" placeholder="Full Name" class="input" />
          <input type="email" placeholder="Email address" class="input" />

          <div class="password-wrapper">
            <input
              type="password"
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

          <div class="password-wrapper">
            <input
              type="password"
              placeholder="Confirm Password"
              class="input"
              id="confirmPassword"
            />
            <img
              src="<%= request.getContextPath() %>/Assets/Login/view.png"
              id="toggleConfirmPassword"
              class="eye-icon"
            />
          </div>

          <p class="role-text">Sign up as a customer or seller?</p>

          <div class="roles">
            <label><input type="radio" name="role" /> Customer</label>
            <label><input type="radio" name="role" /> Seller</label>
          </div>

          <div class="terms">
            <label
              ><input type="checkbox" /> I agree to the Terms and
              Conditions</label
            >
          </div>

          <button class="signup-btn">Sign up</button>
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

      const toggleConfirm = document.getElementById("toggleConfirmPassword");
      const confirmPassword = document.getElementById("confirmPassword");

      toggleConfirm.addEventListener("click", () => {
        if (confirmPassword.type === "password") {
          confirmPassword.type = "text";
          toggleConfirm.src =
            "<%= request.getContextPath() %>/Assets/Login/hide.png";
        } else {
          confirmPassword.type = "password";
          toggleConfirm.src =
            "<%= request.getContextPath() %>/Assets/Login/view.png";
        }
      });
    </script>
  </body>
</html>
