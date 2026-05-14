package com.controller.Product;

import com.model.Product;
import com.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/product/details")
public class IndividualProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        try {
            Long productId = Long.parseLong(idParam);
            ProductService productService = new ProductService();
            Product product = productService.getAvailableProductById(productId);

            if (product == null) {
                response.sendRedirect("products");
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("/WEB-INF/pages/IndividualProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load product");
        }
    }
}
