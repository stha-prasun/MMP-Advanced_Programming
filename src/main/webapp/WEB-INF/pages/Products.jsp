<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MMP</title>

    <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link
        href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet" />

    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Product.css">
</head>

<body>
<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

<section class="heroSection">

  <div class="heroCarousel">
    <img src="<%= request.getContextPath() %>/Assets/Product/c1.jpg" class="heroSlide active" />
    <img src="<%= request.getContextPath() %>/Assets/Product/c2.jpg" class="heroSlide" />
    <img src="<%= request.getContextPath() %>/Assets/Product/c3.jpg" class="heroSlide" />
  </div>

  <div class="heroContainer">
    <div class="heroContent">
      <div class="heroLeft">
        <h1 class="heroTitle">
          BUY SMART.<br>
          SELL EASY. REPEAT.
        </h1>

        <p class="heroDescription">
          Precision engineering meets timeless design.
          Explore your curated collection of modern watches.
        </p>

        <button class="heroButton">SHOP NOW</button>
      </div>
    </div>


  </div>
</section>
    <div class="heroActions">
      <button class="heroActionBtn">FILTER</button>
      <button class="heroActionBtn">SORT BY</button>
    </div>

<section class="productSection">

  <div class="productGrid">

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product1.png" class="productImage"/>
        <button class="wishlistBtn">
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product2.png" class="productImage"/>
        <button class="wishlistBtn">
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product3.png" class="productImage"/>
        <button class="wishlistBtn">
          <!-- FIXED LINE -->
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product4.png" class="productImage"/>
        <button class="wishlistBtn">
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product5.png" class="productImage"/>
        <button class="wishlistBtn">
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product6.png" class="productImage"/>
        <button class="wishlistBtn">
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product7.png" class="productImage"/>
        <button class="wishlistBtn">
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

    <!-- CARD -->
    <div class="productCard">
      <div class="productImageWrapper">
        <img src="<%= request.getContextPath() %>/Assets/Product/product8.png" class="productImage"/>
        <button class="wishlistBtn">
          <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon"/>
        </button>
      </div>
      <div class="productInfo">
        <p class="productCategory">ELECTRONICS</p>
        <h3 class="productName">MINIMALIST HEADPHONES</h3>
        <p class="productPrice">$299</p>
      </div>
    </div>

  </div>

  <div class="shopMoreWrapper">
    <button class="shopMoreBtn">SHOP ALL PRODUCTS</button>
  </div>

</section>

<jsp:include page="/WEB-INF/pages/Footer.jsp" />

<script>
  let index = 0;
  const slides = document.querySelectorAll(".heroSlide");

  function showSlide(i) {
    slides.forEach(s => s.classList.remove("active"));
    slides[i].classList.add("active");
  }

  setInterval(() => {
    index = (index + 1) % slides.length;
    showSlide(index);
  }, 3000);
</script>
</body>
</html>