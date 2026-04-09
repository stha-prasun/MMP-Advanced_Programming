package com.controller;

import java.io.IOException;


import com.service.LoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customer/login")
public class LoginController extends HttpServlet {
    //onject service

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form parameters
            String Email = request.getParameter("Email");
            String Password = request.getParameter("Password");
            String role =request.getParameter("role");

            if (Email == null || Email.trim().isEmpty() ||
                    Password == null || Password.trim().isEmpty() ||
                    role == null || role.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
                return;
            }

            if (role.equals("customer")) {
                // Calling Customer Login Service
                LoginService ls = new LoginService();
                boolean success= ls.login(Email,Password,role);
                if (success){
                    // Redirect after success
                    response.sendRedirect(request.getContextPath() + "/home");

                }
                else{
                    request.setAttribute("error", "Please enter the correct email or password!!!");
                    request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                }
            }else{
                //Call Seller Login Service
                LoginService ls = new LoginService();
                boolean success= ls.login(Email,Password,role);
                if (success){
                    // Redirect after success
                    response.sendRedirect(request.getContextPath() + "/home");

                }
                else{
                    request.setAttribute("error", "Please enter the correct email or password!!!");
                    request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                }
            }


        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to register page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}