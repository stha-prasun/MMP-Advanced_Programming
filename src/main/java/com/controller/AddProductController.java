package com.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import com.service.ProductService;
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

        request.getRequestDispatcher("/pages/Add_Product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form parameters
            String productName = request.getParameter("productName");
            String priceStr = request.getParameter("price");
            String category = request.getParameter("category");
            String description = request.getParameter("description");

            if (productName == null || productName.trim().isEmpty() ||
                    priceStr == null || priceStr.trim().isEmpty() ||
                    category == null || category.trim().isEmpty() ||
                    description == null || description.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
                return;
            }

            int price;

            try {
                price = Integer.parseInt(priceStr);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Price must be a valid number");
                request.getRequestDispatcher("/pages/Add_Product.jsp").forward(request, response);
                return;
            }

            LocalDateTime postedAt = LocalDateTime.now();

            Part imagePart = request.getPart("image");

            ImageUtil imageUtil = new ImageUtil();

            // Folder inside your project
            String saveFolder = "/Images/Product";

            boolean uploaded = imageUtil.uploadImage(imagePart, saveFolder);

            String imgUrl;

            if (uploaded) {
                imgUrl = saveFolder + "/" + imageUtil.getImageNameFromPart(imagePart);
            } else {
                imgUrl = "default.png"; // fallback image
            }

            // Call service
            ProductService service = new ProductService();
            service.addSeller(productName, price, category, postedAt, description, imgUrl);

            // Redirect after success
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to register page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
        }
    }
}