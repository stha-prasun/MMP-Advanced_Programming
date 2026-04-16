package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Admin_Login")
public class AdminLoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/Admin_Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String adminMail = request.getParameter("AdminEmail");
            String adminPassword = request.getParameter("AdminPass");//before entering add a hashing function.
            //Verifying whether both fields have been entered.
            if (adminMail == null || adminMail.isEmpty() || adminPassword.isEmpty() ||adminPassword == null) {
                request.setAttribute("error", "All the Fields are Required");
                request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
                return;
            }
            // Redirect after success
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to Login page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
        }
    }
}