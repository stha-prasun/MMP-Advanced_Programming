package com.controller.Product;

import java.io.IOException;
import java.util.List;

import com.model.Category;
import com.model.Product;
import com.service.CategoryService;
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
            ProductService productService = new ProductService();
            CategoryService categoryService = new CategoryService();

            // 1. Filtered or unfiltered products
            List<Product> products;
            String category = request.getParameter("category");

            if (category != null && !category.trim().isEmpty()) {
                products = productService.getAvailableProductsByCategory(category.trim());
            } else {
                products = productService.getAvailableProducts();
            }

            // 2. Dynamic category list for the dropdown
            List<Category> categories = categoryService.getAllCategory();

            request.setAttribute("products", products);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/WEB-INF/pages/Products.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load products");
        }
    }
}