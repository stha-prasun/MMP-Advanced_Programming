<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MMP</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Favorite.css" />

</head>
<body>
<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

  <main class="pageContainer">

    <!-- HEADER -->

    <section class="pageHeader">

      <h1 class="pageTitle">
        Your Saved Items
      </h1>

      <p class="pageCount">
        Total Items • 4
      </p>

      <div class="pageDivider"></div>

    </section>

    <!-- LIST -->

    <ul class="itemList">

      <!-- ITEM -->

      <li class="itemCard">

        <!-- LEFT -->

        <div class="itemLeft">

          <span class="itemIdLabel">
            ID
          </span>

          <div class="itemIdentity">

            <img
              src="<%= request.getContextPath() %>/Assets/Product/product1.png"
              class="itemImage"
              alt="product image"
            />

            <div class="itemInfo">

              <h2 class="itemName">
                Apple Banana
              </h2>

              <p class="itemCategory">
                Furniture
              </p>

            </div>

          </div>

          <div class="itemMeta">

            <div class="metaRow">

              <span class="metaLabel">
                Price
              </span>

            </div>

            <div class="metaRow">

              <span class="metaLabel">
                Status
              </span>

            </div>

          </div>

        </div>

        <!-- RIGHT -->

        <div class="itemRight">

          <span class="itemCode">
            ITM-2091
          </span>

          <h3 class="productPrice">
            <span>$</span>3200
          </h3>

          <div class="itemStatus available">

            <span class="statusDot"></span>

            Available

          </div>

          <div class="itemActions">

            <button class="cartBtn">

              <img
                src="<%= request.getContextPath() %>/Assets/Product/cart.png"
                class="iconImage"
                alt="cart icon"
              />

            </button>

            <button class="deleteBtn">

              <img
                src="<%= request.getContextPath() %>/Assets/Product/delete.png"
                class="iconImage"
                alt="delete icon"
              />

            </button>

          </div>

        </div>

      </li>

      <!-- ITEM -->

      <li class="itemCard">

        <!-- LEFT -->

        <div class="itemLeft">

          <span class="itemIdLabel">
            ID
          </span>

          <div class="itemIdentity">

            <img
              src="<%= request.getContextPath() %>/Assets/Product/product2.png"
              class="itemImage"
              alt="product image"
            />

            <div class="itemInfo">

              <h2 class="itemName">
                Apple Banana
              </h2>

              <p class="itemCategory">
                Furniture
              </p>

            </div>

          </div>

          <div class="itemMeta">

            <div class="metaRow">

              <span class="metaLabel">
                Price
              </span>

            </div>

            <div class="metaRow">

              <span class="metaLabel">
                Status
              </span>

            </div>

          </div>

        </div>

        <!-- RIGHT -->

        <div class="itemRight">

          <span class="itemCode">
            ITM-2091
          </span>

          <h3 class="productPrice">
            <span>$</span>3200
          </h3>

          <div class="itemStatus unavailable">

            <span class="statusDot"></span>

            Not Available

          </div>

          <div class="itemActions">

            <button class="cartBtn disabled">

              <img
                src="<%= request.getContextPath() %>/Assets/Product/cart.png"
                class="iconImage"
                alt="cart icon"
              />

            </button>

            <button class="deleteBtn">

              <img
                src="<%= request.getContextPath() %>/Assets/Product/delete.png"
                class="iconImage"
                alt="delete icon"
              />

            </button>

          </div>

        </div>

      </li>

    </ul>

  </main>

</body>
</html>