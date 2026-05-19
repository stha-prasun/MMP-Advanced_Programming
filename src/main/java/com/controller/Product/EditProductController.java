package com.controller.Product;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import com.model.Category;
import com.model.Product;
import com.service.CategoryService;
import com.service.ProductService;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import com.util.ImageUtil;

@MultipartConfig
@WebServlet("/product/edit")
public class EditProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get product ID from request
            String productIdStr = request.getParameter("id");

            if (productIdStr == null || productIdStr.trim().isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                return;
            }

            Long productId = Long.parseLong(productIdStr);

            // Fetch the product details
            ProductService productService = new ProductService();
            Product product = productService.getProductById(productId);

            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                return;
            }

            // Check if the logged-in seller owns this product
            Long sellerId = (Long) SessionUtil.getAttribute(request, "sellerId");
            if (sellerId == null || !sellerId.equals(product.getSellerId())) {
                response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                return;
            }

            // Fetch categories for the dropdown
            CategoryService categoryService = new CategoryService();
            List<Category> categoryList = categoryService.getAllCategory();

            request.setAttribute("categories", categoryList);
            request.setAttribute("product", product);

            request.getRequestDispatcher("/WEB-INF/pages/EditProduct.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/seller/dashboard");
        }
    }

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

            // Get form parameters
            String productIdStr = request.getParameter("productId");
            String productName = request.getParameter("productName");
            String priceStr = request.getParameter("price");
            String categoryIdStr = request.getParameter("category");
            String description = request.getParameter("description");

            if (productIdStr == null || productName == null || productName.trim().isEmpty() ||
                    priceStr == null || priceStr.trim().isEmpty() ||
                    description == null || description.trim().isEmpty()) {

                ProductService productService = new ProductService();
                Product product = productService.getProductById(Long.parseLong(productIdStr));

                CategoryService categoryService = new CategoryService();
                List<Category> categoryList = categoryService.getAllCategory();

                request.setAttribute("product", product);
                request.setAttribute("categories", categoryList);
                request.setAttribute("error", "All fields are required");

                request.getRequestDispatcher("/WEB-INF/pages/EditProduct.jsp").forward(request, response);
                return;
            }

            Long productId = Long.parseLong(productIdStr);
            int price = Integer.parseInt(priceStr);
            Long categoryId = Long.parseLong(categoryIdStr);

            // Get existing product to verify ownership
            ProductService productService = new ProductService();
            Product existingProduct = productService.getProductById(productId);

            if (existingProduct == null || !sellerId.equals(existingProduct.getSellerId())) {
                response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                return;
            }

            // Handle image upload
            Part imagePart = request.getPart("image");
            String imgUrl = existingProduct.getProductImageUrl(); // Keep existing image by default

            if (imagePart != null && imagePart.getSize() > 0) {
                ImageUtil imageUtil = new ImageUtil();
                String saveFolder = "/Images/Product";
                boolean uploaded = imageUtil.uploadImage(imagePart, saveFolder, request);

                if (uploaded) {
                    imgUrl = saveFolder + "/" + imageUtil.getImageNameFromPart(imagePart);
                }
            }

            // Update the product
            productService.updateProduct(productId, productName, price, categoryId, description, imgUrl);

            // Redirect to seller dashboard
            response.sendRedirect(request.getContextPath() + "/seller/dashboard");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            doGet(request, response);
        }
    }
}