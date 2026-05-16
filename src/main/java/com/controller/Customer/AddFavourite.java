package com.controller.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.service.AddFavouriteService;
import com.util.CookieUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/favourite/add")
public class AddFavourite extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            Cookie cookie = CookieUtil.getCookie(request, "Email");

            String custEmail = null;

            if (cookie != null) {
                custEmail = cookie.getValue();
            }

            Long productId = Long.parseLong(request.getParameter("productId"));

            AddFavouriteService service = new AddFavouriteService();
            service.addToFavourite(productId, custEmail);

            response.sendRedirect(request.getContextPath() + "/products");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}