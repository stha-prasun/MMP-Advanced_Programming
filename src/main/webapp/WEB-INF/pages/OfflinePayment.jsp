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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/OfflinePayment.css" />

</head>
<body>
<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

   <div class="user">
      <h1>OFFLINE PAYMENT</h1>
    </div>

    <div class="editPadding">
      <div class="contact">Cash on delivery</div>
      <button class="editProfile">
        <img src="<%= request.getContextPath() %>/Assets/User/back.png" alt="back" />
        <span>Back</span>
      </button>
    </div>


    <section class="offline">

        <div class="circle">
            <img src="<%= request.getContextPath() %>/Assets/User/cash.png" alt="cash" />
        </div>

        <div class="text">
        <h1>Pay with Cash</h1>
        <p>Our rider will collect the payment upon delivery.</p>
        </div>

        <div class="total">
        <h1>Total:</h1>
        <h1>rs.450.00</h1>
        </div>

        <button>Confirm Order</button>
    </section>

</body>
</html>