package com.controller.LoginAndRegister;

import java.io.IOException;


import com.model.Customer;
import com.model.Seller;
import com.service.LoginService;
import com.util.CookieUtil;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//test comment
@WebServlet("/login")
public class LoginController extends HttpServlet {
    //object service

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form parameters
            String Email = request.getParameter("Email");
            String Password = request.getParameter("custPassword");
            String Role = request.getParameter("role");

            if (Email == null || Email.trim().isEmpty() ||
                    Password == null || Password.trim().isEmpty()) {
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
                return;
            }

            if(Role == null || Role.isEmpty()){
                request.setAttribute("error", "Role required");
                request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
                return;
            }

                // Calling Customer Login Service
                LoginService ls = new LoginService();
            if("Customer".equals(Role)) {

                Customer customer = ls.login(Email, Password);

                if (customer != null) {

                    if (!customer.getCustIsActive()) {

                        request.setAttribute("error", "Your account has been deactivated.");

                        request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);

                        return;
                    }

                        SessionUtil.setAttribute(request, "Email", Email);
                        CookieUtil.addCookie(response, "Email", Email, 10 * 30); //temp variable for now cause not finalized
                        SessionUtil.setAttribute(request, "custProfileImg", customer.getCustProfileImg());
                        // Redirect after success
                        response.sendRedirect(request.getContextPath() + "/home");
                    } else {
                        request.setAttribute("error", "Please enter the correct email or password!!!");
                        request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
                    }
                }else{
                    // Seller login
                    Seller seller = ls.sellerLogin(Email, Password);

                    if (seller != null) {
                        if (!seller.getSellerIsActive()) {

                            request.setAttribute("error", "Your seller account has been deactivated.");

                            request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);

                            return;
                        }
                        SessionUtil.setAttribute(request, "Email", Email);
                        SessionUtil.setAttribute(request, "sellerId", seller.getSellerId());
                        SessionUtil.setAttribute(request, "sellerName", seller.getSellerName());
                        SessionUtil.setAttribute(request, "userRole", "seller");

                        CookieUtil.addCookie(response, "Email", Email, 5 * 30);
                        response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                    } else {
                        request.setAttribute("error", "Please enter the correct email or password!!!");
                        request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
                    }
                }



        } catch (Exception e) {
            e.printStackTrace();

            // Redirect back to register page on error
            request.setAttribute("error", "Something went wrong");
            request.getRequestDispatcher("/login").forward(request, response);
        }
    }
}