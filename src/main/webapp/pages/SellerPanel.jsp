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
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/SellerPanel.css" />
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <aside class="sidebar">


        <nav>
          <ul class="menu">
            <li class="menu-item active">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Product/product.png"
                  alt=""
                />
              </span>
              My Products
            </li>
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Product/addPrd.png"
                  alt=""
                />
              </span>
              Add Products
            </li>
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Product/order.png"
                  alt=""
                />
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
      <h1>INVENTORY</h1>
    </div>

    <div class="editPadding">
      <div class="contact">Manage your catalog • 5 Items Listed</div>

    </div>
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

            <tr>
              <td class="colId">01.</td>
              <td class="colProduct">
                <img class="productThumb" src="<%= request.getContextPath() %>/Assets/Product/product7.png">
              </td>
              <td class="tdName">Braun Aromaster Classic</td>
              <td class="colPrice"><span class="priceDollar">$</span>85.00</td>
              <td class="colCategory">Electronic</td>
              <td class="colSold"><span class="badge badgeAvailable">Available</span></td>
              <td class="colActions">
              <button class="editProfile">
                 <img src="<%= request.getContextPath() %>/Assets/Profile/edit.png" alt="Edit" />
                    <span>EDIT</span>
              </button>
              </div>
              </td>
            </tr>

            <tr>
              <td class="colId">02.</td>
              <td class="colProduct">
                <img class="productThumb" src="<%= request.getContextPath() %>/Assets/Product/product7.png">
              </td>
              <td class="tdName">Braun Aromaster Classic</td>
              <td class="colPrice"><span class="priceDollar">$</span>85.00</td>
              <td class="colCategory">Electronic</td>
              <td class="colSold"><span class="badgeSold">Sold</span></td>
              <td class="colActions">
              <button class="editProfile">
                <img src="<%= request.getContextPath() %>/Assets/Profile/edit.png" alt="Edit" />
                    <span>EDIT</span>
              </button>
              </div>
              </td>
            </tr>

          </table>
        </div>
</div>


      </main>
    </div>

  </body>
</html>
