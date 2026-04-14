<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Add Product</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Modak&family=DM+Sans:wght@400;500;600;700;900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/CSS/Add_Product.css"
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
            <li class="menu-item active">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Dashboard/Add.png"
                  alt=""
                />
              </span>
              Add Products
            </li>
            <li class="menu-item">
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
          <div class="page-header-left">
            <h1 class="page-title">ADD PRODUCT</h1>
            <p class="page-subtitle">CREATE A NEW LISTING OF PRODUCT</p>
          </div>
          <a href="#" class="btn-add-product-header">+ &nbsp;ADD PRODUCT</a>
        </div>

        <!-- Form -->
        <div class="form-container">

          <!-- Section 01: Basic Information -->
          <div class="form-section">
            <h2 class="section-heading">
              <span class="section-number">01.</span> Basic Information
            </h2>

            <div class="field-group">
              <label class="field-label" for="productName">Product Name</label>
              <input
                type="text"
                id="productName"
                name="productName"
                class="field-input"
                placeholder="E.G. RECORD PLAYER"
              />
            </div>

            <div class="field-group">
              <label class="field-label" for="category">Category</label>
              <select id="category" name="category" class="field-select">
                <option value="" disabled selected></option>
                <option value="electronic">Electronic</option>
                <option value="furniture">Furniture</option>
                <option value="clothing">Clothing</option>
                <option value="books">Books</option>
                <option value="collectibles">Collectibles</option>
                <option value="sports">Sports</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div class="field-group">
              <label class="field-label" for="price">Price (USD)</label>
              <div class="price-wrap">
                <span class="price-symbol">$</span>
                <input
                  type="number"
                  id="price"
                  name="price"
                  class="field-price"
                  placeholder="0.00"
                  step="0.01"
                  min="0"
                />
              </div>
            </div>
          </div>

          <div class="form-divider"></div>

          <!-- Section 02: Description -->
          <div class="form-section">
            <h2 class="section-heading">
              <span class="section-number">02.</span> Description
            </h2>

            <div class="field-group">
              <label class="field-label" for="description">Product Details</label>
              <textarea
                id="description"
                name="description"
                class="field-textarea"
                placeholder="DETAILED SPECIFICATIONS, HISTORY, AND NOTABLE FLAWS..."
              ></textarea>
            </div>
          </div>

          <div class="form-divider"></div>

          <!-- Section 03: Product Image -->
          <div class="form-section">
            <h2 class="section-heading">
              <span class="section-number">03.</span> Product Image
            </h2>

            <div class="upload-zone">
              <!-- Upload cloud icon -->
              <svg
                class="upload-icon"
                xmlns="http://www.w3.org/2000/svg"
                width="48"
                height="48"
                viewBox="0 0 24 24"
                fill="none"
                stroke="#aaaaaa"
                stroke-width="1.5"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <polyline points="16 16 12 12 8 16"></polyline>
                <line x1="12" y1="12" x2="12" y2="21"></line>
                <path
                  d="M20.39 18.39A5 5 0 0 0 18 9h-1.26A8 8 0 1 0 3 16.3"
                ></path>
              </svg>

              <span class="upload-title">Upload High-Resolution Imagery</span>
              <span class="upload-hint"
                >DRAG &amp; DROP FILES HERE OR CLICK TO BROWSE. STRICT ASPECT
                RATIOS REQUIRED.</span
              >

            </div>
          </div>

          <!-- Footer Actions -->
          <div class="form-footer">
            <button type="button" class="btn-cancel">CANCEL</button>
            <button type="submit" class="btn-submit">ADD PRODUCT</button>
          </div>
        </div>
      </main>
    </div>

  </body>
</html>
