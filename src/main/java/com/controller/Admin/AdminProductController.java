package com.controller.Admin;

import com.model.Product;
import com.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/product")
public class AdminProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // You were missing this! Need to fetch products first
            ProductService service = new ProductService();
            List<Product> products = service.getAllProducts();

            // Set the products as request attribute
            request.setAttribute("productList", products);

            // Now forward to JSP
            request.getRequestDispatcher("/WEB-INF/pages/AdminProduct.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading products");
            request.getRequestDispatcher("/WEB-INF/pages/AdminProduct.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String productIdStr = request.getParameter("productId");

        try {
            if (productIdStr != null && action != null) {
                Long productId = Long.parseLong(productIdStr);
                ProductService service = new ProductService();

                if ("approve".equals(action)) {
                    service.approveProduct(productId);
                } else {
                    service.rejectProduct(productId);
                }
            }

            // Redirect back to product list (this will trigger doGet)
            response.sendRedirect(request.getContextPath() + "/admin/product");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/product");
        }
    }
}