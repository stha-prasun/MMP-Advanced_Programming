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
          <a href="<%= request.getContextPath() %>/products" class="heroButton">SHOP NOW</a>
        </div>
      </div>
    </div>
  </section>

<!-- FILTER SECTION -->
  <div class="heroActions">
    <form action="<%= request.getContextPath() %>/products" method="get" class="filterForm">
      <select name="category" class="filterSelect" onchange="this.form.submit()">
        <option value="" ${empty param.category ? 'selected' : ''}>All Categories</option>
        <c:forEach var="cat" items="${categories}">
          <option value="${cat.type}" ${param.category == cat.type ? 'selected' : ''}>
            ${cat.type}
          </option>
        </c:forEach>
      </select>

      <c:if test="${not empty param.category}">
        <a href="<%= request.getContextPath() %>/products" class="heroActionBtn secondary">CLEAR</a>
      </c:if>
    </form>
  </div>

  <section class="productSection">
    <!-- Show active filter info -->
    <c:if test="${not empty param.category}">
      <div style="text-align:center; margin-bottom: 1.5rem;">
        <span class="activeFilterTag">
          Filtering by: ${param.category}
          <a href="<%= request.getContextPath() %>/products">×</a>
        </span>
      </div>
    </c:if>

    <c:choose>
      <c:when test="${empty products}">
        <div class="usersCenteredContainer">
          <section class="emptyState">
            <img src="<%= request.getContextPath() %>/Assets/User/peeps.png" alt="profile" />
            <h1 class="emptyText">
              No Products <br>
              <span>Available Right now</span>
            </h1>
            <c:if test="${not empty param.category}">
              <p style="margin-top:1rem; font-family:'Inter',sans-serif; color:#666;">
                No products found in "<strong>${param.category}</strong>".
                <a href="<%= request.getContextPath() %>/products" style="color:#111; font-weight:700;">View all</a>
              </p>
            </c:if>
          </section>
        </div>
      </c:when>
      <c:otherwise>
        <div class="productGrid">
          <c:forEach var="product" items="${products}">
            <div class="productCard">
              <a href="product/details?id=${product.productId}" style="text-decoration: none; color: inherit;">
                <div class="productImageWrapper">
                  <img src="<%= request.getContextPath() %>/${product.productImageUrl}" class="productImage"
                    alt="${product.productName}" onerror="this.src='<%= request.getContextPath() %>/Assets/Home/NOTFOUND.png'"/>
                  <form action="<%= request.getContextPath() %>/favourite/add" method="post">
                    <input type="hidden" name="productId" value="${product.productId}" />
                    <button type="submit" class="wishlistBtn">
                      <img src="<%= request.getContextPath() %>/Assets/Home/fav.png" class="wishlistIcon" />
                    </button>
                  </form>
                </div>
                <div class="productInfo">
                  <p class="productCategory">${product.productCategory}</p>
                  <h3 class="productName">${product.productName}</h3>
                  <p class="productPrice">$${product.productPrice}</p>
                </div>
              </a>
            </div>
          </c:forEach>
        </div>
      </c:otherwise>
    </c:choose>

    <div class="shopMoreWrapper">
      <a href="<%= request.getContextPath() %>/products" class="shopMoreBtn">View All.</a>
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