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
            String custEmail = request.getParameter("custEmail");
            String custPassword = request.getParameter("custPassword");
            String role =request.getParameter("role");

            if (role.equals("customer")) {
                // Calling Customer Login Service
                LoginService ls = new LoginService();
                boolean success= ls.login(custEmail,custPassword);
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
                //currently still customer login
                LoginService ls = new LoginService();
                boolean success= ls.login(custEmail,custPassword);
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