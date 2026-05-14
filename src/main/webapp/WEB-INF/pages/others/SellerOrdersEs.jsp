<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/SellerEmptyState.css" />
      </head>

      <body>
        <div class="container">

          <!-- Sidebar -->
          <aside class="sidebar">
            <nav>
              <ul class="menu">
                <li class="menu-item">
                  <span class="menu-icon">
                    <img src="<%= request.getContextPath() %>/Assets/Seller Product/product.png" alt="" />
                  </span>
                  My Products
                </li>
                <li class="menu-item">
                  <span class="menu-icon">
                    <img src="<%= request.getContextPath() %>/Assets/Seller Product/addPrd.png" alt="" />
                  </span>
                  Add Products
                </li>
                <li class="menu-item active">
                  <span class="menu-icon">
                    <img src="<%= request.getContextPath() %>/Assets/Seller Product/order.png" alt="" />
                  </span>
                  Orders
                </li>
              </ul>
            </nav>
          </aside>

          <!-- Main Content -->
          <main class="main">

            <!-- Topbar -->
            <div class="navbar">
              <div class="navLeft">
                <div class="logo">MMP</div>
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
              <h1>ORDERS</h1>
            </div>

            <div class="editPadding">
              <c:if test="${not empty orderList}">
                <div class="contact">Track and manage your sales &bull; &nbsp;${fn:length(orderList)}
                  TOTAL ORDERS
                </div>
              </c:if>
              <c:if test="${empty orderList}">
                <div class="contact">Track and manage your sales &bull; NO ORDERS PLACED</div>

              </c:if>
            </div>

            <section class="emptyState">
            <img src="<%= request.getContextPath() %>/Assets/User/peeps.png" alt="profile" />
            <h1 class="emptyText">
              No orders <br>
              <span>yet</span>
            </h1>
            </section>



        <script>
          function toggleOrder(id) {
            const card = document.getElementById(id);
            const details = card.querySelector('.order-details');
            const icon = card.querySelector('.toggle-icon');
            const label = card.querySelector('.order-toggle');

            const isHidden = details.classList.contains('hidden');
            details.classList.toggle('hidden');
            icon.classList.toggle('rotated');
            label.innerHTML = isHidden
              ? '<span class="toggle-icon rotated"></span> HIDE'
              : '<span class="toggle-icon"></span>￬ VIEW';
          }
        </script>

      </body>

      </html>