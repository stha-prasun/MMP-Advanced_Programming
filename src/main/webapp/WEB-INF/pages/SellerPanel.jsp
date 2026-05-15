<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>MMP - Buy Smart. Sell Easy. Repeat.</title>
  <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
    rel="stylesheet" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
    rel="stylesheet" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/SellerPanel.css" />
</head>

<body>
  <div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">


      <nav>
<ul class="menu">

  <li class="menu-item active">
    <a href="<%= request.getContextPath() %>/seller/dashboard" class="menu-icon">
      <img src="<%= request.getContextPath() %>/Assets/Seller Product/product.png" alt="" />
      My Products
    </a>
  </li>

  <li class="menu-item">
    <a href="<%= request.getContextPath() %>/product/add" class="menu-icon">
      <img src="<%= request.getContextPath() %>/Assets/Seller Product/addPrd.png" alt="" />
      Add Products
    </a>
  </li>

  <li class="menu-item">
    <a href="<%= request.getContextPath() %>/seller/orders" class="menu-icon">
      <img src="<%= request.getContextPath() %>/Assets/Seller Product/order.png" alt="" />
      Orders
    </a>
  </li>

</ul>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="main">
      <!-- Topbar -->
      <div class="navbar">
        <div class="navLeft">
<a href="<%= request.getContextPath() %>/seller/dashboard" class="logo" style="text-decoration: none;">
  MMP
</a>
        </div>
        <div class="navRight">
          <div class="searchWrapper">
            <img class="searchIcon" src="<%= request.getContextPath() %>/Assets/Home/search.png" alt="" />
            <input type="text" placeholder="Search..." />
            <button class="searchBtn">Search</button>
          </div>
          <div class="profile">
            <img src="<%= request.getContextPath() %>/Assets/Home/me.png" alt="profile" />
          </div>
        </div>
      </div>

      <!-- Page Header -->
      <div class="user">
        <h1>INVENTORY</h1>
      </div>
      <c:if test="${empty Products}">
        <div class="editPadding">
          <div class="contact">Manage your catalog • NO Items Listed</div>

        </div>
      </c:if>
      <c:if test="${not empty Products}">
        <div class="editPadding">
          <div class="contact">Manage your catalog • &nbsp;${fn:length(Products)} Items Listed</div>

        </div>
      </c:if>
      <c:choose>
        <c:when test="${empty Products}">
          <div class="usersCenteredContainer">
            <!-- Page Header -->
            <section class="emptyState">
              <img src="<%= request.getContextPath() %>/Assets/User/peeps.png" alt="profile" />
              <h1 class="emptyText">
                No Products Listed <br>
                <span>yet</span>
              </h1>
            </section>
          </div>
        </c:when>
        <c:otherwise>
          <div class="tableWrapper">
            <table class="inventoryTable">


              <tr>
                <th class="colId">ID</th>
                <th class="colProduct">Products</th>
                <th>Name</th>
                <th class="colPrice">Price</th>
                <th class="colCategory">Category</th>
                <th class="colSold">Sold</th>
                <th class="colActions">Actions</th>
              </tr>
              <c:forEach var="prod" items="${Products}">
                <tr>
                  <td class="colId">${prod.productId}</td>
                  <td class="colProduct">
                    <img class="productThumb"
                      src="<%= request.getContextPath() %>/Assets/Product/${prod.productImageUrl}" alt=${prod.productName}>
                  </td>
                  <td class="tdName">${prod.productName}</td>
                  <td class="colPrice"><span class="priceDollar">$</span>${prod.productPrice}</td>
                  <td class="colCategory">${prod.productCategory}</td>
                  <td class="colSold"><span class="badge badgeAvailable">${prod.productIsSold ? 'Sold' :
                      'Available'}</span></td>
                  <td class="colActions">
                    <button class="editProfile">
                      <img src="<%= request.getContextPath() %>/Assets/Profile/edit.png" alt="Edit" />
                      <span>EDIT</span>
                    </button>

                  </td>
                </tr>
              </c:forEach>
        </c:otherwise>
      </c:choose>

      </table>
  </div>
  </div>


  </main>
  </div>

</body>

</html>