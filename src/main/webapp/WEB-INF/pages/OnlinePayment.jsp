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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/OnlinePayment.css" />
</head>
<body>
<<jsp:include page="/WEB-INF/pages/Navbar.jsp" />

   <div class="user">
      <h1>ONLINE PAYMENT</h1>
    </div>

    <div class="editPadding">
      <div class="contact">Please fill up your details</div>
      <a href="${pageContext.request.contextPath}/customer/payment?orderId=${orderId}" class="editProfile">
        <img src="<%= request.getContextPath() %>/Assets/User/back.png" alt="back" />
        <span>Back</span>
      </a>
    </div>

<section class="online">

  <div class="total">
    <h1>Total</h1>
    <h1>$ ${orderTotal}</h1>
  </div>

  <form class="paymentForm" method="POST" action="${pageContext.request.contextPath}/customer/payment/online">
    <input type="hidden" name="orderId" value="${orderId}" />

    <label>Card Number</label>
    <input type="text" name="cardNumber" placeholder="0000 0000 0000 0000" required />

    <div class="row">
      <div class="field">
        <label>Expiry (MM/YY)</label>
        <input type="text" name="expiry" placeholder="MM/YY" required />
      </div>

      <div class="field">
        <label>CVV</label>
        <input type="text" name="cvv" placeholder="123" required />
      </div>
    </div>

    <label>Cardholder Name</label>
    <input type="text" name="cardHolder" placeholder="Rohan Shrestha" required />

    <button type="submit">Pay now</button>

  </form>

</section>

</body>
</html>