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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Cart.css" />

</head>
<body>
<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

  <div class="cartRoot">

    <div class="cartHeader">
      <h1 class="cartTitle">Your Cart</h1>
      <p class="cartCount">Total Items &bull; 1</p>
      <div class="dividerBlue"></div>
    </div>

    <ul class="productList">
      <li class="productCard">

        <div class="productCardMeta">
          <span class="metaLabel">Order ID</span>
          <span class="metaId">ORD-001</span>
        </div>

        <div class="productCardIdentity">
          <div class="productThumb"></div>
          <span class="productName">Record Player</span>
        </div>

        <div class="productCardFields">
          <div class="fieldRow">
            <span class="fieldLabel">Seller</span>
            <span class="fieldValue fieldValueBold">Rohan Shresha</span>
          </div>
          <div class="fieldRow">
            <span class="fieldLabel">Price</span>
            <span class="fieldValue price">Rps 85.00</span>
          </div>
        </div>

        <div class="productCardActions">
          <button class="btnDelete" aria-label="Remove item">
            <i class="ti tiTrash"></i>
          </button>
        </div>

      </li>
      <div class="divider"></div>
    </ul>

    <div class="summaryBox">
      <p class="summaryTitle">Order Summary</p>

      <div class="summaryLines">
        <div class="summaryLineSubtotal">
          <span>Subtotal</span>
          <span>Rps 85.00</span>
        </div>
        <div class="summaryLineRest">
          <span>Shipping</span>
          <span>Rps 7.00</span>
        </div>
        <div class="summaryLineRest">
          <span>Taxes</span>
          <span>Rps 7.00</span>
        </div>
      </div>

      <div class="totalLine">
        <span class="totalLabel">Total</span>
        <span class="totalAmt">Rps 99.00</span>
      </div>

      <div class="summaryActions">
        <button class="checkoutBtn">Proceed to Checkout</button>
        <button class="cancelBtn">Cancel</button>
      </div>
    </div>

  </div>

</body>
</html>