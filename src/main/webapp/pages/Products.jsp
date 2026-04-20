<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Products</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
        }

        .product-card {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-card h3 {
            margin: 10px 0 5px;
        }

        .price {
            color: green;
            font-weight: bold;
        }

        .category {
            font-size: 12px;
            color: gray;
        }

        .empty {
            text-align: center;
            font-size: 18px;
            color: gray;
        }
    </style>
</head>

<body>

<h1>All Products</h1>

<%
    List<Product> products = (List<Product>) request.getAttribute("productList");
%>

<div class="product-grid">

<% if (products != null && !products.isEmpty()) {
       for (Product p : products) {
%>

    <div class="product-card">
        <img src="<%= request.getContextPath() + "/" + p.getProductImageUrl() %>" alt="product">

        <h3><%= p.getProductName() %></h3>

        <p class="price">$<%= p.getProductPrice() %></p>

        <p class="category"><%= p.getProductCategory() %></p>
    </div>

<%
       }
   } else {
%>

    <div class="empty">No products available</div>

<%
   }
%>

</div>

</body>
</html>