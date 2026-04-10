<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MMP - Buy Smart. Sell Easy. Repeat.</title>
    <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/User.css" />
  </head>
  <body>
    <section class="heroSection">

      <!-- Navbar -->
      <div class="navbar">
        <div class="navLeft">
          <div class="logo">MMP</div>
          <ul class="navLinks">
            <li>About us</a></li>
            <li>Contact us</a></li>
            <li class="dropdown">Shop <img src="<%= request.getContextPath() %>/Assets/Home/down.png" alt="" /></li>
          </ul>
        </div>
        <div class="navRight">
          <div class="searchWrapper">
            <img class="searchIcon" src="<%= request.getContextPath() %>/Assets/Home/search.png" alt="" />
            <input type="text" placeholder="Search..." />
            <button class="searchBtn">Search</button>
          </div>
          <div class="favBtn">
            <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" alt="favourites" />
          </div>
          <div class="profile">
            <img src="<%= request.getContextPath() %>/Assets/Home/me.png" alt="profile" />
          </div>
        </div>
      </div>

      <!-- Hero Content -->
      <div class="heroContent">
        <div class="heroLeft">
          <h1 class="heroTitle">BUY SMART.<br>SELL EASY. REPEAT.</h1>
          <p class="heroSubtitle">Your go to marketplace for buying and selling second-hand products.</p>
          <button class="cta">SHOP NOW</button>
        </div>
        <div class="heroRight">
          <img src="<%= request.getContextPath() %>/Assets/Home/watch.png" alt="Watch" />
        </div>
      </div>

    </section>

    <!-- Footer -->
    <footer class="footer">
      <div class="footerLeft">
        <div class="footerTop">
          <div class="footerLogo">MMP</div>
          <div class="tagline">
            <p class="footerTagline">Buy Smart. Sell Easy.</p>
            <p class="footerTagline">Repeat.</p>
          </div>
        </div>
        <div class="footerCopy">© MMP All Right Reserved.</div>
        <div class="footerBgText">MMP</div>
      </div>

      <div class="footerRight">
        <div class="footerCol">
          <h4>Shop By Categories</h4>
          <ul>
            <li>Electronics</li>
            <li>Furniture</li>
            <li>Outdoors</li>
            <li>Hardware Tools</li>
            <li>Others</li>
          </ul>
        </div>
        <div class="footerCol">
          <h4>Company</h4>
          <ul>
            <li><a href="<%= request.getContextPath() %>/pages/About.jsp">About Us</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/Contact.jsp">Contact Us</a></li>
          </ul>
          <h4 style="margin-top: 1.5rem;">Follow Us</h4>
          <ul>
            <li><a href="https://www.instagram.com" target="_blank">Instagram</a></li>
            <li><a href="https://www.facebook.com" target="_blank">Facebook</a></li>
          </ul>
        </div>
        <div class="footerCol">
          <h4>Legal</h4>
          <ul>
            <li><a href="<%= request.getContextPath() %>/pages/Terms.jsp">Terms &amp; Conditions</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/Privacy.jsp">Privacy Policy</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/Cookies.jsp">Cookie Policy</a></li>
          </ul>
        </div>
      </div>
    </footer>

  </body>
</html>