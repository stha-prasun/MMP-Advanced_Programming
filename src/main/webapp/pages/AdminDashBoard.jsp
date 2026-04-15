<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>MMP</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/AdminDashBoard.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet" />
</head>
<body>

  <!-- Full-width Top Bar -->
  <header class="topbar">
    <div class="logo">MMP</div>

    <div class="search-wrap">
      <img class="search-icon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/Search.png" alt="Search" />
      <input type="text" class="search-input" placeholder="Search..." />
      <button class="search-btn">Search</button>
    </div>

    <div class="topbar-right">
      <button class="add-btn">
        <span class="add-plus">+</span> ADD NEW
      </button>
      <div class="divider-v"></div>
      <div class="user-info">
        <span class="username">JOHN DOE</span>
        <div class="avatar">
          <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" alt="User Avatar" />
        </div>
      </div>
    </div>
  </header>

  <!-- Body: Sidebar + Main -->
  <div class="body-layout">

    <aside class="sidebar">
      <nav class="nav">
        <a href="#" class="nav-item active">
          <img class="nav-icon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/user.png" alt="Users" />
          USERS
        </a>
        <a href="#" class="nav-item">
          <img class="nav-icon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/products.png" alt="Products" />
          PRODUCTS
        </a>
        <a href="#" class="nav-item">
          <img class="nav-icon" src="<%= request.getContextPath() %>/Assets/Admin Dashboard/category.png" alt="Categories" />
          CATEGORIES
        </a>
      </nav>
    </aside>

    <main class="main">
      <div class="hero">
        <h1 class="hero-title">SYSTEM<br />INDEX</h1>
        <p class="hero-sub">CONTROL PANEL</p>
      </div>

      <div class="divider divider--blue"></div>

      <ul class="index-list">
        <li class="index-item">
          <span class="index-num">01</span>
          <div class="index-content">
            <h2 class="index-name">USERS</h2>
            <p class="index-desc">Manage accounts, roles, and status.</p>
          </div>
          <a href="<%= request.getContextPath() %>/pages/AdminUsers.jsp" class="index-arrow" aria-label="Go to Users">
            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/right arrow.png" alt="Arrow" />
          </a>
        </li>

        <div class="divider"></div>

        <li class="index-item">
          <span class="index-num">02</span>
          <div class="index-content">
            <h2 class="index-name">PRODUCTS</h2>
            <p class="index-desc">Review, approve, and filter listings.</p>
          </div>
          <a href="<%= request.getContextPath() %>/pages/AdminProduct.jsp" class="index-arrow" aria-label="Go to Products">
            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/right arrow.png" alt="Arrow" />
          </a>
        </li>

        <div class="divider"></div>

        <li class="index-item">
          <span class="index-num">03</span>
          <div class="index-content">
            <h2 class="index-name">CATEGORIES</h2>
            <p class="index-desc">Organize the platform taxonomy.</p>
          </div>
          <a href="#" class="index-arrow" aria-label="Go to Categories">
            <img src="<%= request.getContextPath() %>/Assets/Admin Dashboard/right arrow.png" alt="Arrow" />
          </a>
        </li>

        <div class="divider"></div>
      </ul>
    </main>
  </div>

  <!-- Mobile Hamburger -->
  <button class="hamburger" id="hamburger" aria-label="Toggle menu">
    <span></span><span></span><span></span>
  </button>

  <script>
    const hamburger = document.getElementById('hamburger');
    const sidebar = document.querySelector('.sidebar');
    hamburger.addEventListener('click', () => {
      sidebar.classList.toggle('open');
      hamburger.classList.toggle('active');
    });
  </script>
</body>
</html>