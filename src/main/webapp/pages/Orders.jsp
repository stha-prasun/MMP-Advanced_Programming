<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Orders</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Modak&family=DM+Sans:wght@400;500;600;700;900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/CSS/Orders.css"
    />
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <aside class="sidebar">
        <div class="logo-wrap">
          <span class="logo">MMP</span>
        </div>

        <nav>
          <ul class="menu">
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/MyProducts.png"
                  alt=""
                />
              </span>
              My Products
            </li>
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Add.png"
                  alt=""
                />
              </span>
              Add Products
            </li>
            <li class="menu-item active">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Orders.png"
                  alt=""
                />
              </span>
              Orders
            </li>
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Settings.png"
                  alt=""
                />
              </span>
              Settings
            </li>
          </ul>
        </nav>
      </aside>

      <!-- Main Content -->
      <main class="main">
        <!-- Topbar -->
        <header class="topbar">
          <div class="search-group">
            <span class="search-icon-wrap">
              <img
                src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Search.png"
                alt="search"
              />
            </span>
            <input type="text" placeholder="Search..." class="search-input" />
            <button class="search-btn">Search</button>
          </div>

          <div class="topbar-divider"></div>

          <div class="profile">
            <span class="profile-name">JOHN DOE</span>
            <div class="avatar">
              <img src="https://i.pravatar.cc/40" alt="profile" />
            </div>
          </div>
        </header>

        <!-- Page Header -->
        <div class="page-header">
          <h1 class="page-title">ORDERS</h1>
          <p class="page-subtitle">TRACK AND MANAGE YOUR SALES &bull; 4 TOTAL</p>
        </div>

        <!-- Orders List -->
        <div class="orders-list">

          <!-- ── Order 1 — PENDING (collapsed) ── -->
          <div class="order-card">
            <div class="order-main">
              <!-- Order ID -->
              <div class="order-row">
                <span class="order-label">Order ID</span>
                <span class="order-id-value">ORD-001</span>
              </div>

              <!-- Product -->
              <div class="order-product-row">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/test.png"
                  alt="product"
                  class="order-product-img"
                />
                <span class="order-product-name">Record Player</span>
              </div>

              <!-- Buyer -->
              <div class="order-detail-row">
                <span class="order-label">Buyer</span>
                <span class="order-detail-value">Rohan Shresha</span>
              </div>

              <!-- Total -->
              <div class="order-detail-row">
                <span class="order-label">Total</span>
                <span class="order-detail-value price">$85.00</span>
              </div>

              <!-- Date -->
              <div class="order-detail-row">
                <span class="order-label">Date</span>
                <span class="order-detail-value">2026-04-12</span>
              </div>

              <!-- Status -->
              <div class="order-detail-row">
                <span class="order-label">Status</span>
                <span class="badge pending">PENDING</span>
              </div>
            </div>

            <!-- Toggle -->
            <div class="order-toggle-row">
              <button class="btn-toggle" onclick="toggleOrder('order1-panel', this)">
                &#8964;&nbsp; VIEW
              </button>
            </div>

            <!-- Expandable Panel -->
            <div class="order-details-panel" id="order1-panel">
              <p class="details-section-label">Customer Details</p>
              <p class="customer-name">Rohan Shresha</p>
              <p class="customer-email">rohanshrestha612@gmail.com</p>
              <p class="customer-address">Madhyapur Thimi 04,<br />Bhaktapur Nepal</p>

              <p class="details-section-label">Order Timeline</p>
              <div class="timeline">
                <div class="timeline-item">
                  <span class="timeline-icon">
                    <!-- Clock icon -->
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                      stroke="#aaaaaa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <polyline points="12 6 12 12 16 14"/>
                    </svg>
                  </span>
                  <div class="timeline-content">
                    <p class="timeline-event">Order Placed</p>
                    <p class="timeline-date">2026-04-09 &bull; 14:23 UTC</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- ── Order 2 — COMPLETED (expanded by default) ── -->
          <div class="order-card">
            <div class="order-main">
              <!-- Order ID -->
              <div class="order-row">
                <span class="order-label">Order ID</span>
                <span class="order-id-value">ORD-002</span>
              </div>

              <!-- Product -->
              <div class="order-product-row">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/test.png"
                  alt="product"
                  class="order-product-img"
                />
                <span class="order-product-name">Record Player</span>
              </div>

              <!-- Buyer -->
              <div class="order-detail-row">
                <span class="order-label">Buyer</span>
                <span class="order-detail-value">Rohan Shresha</span>
              </div>

              <!-- Total -->
              <div class="order-detail-row">
                <span class="order-label">Total</span>
                <span class="order-detail-value price">$85.00</span>
              </div>

              <!-- Date -->
              <div class="order-detail-row">
                <span class="order-label">Date</span>
                <span class="order-detail-value">2026-04-12</span>
              </div>

              <!-- Status -->
              <div class="order-detail-row">
                <span class="order-label">Status</span>
                <span class="badge completed">COMPLETED</span>
              </div>
            </div>

            <!-- Toggle -->
            <div class="order-toggle-row">
              <button class="btn-toggle" onclick="toggleOrder('order2-panel', this)">
                &#8963;&nbsp; HIDE
              </button>
            </div>

            <!-- Expandable Panel — open by default -->
            <div class="order-details-panel open" id="order2-panel">
              <p class="details-section-label">Customer Details</p>
              <p class="customer-name">Rohan Shresha</p>
              <p class="customer-email">rohanshrestha612@gmail.com</p>
              <p class="customer-address">Madhyapur Thimi 04,<br />Bhaktapur Nepal</p>

              <p class="details-section-label">Order Timeline</p>
              <div class="timeline">
                <div class="timeline-item">
                  <span class="timeline-icon">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                      stroke="#aaaaaa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <polyline points="12 6 12 12 16 14"/>
                    </svg>
                  </span>
                  <div class="timeline-content">
                    <p class="timeline-event">Order Placed</p>
                    <p class="timeline-date">2026-04-09 &bull; 14:23 UTC</p>
                  </div>
                </div>
                <div class="timeline-item">
                  <span class="timeline-icon">
                    <!-- Cancel / X circle -->
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                      stroke="#e63232" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <line x1="15" y1="9" x2="9" y2="15"/>
                      <line x1="9" y1="9" x2="15" y2="15"/>
                    </svg>
                  </span>
                  <div class="timeline-content">
                    <p class="timeline-event">Order Cancelled</p>
                    <p class="timeline-date">2026-04-14 &bull; 11:45 UTC</p>
                  </div>
                </div>
                <div class="timeline-item">
                  <span class="timeline-icon">
                    <!-- Check circle -->
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                      stroke="#0f9b58" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <polyline points="9 12 11 14 15 10"/>
                    </svg>
                  </span>
                  <div class="timeline-content">
                    <p class="timeline-event">Order Completed</p>
                    <p class="timeline-date">2026-04-14 &bull; 11:45 UTC</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- ── Order 3 — CANCELLED (collapsed) ── -->
          <div class="order-card">
            <div class="order-main">
              <div class="order-row">
                <span class="order-label">Order ID</span>
                <span class="order-id-value">ORD-003</span>
              </div>
              <div class="order-product-row">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/test.png"
                  alt="product"
                  class="order-product-img"
                />
                <span class="order-product-name">Record Player</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Buyer</span>
                <span class="order-detail-value">Rohan Shresha</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Total</span>
                <span class="order-detail-value price">$85.00</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Date</span>
                <span class="order-detail-value">2026-04-13</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Status</span>
                <span class="badge cancelled">CANCELLED</span>
              </div>
            </div>
            <div class="order-toggle-row">
              <button class="btn-toggle" onclick="toggleOrder('order3-panel', this)">
                &#8964;&nbsp; VIEW
              </button>
            </div>
            <div class="order-details-panel" id="order3-panel">
              <p class="details-section-label">Customer Details</p>
              <p class="customer-name">Rohan Shresha</p>
              <p class="customer-email">rohanshrestha612@gmail.com</p>
              <p class="customer-address">Madhyapur Thimi 04,<br />Bhaktapur Nepal</p>

              <p class="details-section-label">Order Timeline</p>
              <div class="timeline">
                <div class="timeline-item">
                  <span class="timeline-icon">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                      stroke="#aaaaaa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <polyline points="12 6 12 12 16 14"/>
                    </svg>
                  </span>
                  <div class="timeline-content">
                    <p class="timeline-event">Order Placed</p>
                    <p class="timeline-date">2026-04-13 &bull; 09:00 UTC</p>
                  </div>
                </div>
                <div class="timeline-item">
                  <span class="timeline-icon">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                      stroke="#e63232" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <line x1="15" y1="9" x2="9" y2="15"/>
                      <line x1="9" y1="9" x2="15" y2="15"/>
                    </svg>
                  </span>
                  <div class="timeline-content">
                    <p class="timeline-event">Order Cancelled</p>
                    <p class="timeline-date">2026-04-13 &bull; 10:30 UTC</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- ── Order 4 — PENDING (collapsed) ── -->
          <div class="order-card">
            <div class="order-main">
              <div class="order-row">
                <span class="order-label">Order ID</span>
                <span class="order-id-value">ORD-004</span>
              </div>
              <div class="order-product-row">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/test.png"
                  alt="product"
                  class="order-product-img"
                />
                <span class="order-product-name">Record Player</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Buyer</span>
                <span class="order-detail-value">Rohan Shresha</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Total</span>
                <span class="order-detail-value price">$85.00</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Date</span>
                <span class="order-detail-value">2026-04-14</span>
              </div>
              <div class="order-detail-row">
                <span class="order-label">Status</span>
                <span class="badge pending">PENDING</span>
              </div>
            </div>
            <div class="order-toggle-row">
              <button class="btn-toggle" onclick="toggleOrder('order4-panel', this)">
                &#8964;&nbsp; VIEW
              </button>
            </div>
            <div class="order-details-panel" id="order4-panel">
              <p class="details-section-label">Customer Details</p>
              <p class="customer-name">Rohan Shresha</p>
              <p class="customer-email">rohanshrestha612@gmail.com</p>
              <p class="customer-address">Madhyapur Thimi 04,<br />Bhaktapur Nepal</p>

              <p class="details-section-label">Order Timeline</p>
              <div class="timeline">
                <div class="timeline-item">
                  <span class="timeline-icon">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none"
                      stroke="#aaaaaa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="10"/>
                      <polyline points="12 6 12 12 16 14"/>
                    </svg>
                  </span>
                  <div class="timeline-content">
                    <p class="timeline-event">Order Placed</p>
                    <p class="timeline-date">2026-04-14 &bull; 08:10 UTC</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </main>
    </div>

    <script>
      function toggleOrder(panelId, btn) {
        const panel = document.getElementById(panelId);
        const isOpen = panel.classList.contains('open');
        panel.classList.toggle('open', !isOpen);
        btn.innerHTML = isOpen
          ? '&#8964;&nbsp; VIEW'
          : '&#8963;&nbsp; HIDE';
      }
    </script>
  </body>
</html>
