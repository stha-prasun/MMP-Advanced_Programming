package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.model.Product;
import com.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/products")
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ProductService service = new ProductService();
            List<Product> products = service.getProducts();

            request.setAttribute("productList", products);

            request.getRequestDispatcher("/WEB-INF/pages/Products.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}