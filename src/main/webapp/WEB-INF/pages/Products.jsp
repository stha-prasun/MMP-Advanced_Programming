<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Products</title>

  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Instrument+Serif:ital@0;1&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Product.css" />
</head>

<body>

<section class="heroSection">

  <div class="heroContainer">

    <div class="heroContent">

      <div class="heroLeft">

        <h1 class="heroTitle">
          BUY SMART.<br>
          SELL EASY. REPEAT.
        </h1>

        <p class="heroDescription">
          Precision engineering meets timeless design.
          Explore our curated collection of modern watches.
        </p>

        <button class="heroButton">
          SHOP NOW
        </button>

      </div>

      <div class="heroRight">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/watch.png"
          alt="Watch Product"
          class="heroImage"
        />

      </div>

    </div>

    <div class="heroActions">

      <button class="heroActionBtn">
        FILTER
      </button>

      <button class="heroActionBtn">
        SORT BY
      </button>

    </div>

  </div>

</section>

<section class="productSection">

  <div class="productGrid">

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product1.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product2.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product3.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product4.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product5.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product6.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product7.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

    <!-- CARD -->

    <div class="productCard">

      <div class="productImageWrapper">

        <img
          src="<%= request.getContextPath() %>/Assets/Product/product8.png"
          alt="Product"
          class="productImage"
        />

        <button class="wishlistBtn">

          <img
            src="<%= request.getContextPath() %>/Assets/Icons/favourite.png"
            alt="Wishlist"
            class="wishlistIcon"
          />

        </button>

      </div>

      <div class="productInfo">

        <p class="productCategory">
          ELECTRONICS
        </p>

        <h3 class="productName">
          MINIMALIST HEADPHONES
        </h3>

        <p class="productPrice">
          $299
        </p>

      </div>

    </div>

  </div>

  <div class="shopMoreWrapper">

    <button class="shopMoreBtn">
      SHOP ALL PRODUCTS
    </button>

  </div>

</section>

</body>
</html>