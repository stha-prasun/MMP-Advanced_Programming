<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- Display cart message if exists -->
<c:if test="${not empty sessionScope.cartMessage}">
  <div class="cartMessage ${sessionScope.cartMessage eq 'success' ? 'success' : 'error'}">
    ${sessionScope.cartMessage}
    <% session.removeAttribute("cartMessage"); %>
  </div>
</c:if>

<div class="productSection">
    <div class="leftProduct">
        <img src="<%= request.getContextPath() %>/${product.productImageUrl}"
             alt="${product.productName}" onerror="this.src='<%= request.getContextPath() %>/Assets/Home/NOTFOUND.png'"/>
    </div>
    <div class="rightProduct">
        <p>${product.productCategory}</p>
        <h2>${product.productName}</h2>
        <h6>${product.productDescription}</h6>
        <h3><span>$</span>${product.productPrice}</h3>

        <!-- Check if product is sold -->
        <c:choose>
            <c:when test="${product.productIsSold}">
                <p class="soldOut">SOLD OUT</p>
            </c:when>
            <c:otherwise>
                <div class="buttons">
                    <!-- Add to Cart Form -->
                    <form method="POST" action="${pageContext.request.contextPath}/customer/cart/add" style="display:inline;">
                        <input type="hidden" name="productId" value="${product.productId}" />
                        <button type="submit" class="addToCart">ADD TO CART</button>
                    </form>

                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>