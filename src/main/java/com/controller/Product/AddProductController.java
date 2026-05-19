package com.controller.Product;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import com.model.Category;
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
@WebServlet("/product/add")
public class AddProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Fetch categories from database
            CategoryService categoryService = new CategoryService();
            List<Category> categoryList = categoryService.getAllCategory();
            request.setAttribute("categories", categoryList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load categories");
        }

        request.getRequestDispatcher("/WEB-INF/pages/Add_Product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get sellerId from session
            Long sellerId = (Long) SessionUtil.getAttribute(request, "sellerId");

            // Check if seller is logged in
            if (sellerId == null) {
                request.setAttribute("error", "You must be logged in as a seller to add products");
                request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
                return;
            }

            // Get form parameters
            String productName = request.getParameter("productName");
            String priceStr = request.getParameter("price");

            Long categoryId;
            try {
                categoryId = Long.parseLong(request.getParameter("category"));
            } catch (Exception e) {
                request.setAttribute("error", "Please Select a category");
                CategoryService categoryService = new CategoryService();
                List<Category> categoryList = categoryService.getAllCategory();
                request.setAttribute("categories", categoryList);

                request.getRequestDispatcher("/WEB-INF/pages/Add_Product.jsp")
                        .forward(request, response);
                return;
            }

            String description = request.getParameter("description");

            //checking for empty Fields
            if (productName == null || productName.trim().isEmpty() ||
                    priceStr == null || priceStr.trim().isEmpty() ||
                    description == null || description.trim().isEmpty()) {

                // Reload categories for the form
                try {
                    CategoryService categoryService = new CategoryService();
                    List<Category> categoryList = categoryService.getAllCategory();
                    request.setAttribute("categories", categoryList);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/WEB-INF/pages/Add_Product.jsp").forward(request, response);
                return;
            }

            //checking for Invalid Special Characters
            if (productName.contains("@") || productName.contains("$") || productName.contains("#")
                    || productName.contains("%")|| productName.contains("&")|| productName.contains("*")) {

                // Reload categories for the form
                try {
                    CategoryService categoryService = new CategoryService();
                    List<Category> categoryList = categoryService.getAllCategory();
                    request.setAttribute("categories", categoryList);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/WEB-INF/pages/Add_Product.jsp").forward(request, response);
                return;
            }

            //validating price is positive
            int price;
            try {
                price = Integer.parseInt(priceStr);
            } catch (NumberFormatException e) {
                // Reload categories for the form
                try {
                    CategoryService categoryService = new CategoryService();
                    List<Category> categoryList = categoryService.getAllCategory();
                    request.setAttribute("categories", categoryList);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                request.setAttribute("error", "Price must be a valid number");
                request.getRequestDispatcher("/WEB-INF/pages/Add_Product.jsp").forward(request, response);
                return;
            }

            LocalDateTime postedAt = LocalDateTime.now();

            Part imagePart = request.getPart("image");

            ImageUtil imageUtil = new ImageUtil();
            String saveFolder = "/Images/Product";

            boolean uploaded = imageUtil.uploadImage(imagePart, saveFolder, request);

            String imgUrl;
            if (uploaded) {
                imgUrl = saveFolder + "/" + imageUtil.getImageNameFromPart(imagePart);
            } else {
                imgUrl = "default.png";
            }

            // Call service with sellerId
            ProductService service = new ProductService();
            service.addProduct(productName, price, categoryId, postedAt, description, imgUrl, sellerId);

            // Redirect after success
            response.sendRedirect(request.getContextPath() + "/seller/dashboard");

        } catch (Exception e) {
            e.printStackTrace();

            // Reload categories for the form
            try {
                CategoryService categoryService = new CategoryService();
                List<Category> categoryList = categoryService.getAllCategory();
                request.setAttribute("categories", categoryList);
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/Add_Product.jsp").forward(request, response);
        }
    }
}