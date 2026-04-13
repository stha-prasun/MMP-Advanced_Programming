package com.controller;

import java.io.IOException;


import com.service.LoginService;
import com.util.CookieUtil;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customer/login")
public class LoginController extends HttpServlet {
    //object service

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form parameters
            String Email = request.getParameter("Email");
            String Password = request.getParameter("Password");

            if (Email == null || Email.trim().isEmpty() ||
                    Password == null || Password.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/pages/User.jsp").forward(request, response);
                return;
            }


                // Calling Customer Login Service
                LoginService ls = new LoginService();
                boolean success= ls.login(Email,Password);
                if (success){
                    SessionUtil.setAttribute(request, "Email", Email);
                    CookieUtil.addCookie(response, "Email", "temp", 5*30); //temp variable for now cause not finalized
                    // Redirect after success
                    response.sendRedirect(request.getContextPath() + "/home");


                }
                else{
                    request.setAttribute("error", "Please enter the correct email or password!!!");
                    request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
                }



        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to register page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}