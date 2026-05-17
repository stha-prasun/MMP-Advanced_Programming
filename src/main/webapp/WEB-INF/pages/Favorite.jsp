<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MMP - Your Saved Items</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Favorite.css" />
</head>
<body>
<<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

  <main class="pageContainer">

    <!-- HEADER -->
    <section class="pageHeader">
      <h1 class="pageTitle">Your Saved Items</h1>
      <p class="pageCount">Total Items &bull; ${totalItems}</p>
      <div class="pageDivider"></div>
    </section>

    <!-- ERROR MESSAGE -->
    <c:if test="${not empty error}">
      <div class="errorMessage" style="color: #d32f2f; padding: 1rem; background: #ffebee; border-radius: 8px; margin-bottom: 1rem;">
        ${error}
      </div>
    </c:if>

    <!-- EMPTY STATE -->
    <c:if test="${empty productList or fn:length(productList) == 0}">
      <div class="emptyState" style="text-align: center; padding: 4rem 2rem;">
        <h2 style="font-size: 1.5rem; color: #333; margin-bottom: 0.5rem;">No saved items yet</h2>
        <p style="color: #666;">Browse products and click the heart icon to save them here.</p>
        <a href="<%= request.getContextPath() %>/products" class="browseBtn"
           style="display: inline-block; margin-top: 1.5rem; padding: 0.75rem 1.5rem; background: #111; color: #fff; text-decoration: none; border-radius: 8px; font-weight: 600;">
          Browse Products
        </a>
      </div>
    </c:if>

    <!-- LIST -->
    <c:if test="${not empty productList and fn:length(productList) > 0}">
      <ul class="itemList">
        <c:forEach var="product" items="${productList}" varStatus="loop">
          <li class="itemCard">

            <!-- LEFT -->
            <div class="itemLeft">
              <span class="itemIdLabel">ID</span>

              <div class="itemIdentity">
                <img
                  src="<%= request.getContextPath() %>/Assets/Product/${not empty product.image ? product.image : 'product'.concat(loop.index + 1).concat('.png')}"
                  class="itemImage"
                  alt="${not empty product.name ? product.name : 'Product image'}"
                  onerror="this.src='<%= request.getContextPath() %>/Assets/Product/default.png'"
                />

                <div class="itemInfo">
                  <h2 class="itemName">${not empty product.name ? product.name : 'Unknown Product'}</h2>
                  <p class="itemCategory">${not empty product.category ? product.category : 'Uncategorized'}</p>
                </div>
              </div>

              <div class="itemMeta">
                <div class="metaRow">
                  <span class="metaLabel">Price</span>
                </div>
                <div class="metaRow">
                  <span class="metaLabel">Status</span>
                </div>
              </div>
            </div>

            <!-- RIGHT -->
            <div class="itemRight">
              <span class="itemCode">${not empty product.itemCode ? product.itemCode : 'ITM-'.concat(product.id)}</span>

              <h3 class="productPrice">
                <span>$</span><fmt:formatNumber value="${product.price}" pattern="#,#00" />
              </h3>

              <c:choose>
                <c:when test="${product.available}">
                  <div class="itemStatus available">
                    <span class="statusDot"></span>
                    Available
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="itemStatus unavailable">
                    <span class="statusDot"></span>
                    Not Available
                  </div>
                </c:otherwise>
              </c:choose>

              <div class="itemActions">
                <c:choose>
                  <c:when test="${product.available}">
                    <form action="<%= request.getContextPath() %>/cart/add" method="post" style="display: inline;">
                      <input type="hidden" name="productId" value="${product.id}" />
                      <button type="submit" class="cartBtn" title="Add to cart">
                        <img src="<%= request.getContextPath() %>/Assets/Product/cart.png" class="iconImage" alt="cart icon" />
                      </button>
                    </form>
                  </c:when>
                  <c:otherwise>
                    <button class="cartBtn disabled" title="Out of stock" disabled>
                      <img src="<%= request.getContextPath() %>/Assets/Product/cart.png" class="iconImage" alt="cart icon" />
                    </button>
                  </c:otherwise>
                </c:choose>

                <form action="<%= request.getContextPath() %>/favourite/remove" method="post" style="display: inline;" onsubmit="return confirm('Remove this item from favourites?');">
                  <input type="hidden" name="productId" value="${product.id}" />
                  <button type="submit" class="deleteBtn" title="Remove from favourites">
                    <img src="<%= request.getContextPath() %>/Assets/Product/delete.png" class="iconImage" alt="delete icon" />
                  </button>
                </form>
              </div>
            </div>

          </li>
        </c:forEach>
      </ul>
    </c:if>

  </main>

</body>
</html>