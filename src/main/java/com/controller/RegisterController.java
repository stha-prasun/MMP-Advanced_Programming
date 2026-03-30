package com.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import com.model.Customer;
import com.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
            String custName = request.getParameter("full_name");
            String custEmail = request.getParameter("email");
            String custPassword = request.getParameter("password");

            LocalDateTime custCreatedAt = LocalDateTime.now();
            // Call service
            CustomerService service = new CustomerService();
            service.addCustomer(custName, custEmail, custPassword, custCreatedAt);

            // Redirect after success
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to register page on error
            response.sendRedirect(request.getContextPath() + "/register");
        }
    }
}