package com.controller.Product;

import java.io.IOException;

import com.model.Product;
import com.service.ProductService;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/product/delete")
public class DeleteProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get sellerId from session
            Long sellerId = (Long) SessionUtil.getAttribute(request, "sellerId");

            if (sellerId == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Get product ID from request
            String productIdStr = request.getParameter("productId");

            if (productIdStr == null || productIdStr.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                return;
            }

            Long productId = Long.parseLong(productIdStr);

            // Get the product to verify ownership
            ProductService productService = new ProductService();
            Product product = productService.getProductById(productId);

            if (product == null || !sellerId.equals(product.getSellerId())) {
                // Either product doesn't exist or doesn't belong to this seller
                response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                return;
            }

            // Delete the product
            productService.deleteProduct(productId);

            // Redirect to seller dashboard with success message
            response.sendRedirect(request.getContextPath() + "/seller/dashboard?deleted=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/seller/dashboard?error=delete");
        }
    }
}