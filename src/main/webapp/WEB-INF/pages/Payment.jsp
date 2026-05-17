<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MMP</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/Payment.css" />
</head>
<body>
<<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

   <div class="user">
      <h1>PAYMENT METHOD</h1>
    </div>

    <div class="editPadding">
      <div class="contact">How would you like to pay?</div>
      <a href="<%= request.getContextPath() %>/customer/cart" class="editProfile">
        <img src="<%= request.getContextPath() %>/Assets/User/back.png" alt="back" />
        <span>Back</span>
      </a>
    </div>

    <!-- Order Summary -->
    <div class="orderSummary" style="padding: 20px 40px;">
        <p>Order #${orderId} &bull; ${itemCount} item(s)</p>
        <h3>Total: $ ${orderTotal}</h3>
    </div>

    <section class="methods">
        <a href="${pageContext.request.contextPath}/customer/payment/online?orderId=${orderId}&total=${orderTotal}" class="methodLink">
            <div class="online">
                <div class="left">
                    <img src="<%= request.getContextPath() %>/Assets/User/card.png" alt="card" />
                </div>
                <div class="right">
                    <h1>Online Payment</h1>
                    <p>Pay with Credit/Debit Card</p>
                </div>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/customer/payment/offline?orderId=${orderId}&total=${orderTotal}" class="methodLink">
            <div class="offline">
                <div class="left">
                    <img src="<%= request.getContextPath() %>/Assets/User/cash.png" alt="cash" />
                </div>
                <div class="right">
                    <h1>Offline Payment</h1>
                    <p>Pay with cash upon delivery or pickup</p>
                </div>
            </div>
        </a>
    </section>

</body>
</html>