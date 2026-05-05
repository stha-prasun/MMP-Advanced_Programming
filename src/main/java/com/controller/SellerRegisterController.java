package com.controller;

import java.io.*;
import java.time.LocalDateTime;

import com.service.SellerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/seller/register")
public class SellerRegisterController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form parameters
            String sellerName = request.getParameter("sellerName");
            String sellerEmail = request.getParameter("sellerEmail");
            String verificationId = request.getParameter("verificationId");
            String sellerPassword = request.getParameter("sellerPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String sellerLocation = request.getParameter("sellerLocation");

            if (sellerName == null || sellerName.trim().isEmpty() ||
                    sellerEmail == null || sellerEmail.trim().isEmpty() ||
                    sellerPassword == null || sellerPassword.trim().isEmpty() ||
                    confirmPassword == null || confirmPassword.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request, response);
                return;
            }

            if (!sellerPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Passwords do not match");
                request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request, response);
                return;
            }

            LocalDateTime sellerCreatedAt = LocalDateTime.now();
            boolean sellerIsActive= true;

            // Call service
            SellerService service = new SellerService();
            service.addSeller(sellerEmail, sellerPassword, sellerName, sellerLocation, sellerIsActive, verificationId, sellerCreatedAt);

            // Redirect after success
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to register page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request, response);
        }
    }
}