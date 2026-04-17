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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Add_Product.css" />
  </head>
  <body>
    <div class="container">
      <!-- Sidebar -->
      <aside class="sidebar">


        <nav>
          <ul class="menu">
            <li class="menu-item">
              <span class="menu-icon">
                <img
                  src="<%= request.getContextPath() %>/Assets/Seller Product/product.png"
                  alt=""
                />
              </span>
              My Products
            </li>
            <li class="menu-item active">
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
      <h1>Add Product</h1>
    </div>

    <div class="editPadding">
      <div class="contact">Create a new listing of product</div>

    </div>

        <!-- Form -->
        <div class="form-container">

          <!-- Section 01: Basic Information -->
          <div class="form-section">
            <h2 class="section-heading">
             01. Basic Information
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
            02. Description
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
              0.3. Product Image
            </h2>

        <label class="upload-zone">
          <input
            type="file"
            name="productImage"
            class="file-input"
            accept="image/*"
          />

          <img
            class="upload-icon"
            src="<%= request.getContextPath() %>/Assets/Seller Product/upload.png"
            alt="upload"
          />

          <span class="upload-title">Upload High-Resolution Imagery</span>
          <span class="upload-hint">
            DRAG & DROP FILES HERE OR CLICK TO BROWSE. STRICT ASPECT RATIOS REQUIRED.
          </span>
        </label>

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
