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

@WebServlet("/search")
public class SearchProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            ProductService productService = new ProductService();
            CategoryService categoryService = new CategoryService();

            String keyword = request.getParameter("q");
            String category = request.getParameter("category");

            List<Product> products;

            if (keyword != null && !keyword.trim().isEmpty()) {
                if (category != null && !category.trim().isEmpty()) {
                    products = productService.searchAvailableProductsByCategory(keyword.trim(), category.trim());
                } else {
                    products = productService.searchAvailableProducts(keyword.trim());
                }
            } else {
                // No keyword — just show all (or redirect to /products)
                products = productService.getAvailableProducts();
            }

            List<Category> categories = categoryService.getAllCategory();

            request.setAttribute("products", products);
            request.setAttribute("categories", categories);
            request.setAttribute("searchQuery", keyword);

            request.getRequestDispatcher("/WEB-INF/pages/Products.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Search failed");
        }
    }
}