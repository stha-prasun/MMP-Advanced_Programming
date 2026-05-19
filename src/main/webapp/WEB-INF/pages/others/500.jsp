<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>MMP</title>
            <link href="https://fonts.googleapis.com/css2?family=Modak&display=swap" rel="stylesheet" />
            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/404.css" />

</head>
<body>
            <section class="emptyState">
            <img src="<%= request.getContextPath() %>/Assets/User/404.png" alt="profile" />
            <h1 class="emptyText">
              500 ERROR <br>
              <span>INTERNAL SERVER ERROR</span>
            </h1>
            </section>
</body>
</html>