<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MMP</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=PT+Mono&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/About.css" />

</head>
<body>
<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

<section class = "aboutHero">
    <div class="heroLeft">
    <h1>About Us</h1>
    <p>Malik Market Place, or MPP, started with a simple idea. I saw people around me holding onto items they no longer used while others were looking for the same things at lower prices. </p>
    <p>MPP brings those two sides together. You can list used products in a few steps, set your price, and reach buyers without going through layers of middlemen. Buyers get access to a wide range of items that still have value, from electronics to furniture, all in one place.</p>
    </div>

    <div class="heroRight">
    <img src="<%= request.getContextPath() %>/Assets/User/About.png" alt=""/>
    </div>

</section>

<section class="story">
    <h1>Our Story</h1>
    <p>We built Malik Market Place (MPP), after seeing how often useful items go unused while others search for the same things at lower prices. I wanted a simpler way for you to list what you have and find what you need without delays or confusion.</p>
</section>

<section class="team">
        <div class = "member">
        <img src="<%= request.getContextPath() %>/Assets/User/Umang.png" alt=""/>
        <h4>Umang Kansakar</h4>
        <p>backend dev</p>
        </div>

        <div class = "member">
        <img src="<%= request.getContextPath() %>/Assets/User/Pramish.png" alt=""/>
        <h4>Pramish Devkota</h4>
        <p>devops</p>
        </div>

        <div class = "member">
        <img src="<%= request.getContextPath() %>/Assets/User/Meetej.png" alt=""/>
        <h4>Meetej Saru Magar</h4>
        <p>qa/qt</p>
        </div>

        <div class = "member">
        <img src="<%= request.getContextPath() %>/Assets/User/Prasun.png" alt=""/>
        <h4>Prasun Shrestha</h4>
        <p>tech lead</p>
        </div>

        <div class = "member">
        <img src="<%= request.getContextPath() %>/Assets/User/Sanrose.png" alt=""/>
        <h4>Sanrose Bhetuwal</h4>
        <p>fullstack dev</p>
        </div>

        <div class = "member">
        <img src="<%= request.getContextPath() %>/Assets/User/Rohan.png" alt=""/>
        <h4>Rohan Shrestha</h4>
        <p>frontend dev</p>
        </div>
</section>

<section class = "newsleter">
    <div class="heroLeft">
    <img src="<%= request.getContextPath() %>/Assets/User/AboutUpside.png" alt=""/>
    </div>

    <div class="heroRight">
    <p>Get updates from Malik Market Place, MPP, on new listings and price drops. I send short picks and useful deals so you can find value fast. Join to stay in the loop and make better second-hand buys.</p>
    <button>Newsletter</button>
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