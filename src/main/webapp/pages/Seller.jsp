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
      href="/css/Seller.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- LEFT -->
      <div class="left">
        <h2 class="logo">MMP</h2>
        <img
          src="/assets/peep.svg"
          class="illustration"
        />
      </div>

      <!-- RIGHT -->
      <div class="right">
        <div class="form-box">
          <h1>Become a Seller</h1>

          <form
            method="POST"
            action="/register"
          >
            <input
              type="text"
              name="custName"
              placeholder="Full Name"
              class="input"
            />

            <input
              type="text"
              name="custName"
              placeholder="National Identity No"
              class="input"
            />

            <input
              type="text"
              name="custName"
              placeholder="Location"
              class="input"
            />

            <input
              type="email"
              name="custEmail"
              placeholder="Email address"
              class="input"
            />

            <div class="password-wrapper">
              <input
                type="password"
                name="custPassword"
                placeholder="Password"
                class="input"
                id="password"
              />
              <img
                src="/assets/view.png"
                id="togglePassword"
                class="eye-icon"
              />
            </div>

            <div class="password-wrapper">
              <input
                type="password"
                name="confirmPassword"
                placeholder="Confirm Password"
                class="input"
                id="confirmPassword"
              />
              <img
                src="assets/view.png"
                id="toggleConfirmPassword"
                class="eye-icon"
              />
            </div>

            <button type="submit" class="signup-btn">Sign up</button>

          </form>

        </div>
      </div>
    </div>
