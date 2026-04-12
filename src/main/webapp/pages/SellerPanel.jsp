<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Seller Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Modak&family=DM+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/CSS/SellerPanel.css"
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
            <li class="menu-item active">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Add.png"
                />
              </span>
              My Products
            </li>
            <li class="menu-item">
              <img
                src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Add.png"
              />
              Add Product
            </li>
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Orders.png"
                />
              </span>
              Orders
            </li>
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Settings.png"
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
              />
            </span>
            <input type="text" placeholder="Search..." class="search-input" />
            <button class="search-btn">Search</button>
          </div>

          <div class="profile">
            <span class="profile-name">JOHN DOE</span>
            <div class="avatar">
              <img src="https://i.pravatar.cc/40" alt="profile" />
            </div>
          </div>
        </header>

        <!-- Page Header -->
        <div class="page-header">
          <h1 class="page-title">INVENTORY</h1>
          <p class="page-subtitle">MANAGE YOUR CATALOG &bull; 5 ITEMS LISTED</p>
        </div>

        <!-- Table -->
        <div class="table-wrap">
          <table class="inventory-table">
            <thead>
              <tr>
                <th>ID</th>
                <th class="col-highlight">PRODUCTS</th>
                <th>NAME</th>
                <th>PRICE</th>
                <th>CATEGORY</th>
                <th>SOLD</th>
                <th>ACTIONS</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="td-id">01.</td>
                <td class="td-img">
                  <img
                    src="<%= request.getContextPath() %>/Assets/Seller Dashboard/test.png"
                    alt="product"
                    class="product-img"
                  />
                </td>
                <td class="td-name">Braun Aromaster Classic</td>
                <td class="td-price">$85.00</td>
                <td class="td-category">ELECTRONIC</td>
                <td><span class="badge available">Available</span></td>
                <td>
                  <a href="#" class="btn-edit">
                    <img
                      src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Edit.png"
                    />
                    Edit
                  </a>
                </td>
              </tr>
              <tr>
                <td class="td-id">02.</td>
                <td class="td-img">
                  <img
                    src="<%= request.getContextPath() %>/Assets/Seller Dashboard/test.png"
                    alt="product"
                    class="product-img"
                  />
                </td>
                <td class="td-name">Braun Aromaster Classic</td>
                <td class="td-price">$85.00</td>
                <td class="td-category">ELECTRONIC</td>
                <td><span class="badge sold">Sold</span></td>
                <td>
                  <a href="#" class="btn-edit">
                    <img
                      src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Edit.png"
                    />
                    Edit
                  </a>
                </td>
              </tr>
              <tr>
                <td class="td-id">03.</td>
                <td class="td-img">
                  <img
                    src="<%= request.getContextPath() %>/Assets/Seller Dashboard/test.png"
                    alt="product"
                    class="product-img"
                  />
                </td>
                <td class="td-name">Braun Aromaster Classic</td>
                <td class="td-price">$85.00</td>
                <td class="td-category">ELECTRONIC</td>
                <td><span class="badge sold">Sold</span></td>
                <td>
                  <a href="#" class="btn-edit">
                    <img
                      src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Edit.png"
                    />
                    Edit
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </body>
</html>
