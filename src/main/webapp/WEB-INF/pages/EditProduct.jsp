<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, com.model.Category, com.model.Product" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MMP - Edit Product</title>
    <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/EditProduct.css" />
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
        <jsp:include page="/WEB-INF/pages/SellerNavbar.jsp" />

        <%
          Product product = (Product) request.getAttribute("product");
        %>

        <!-- Page Header -->
        <div class="user">
          <h1>Edit Product</h1>
        </div>

        <div class="editPadding">
          <div class="contact">Update your product listing</div>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <p style="color: red">
                ${error}
            </p>
        </c:if>

        <!-- Edit Form -->
        <form id="editForm" class="form-container"
              action="<%= request.getContextPath() %>/product/edit"
              method="post"
              enctype="multipart/form-data">

          <!-- Hidden field for product ID -->
          <input type="hidden" name="productId" value="<%= product.getProductId() %>" />

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
                value="<%= product.getProductName() %>"
                placeholder="E.G. RECORD PLAYER"
              />
            </div>

            <div class="field-group">
              <label class="field-label" for="category">Category</label>
              <select id="category" name="category" class="field-select">
                <option value="" disabled>Select a category</option>
                <%
                  List<Category> categories = (List<Category>) request.getAttribute("categories");
                  if (categories != null) {
                    for (Category cat : categories) {
                      String selected = (cat.getType() != null && cat.getType().equals(product.getProductCategory())) ? "selected" : "";
                %>
                  <option value="<%= cat.getCategoryId() %>" <%= selected %>>
                      <%= cat.getType() %>
                  </option>
                <%
                    }
                  }
                %>
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
                  value="<%= product.getProductPrice() %>"
                  placeholder="0.00"
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
              ><%= product.getProductDescription() != null ? product.getProductDescription() : "" %></textarea>
            </div>
          </div>

          <div class="form-divider"></div>

          <!-- Section 03: Product Image -->
          <div class="form-section">
            <h2 class="section-heading">
              03. Product Image
            </h2>

            <label class="upload-zone">
              <input
                type="file"
                name="image"
                class="file-input"
                accept="image/*"
              />

              <img
                class="upload-icon"
                src="<%= request.getContextPath() %>/Assets/Seller Product/upload.png"
                alt="upload"
              />

              <span class="upload-title">
                Upload High-Resolution Imagery
              </span>

              <span class="upload-hint">
                DRAG & DROP FILES HERE OR CLICK TO BROWSE. STRICT ASPECT RATIOS REQUIRED.
              </span>
            </label>

            <% if (product.getProductImageUrl() != null && !product.getProductImageUrl().isEmpty()) { %>
              <div style="margin-top: 1rem; text-align: center;">
                <p style="font-size: 0.75rem; color: #737373; margin-bottom: 0.5rem;">CURRENT IMAGE:</p>
                <img src="<%= request.getContextPath() %><%= product.getProductImageUrl() %>"
                     alt="Current product image"
                     style="max-width: 200px; border-radius: 8px;"
                     onerror="this.style.display='none'" />
              </div>
            <% } %>
          </div>

          <!-- Footer Actions -->
          <div class="form-footer">
            <button type="button" class="btn-cancel" onclick="window.location.href='<%= request.getContextPath() %>/seller/dashboard'">CANCEL</button>
            <button type="submit" form="deleteForm" class="btnDelete" aria-label="Remove item">
              <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/dustbin.png" class="deleteIcon" alt="delete"/>
            </button>
            <button type="submit" class="btn-submit">UPDATE PRODUCT</button>
          </div>
        </form>

        <!-- Hidden Delete Form -->
        <form id="deleteForm" action="<%= request.getContextPath() %>/product/delete" method="post" style="display: none;">
          <input type="hidden" name="productId" value="<%= product.getProductId() %>" />
        </form>

      </main>
    </div>

    <script>
      const fileInput = document.querySelector('.file-input');
      const uploadZone = document.querySelector('.upload-zone');
      const uploadIcon = document.querySelector('.upload-icon');
      const uploadTitle = document.querySelector('.upload-title');
      const uploadHint = document.querySelector('.upload-hint');

      fileInput.addEventListener('change', function () {
        const file = this.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = function (e) {
          const existing = uploadZone.querySelector('.image-preview');
          if (existing) existing.remove();

          const img = document.createElement('img');
          img.src = e.target.result;
          img.className = 'image-preview';
          img.style.maxWidth = '200px';
          img.style.borderRadius = '8px';
          img.style.marginTop = '1rem';

          uploadIcon.style.display = 'none';
          uploadTitle.textContent = file.name;
          uploadHint.textContent = (file.size / 1024).toFixed(1) + ' KB - click to replace';

          uploadZone.insertBefore(img, uploadIcon);
        };
        reader.readAsDataURL(file);
      });
    </script>

  </body>
</html>