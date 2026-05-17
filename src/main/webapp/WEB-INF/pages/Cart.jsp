<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

<div class="cartRoot">

    <!-- Flash Message -->
    <c:if test="${not empty sessionScope.cartMessage}">
      <div class="cartMessage ${sessionScope.cartMessage eq 'Product added to cart!' ? 'success' : 'error'}">
        ${sessionScope.cartMessage}
        <% session.removeAttribute("cartMessage"); %>
      </div>
    </c:if>

    <div class="cartHeader">
      <h1 class="cartTitle">Your Cart</h1>
      <p class="cartCount">Total Items &bull; ${not empty totalItems ? totalItems : 0}</p>
      <div class="dividerBlue"></div>
    </div>

    <c:choose>
      <c:when test="${empty cartItems}">
        <div class="emptyCart">
          <p>Your cart is empty</p>
          <a href="<%= request.getContextPath() %>/products" class="shopNowBtn">Shop Now</a>
        </div>
      </c:when>
      <c:otherwise>
        <ul class="productList">
          <c:forEach var="item" items="${cartItems}" varStatus="status">
            <li class="productCard">

              <div class="productCardMeta">
                <span class="metaLabel">Item ID</span>
                <span class="metaId">CART-${item.cartItemID}</span>
              </div>

              <div class="productCardIdentity">
                <img src="${not empty item.productImageUrl ? pageContext.request.contextPath.concat('/') : pageContext.request.contextPath.concat('/Assets/Admin Dashboard/products.png')}${not empty item.productImageUrl ? item.productImageUrl : ''}"
                     class="productThumb" alt="${item.productName}"/>
                <span class="productName">${item.productName}</span>
              </div>

              <div class="productCardFields">
                <div class="fieldRow">
                  <span class="fieldLabel">Seller</span>
                  <span class="fieldValue fieldValueBold">${item.sellerName}</span>
                </div>
                <div class="fieldRow">
                  <span class="fieldLabel">Price</span>
                  <span class="fieldValue price">$ ${item.productPrice}</span>
                </div>
              </div>

              <div class="productCardActions">
                <form method="POST" action="${pageContext.request.contextPath}/customer/cart/remove">
                  <input type="hidden" name="cartItemId" value="${item.cartItemID}" />
                  <button type="submit" class="btnDelete" aria-label="Remove item">
                    <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png" class="deleteIcon" alt="delete"/>
                  </button>
                </form>
              </div>

            </li>
            <c:if test="${!status.last}">
              <div class="divider"></div>
            </c:if>
          </c:forEach>
        </ul>

        <div class="summaryBox">
          <p class="summaryTitle">Order Summary</p>

          <div class="summaryLines">
            <div class="summaryLineSubtotal">
              <span>Subtotal</span>
              <span>$ ${totalPrice}</span>
            </div>
            <div class="summaryLineRest">
              <span>Shipping</span>
              <span>$ 7.00</span>
            </div>
            <div class="summaryLineRest">
              <span>Taxes</span>
              <span>$ 7.00</span>
            </div>
          </div>

          <div class="totalLine">
            <span class="totalLabel">Total</span>
            <span class="totalAmt">$ ${totalPrice + 14}</span>
          </div>

          <div class="summaryActions">
              <form method="POST" action="${pageContext.request.contextPath}/customer/checkout" style="display:inline;">
                  <button type="submit" class="checkoutBtn">Proceed to Checkout</button>
              </form>
              <a href="<%= request.getContextPath() %>/products" class="cancelBtn">Cancel</a>
          </div>
        </div>
      </c:otherwise>
    </c:choose>

</div>

</body>
</html>