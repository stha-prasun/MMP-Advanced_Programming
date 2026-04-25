package com.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import com.service.CustomerService;
import com.util.ImageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/customer/register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form parameters
            String custName = request.getParameter("custName");
            String custEmail = request.getParameter("custEmail");
            String custPassword = request.getParameter("custPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String terms = request.getParameter("terms");

            if (custName == null || custName.trim().isEmpty() ||
                    custEmail == null || custEmail.trim().isEmpty() ||
                    custPassword == null || custPassword.trim().isEmpty() ||
                    confirmPassword == null || confirmPassword.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
                return;
            }

            if (terms == null) {
                request.setAttribute("error", "You must agree to Terms and Conditions");
                request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
                return;
            }

            if (!custPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Passwords do not match");
                request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
                return;
            }

            LocalDateTime custCreatedAt = LocalDateTime.now();

            Part imagePart = request.getPart("image");

            ImageUtil imageUtil = new ImageUtil();

            // Folder inside your project
            String saveFolder = "/Images/Customer";

            boolean uploaded = imageUtil.uploadImage(imagePart, saveFolder, request);

            String imgUrl;

            if (uploaded) {
                imgUrl = saveFolder + "/" + imageUtil.getImageNameFromPart(imagePart);
            } else {
                imgUrl = "default.png"; // fallback image
            }

            // Call service
            CustomerService service = new CustomerService();
            service.addCustomer(custName, custEmail, custPassword, custCreatedAt, imgUrl);

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