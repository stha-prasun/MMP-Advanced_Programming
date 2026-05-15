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
        <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Orders.css" />
         <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AndminEmptyState.css" />
      </head>

      <body>
        <div class="container">

          <!-- Sidebar -->
          <aside class="sidebar">
            <nav>
<ul class="menu">

  <li class="menu-item">
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

  <li class="menu-item active">
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

            <!-- Orders List -->
            <c:choose>
              <c:when test="${empty orderList}">
                <div class="usersCenteredContainer">
                              <!-- Page Header -->
                              <section class="emptyState">
                                <img src="<%= request.getContextPath() %>/Assets/User/peeps.png" alt="profile" />
                                <h1 class="emptyText">
                                  No Orders <br>
                                  <span>yet</span>
                                </h1>
                              </section>
                            </div>
              </c:when>
              <c:otherwise>

                <div class="orders-list">
                  <c:forEach var="order" items="${orderList}" varStatus="loop">

                    <!-- Order Card 1 -->
                    <div class="order-card" id="order-${loop.index}">
                      <div class="order-summary" onclick="toggleOrder('order-${loop.index}')">
                        <div class="order-row">
                          <span class="order-label">ORDER ID</span>
                          <span class="order-value order-id">ORD-00${order.orderId}</span>
                        </div>
                        <div class="order-row product-row">
                          <div class="product-info">
                            <img class="productThumb" src="<%= request.getContextPath() %>/Assets/Product/${order.product.productImageUrl}"
                              alt="${order.product.productName}" />
                            <span class="product-name">${order.product.productName}</span>
                          </div>
                        </div>
                        <div class="order-row">
                          <span class="order-info">BUYER</span>
                          <span class="order-name">${order.customer.custName}</span>
                        </div>
                        <div class="order-row">
                          <span class="order-info">TOTAL</span>
                          <span class="order-value price">${order.product.productPrice}</span>
                        </div>
                        <div class="order-row">
                          <span class="order-date">DATE</span>
                          <span class="order-value">${order.orderedAt}</span>
                        </div>
                        <div class="order-row borderBtm">
                          <span class="order-info">STATUS</span>
                          <c:choose>
                            <c:when test="${order.orderStatus == 'Completed'}">
                              <span class="status-badge completed">COMPLETED</span>
                            </c:when>
                            <c:when test="${order.orderStatus == 'Pending'}">
                              <span class="status-badge pending">PENDING</span>
                            </c:when>
                            <c:when test="${order.orderStatus == 'Cancelled'}">
                              <span class="status-badge cancelled">CANCELLED</span>
                            </c:when>
                            <c:otherwise>
                              <span class="status-badge">${order.orderStatus}</span>
                            </c:otherwise>
                          </c:choose>
                        </div>
                        <div class="order-toggle">
                          <span class="toggle-icon"></span>￬ VIEW
                        </div>
                      </div>

                      <div class="order-details hidden">
                        <div class="detail-divider"></div>
                        <div class="customer-section">
                          <div class="borderBtm">
                            <div class="section-label">CUSTOMER DETAILS</div>
                          </div>
                          <div class="customer-name">${order.customer.custName}</div>
                          <div class="customer-email">${order.customer.custEmail}</div>
                          <div class="customer-address">MADHYAPUR THIMI 04,<br />BHAKTAPUR NEPAL</div>
                          <!-- enter order address here -->
                        </div>
                        <div class="timeline-section">
                          <div class="borderBtm">
                            <div class="section-label">ORDER TIMELINE</div>
                          </div>
                          <div class="timeline-item">
                            <c:choose>
                              <c:when test="${order.orderStatus == 'Pending'}">
                                <div class="timeline-icon">
                                  <img src="<%= request.getContextPath() %>/Assets/Seller Product/pending.png" alt="" />
                                </div>
                                <div class="timeline-content">
                                  <div class="tl-title">Order Placed</div>
                                  <div class="tl-date">${order.orderedAt} UTC</div>
                                </div>
                              </c:when>
                              <c:when test="${order.orderStatus == 'Cancelled'}">
                                <div class="timeline-icon">
                                  <img src="<%= request.getContextPath() %>/Assets/Seller Product/cancelled.png" alt="" />
                                </div>
                                <div class="timeline-content">
                                  <div class="tl-title">Order Cancelled</div>
                                  <div class="tl-date">${order.orderedAt} UTC</div>
                                </div>
                              </c:when>
                              <c:otherwise>
                                <div class="timeline-icon">
                                  <img src="<%= request.getContextPath() %>/Assets/Seller Product/completed.png" alt="" />
                                </div>
                                <div class="timeline-content">
                                  <div class="tl-title">Order Completed</div>
                                  <div class="tl-date">${order.orderedAt} UTC</div>
                                </div>
                              </c:otherwise>
                            </c:choose>
                          </div>

                        </div>
                      </div>
                    </div>
                </div>
                </c:forEach>
        </div>
        <!-- /orders-list -->
        </c:otherwise>
        </c:choose>

        </main>
        </div>
        <!-- /container -->

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