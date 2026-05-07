<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MMP</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/IndividualProduct.css" />

</head>
<body>
<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

<div class="productSection">

    <div class="leftProduct">
        <img src="<%= request.getContextPath() %>/Assets/Product/product8.png" alt="product image"/>
    </div>

    <div class="rightProduct">

        <p>Electronics</p>

        <h2>Minimalist Headphones</h2>

        <h6>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
        </h6>

        <h3><span>$</span>299</h3>

        <div class="buttons">
            <button class="addToCart">ADD TO CART</button>
            <button class="buyNow">BUY NOW</button>
        </div>

    </div>

</div>

</body>
</html>