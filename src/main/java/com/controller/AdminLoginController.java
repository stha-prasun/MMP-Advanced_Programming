package com.controller;

import com.service.LoginService;
import com.util.CookieUtil;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/Admin_Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String adminMail = request.getParameter("AdminEmail");
            String adminPassword = request.getParameter("AdminPass");//before entering add a hashing function.
            //Verifying whether both fields have been entered.
            if (adminMail == null || adminMail.isEmpty() || adminPassword.isEmpty() || adminPassword == null) {
                request.setAttribute("error", "All the Fields are Required");
                request.getRequestDispatcher("/admin/login").forward(request, response);
                return;
            }

            // Calling Admin Login Service
            LoginService ls = new LoginService();
            boolean success= ls.adminLogin(adminMail,adminPassword);
            if (success){
                SessionUtil.setAttribute(request, "Email", adminMail);
                CookieUtil.addCookie(response, "Email", adminMail, 5*30);
                CookieUtil.addCookie(response, "Role", "Admin", 5*30);
                // Redirect after success
                response.sendRedirect(request.getContextPath() + "/home");
            }
            else{
                request.setAttribute("error", "Please enter the correct email or password!!!");
                request.getRequestDispatcher("/WEB-INF/pages/Admin_Login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to Login page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/WEB-INF/pages/Admin_Login.jsp").forward(request, response);
        }
    }
}