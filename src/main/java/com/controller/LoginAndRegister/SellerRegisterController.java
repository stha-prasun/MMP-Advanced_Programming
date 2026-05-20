package com.controller.LoginAndRegister;

import java.io.*;
import java.time.LocalDateTime;

import com.service.SellerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

// This class is a controller that is used to handle registration for seller
@WebServlet("/seller/register")
public class SellerRegisterController extends HttpServlet {
    //show the page
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request,response);
    }

    @Override
    // actual registration logic
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
            if (sellerName.contains("@") || sellerName.contains("$") || sellerName.contains("#")
                    || sellerName.contains("%")|| sellerName.contains("&")|| sellerName.contains("*")) {

                request.setAttribute("error", "Remove Special Character in your Name");
                request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request, response);
                return;
            }

            if (!sellerPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Passwords do not match");
                request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request, response);
                return;
            }

            if (sellerLocation.equalsIgnoreCase("KTM")||sellerLocation.equalsIgnoreCase("kaathmandu")||sellerLocation.equalsIgnoreCase("katmandu")||sellerLocation.equals("kathmandu")) {
                sellerLocation = "Kathmandu";
            }
            else if (sellerLocation.equalsIgnoreCase("PKR")||sellerLocation.equalsIgnoreCase("pokara")||sellerLocation.equalsIgnoreCase("pokra")|| sellerLocation.equals("pokhara")) {
                sellerLocation = "Pokhara";
            }



            LocalDateTime sellerCreatedAt = LocalDateTime.now();
            boolean sellerIsActive= true;

            // Call service
            SellerService service = new SellerService();
            service.addSeller(sellerEmail, sellerPassword, sellerName, sellerLocation, sellerIsActive, verificationId, sellerCreatedAt);

            // Redirect after success
            response.sendRedirect(request.getContextPath() + "/login");

        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to register page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/WEB-INF/pages/Seller.jsp").forward(request, response);
        }
    }
}