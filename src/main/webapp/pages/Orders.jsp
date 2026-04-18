<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MMP - Buy Smart. Sell Easy. Repeat.</title>
    <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Orders.css" />
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
          <div class="contact">Track and manage your sales • 4 Total</div>
        </div>

        <!-- Orders List -->
        <div class="orders-list">

          <!-- Order Card 1 -->
          <div class="order-card" id="order-1">
            <div class="order-summary" onclick="toggleOrder('order-1')">
              <div class="order-row">
                <span class="order-label">ORDER ID</span>
                <span class="order-value order-id">ORD-001</span>
              </div>
              <div class="order-row product-row">
                <div class="product-info">
                  <img class="productThumb" src="<%= request.getContextPath() %>/Assets/Product/product7.png" alt="Record Player" />
                  <span class="product-name">Record Player</span>
                </div>
              </div>
              <div class="order-row">
                <span class="order-info">BUYER</span>
                <span class="order-name">Rohan Shrestha</span>
              </div>
              <div class="order-row">
                <span class="order-info">TOTAL</span>
                <span class="order-value price">$85.00</span>
              </div>
              <div class="order-row">
                <span class="order-date">DATE</span>
                <span class="order-value">2026-04-12</span>
              </div>
              <div class="order-row borderBtm">
                <span class="order-info">STATUS</span>
                <span class="order-value">
                  <span class="status-badge pending">PENDING</span>
                </span>
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
                <div class="customer-name">Rohan Shrestha</div>
                <div class="customer-email">rohanshrestha612@gmail.com</div>
                <div class="customer-address">MADHYAPUR THIMI 04,<br/>BHAKTAPUR NEPAL</div>
              </div>
              <div class="timeline-section">
                <div class="borderBtm">
                  <div class="section-label">ORDER TIMELINE</div>
                </div>
                <div class="timeline-item">
                  <div class="timeline-icon">
                    <img src="<%= request.getContextPath() %>/Assets/Seller Product/pending.png" alt="" />
                  </div>
                  <div class="timeline-content">
                    <div class="tl-title">Order Placed</div>
                    <div class="tl-date">2026-04-09 • 14:23 UTC</div>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <!-- Order Card 2 -->
          <div class="order-card expanded" id="order-2">
            <div class="order-summary" onclick="toggleOrder('order-2')">
              <div class="order-row">
                <span class="order-label">ORDER ID</span>
                <span class="order-value order-id">ORD-002</span>
              </div>
              <div class="order-row product-row">
                <div class="product-info">
                  <img class="productThumb" src="<%= request.getContextPath() %>/Assets/Product/product7.png" alt="Record Player" />
                  <span class="product-name">Record Player</span>
                </div>
              </div>
              <div class="order-row">
                <span class="order-info">BUYER</span>
                <span class="order-name">Rohan Shrestha</span>
              </div>
              <div class="order-row">
                <span class="order-info">TOTAL</span>
                <span class="order-value price">$85.00</span>
              </div>
              <div class="order-row">
                <span class="order-date">DATE</span>
                <span class="order-value">2026-04-12</span>
              </div>
              <div class="order-row borderBtm">
                <span class="order-info">STATUS</span>
                <span class="order-value">
                  <span class="status-badge completed">COMPLETED</span>
                </span>
              </div>
              <div class="order-toggle">
                <span class="toggle-icon rotated"></span> HIDE
              </div>
            </div>

            <div class="order-details">
              <div class="detail-divider"></div>
              <div class="customer-section">
                <div class="borderBtm">
                  <div class="section-label">CUSTOMER DETAILS</div>
                </div>
                <div class="customer-name">Rohan Shrestha</div>
                <div class="customer-email">rohanshrestha612@gmail.com</div>
                <div class="customer-address">MADHYAPUR THIMI 04,<br/>BHAKTAPUR NEPAL</div>
              </div>
              <div class="timeline-section">
                <div class="borderBtm">
                  <div class="section-label">ORDER TIMELINE</div>
                </div>
                <div class="timeline-item">
                  <div class="timeline-icon">
                    <img src="<%= request.getContextPath() %>/Assets/Seller Product/completed.png" alt="" />
                  </div>
                  <div class="timeline-content">
                    <div class="tl-title">Order Completed</div>
                    <div class="tl-date">2026-04-09 • 14:23 UTC</div>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <!-- Order Card 3 -->
          <div class="order-card expanded" id="order-3">
            <div class="order-summary" onclick="toggleOrder('order-3')">
              <div class="order-row">
                <span class="order-label">ORDER ID</span>
                <span class="order-value order-id">ORD-003</span>
              </div>
              <div class="order-row product-row">
                <div class="product-info">
                  <img class="productThumb" src="<%= request.getContextPath() %>/Assets/Product/product7.png" alt="Record Player" />
                  <span class="product-name">Record Player</span>
                </div>
              </div>
              <div class="order-row">
                <span class="order-info">BUYER</span>
                <span class="order-name">Rohan Shrestha</span>
              </div>
              <div class="order-row">
                <span class="order-info">TOTAL</span>
                <span class="order-value price">$85.00</span>
              </div>
              <div class="order-row">
                <span class="order-date">DATE</span>
                <span class="order-value">2026-04-12</span>
              </div>
              <div class="order-row borderBtm">
                <span class="order-info">STATUS</span>
                <span class="order-value">
                  <span class="status-badge cancelled">CANCELLED</span>
                </span>
              </div>
              <div class="order-toggle">
                <span class="toggle-icon rotated"></span> HIDE
              </div>
            </div>

            <div class="order-details">
              <div class="detail-divider"></div>
              <div class="customer-section">
                <div class="borderBtm">
                  <div class="section-label">CUSTOMER DETAILS</div>
                </div>
                <div class="customer-name">Rohan Shrestha</div>
                <div class="customer-email">rohanshrestha612@gmail.com</div>
                <div class="customer-address">MADHYAPUR THIMI 04,<br/>BHAKTAPUR NEPAL</div>
              </div>
              <div class="timeline-section">
                <div class="borderBtm">
                  <div class="section-label">ORDER TIMELINE</div>
                </div>
                <div class="timeline-item">
                  <div class="timeline-icon">
                    <img src="<%= request.getContextPath() %>/Assets/Seller Product/cancelled.png" alt="" />
                  </div>
                  <div class="timeline-content">
                    <div class="tl-title">Order Cancelled</div>
                    <div class="tl-date">2026-04-09 • 14:23 UTC</div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- /orders-list -->

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