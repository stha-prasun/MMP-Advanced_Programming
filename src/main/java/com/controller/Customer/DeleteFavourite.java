package com.controller.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.service.RemoveFavouriteService;
import com.util.CookieUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// This class is a controller that is used to delete the item from favourite
@WebServlet("/favourite/remove")
public class DeleteFavourite extends HttpServlet {

    @Override
    // removing product from favourite logic
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Cookie cookie = CookieUtil.getCookie(request, "Email");

            String custEmail = null;

            if (cookie != null) {
                custEmail = cookie.getValue();
            }

            Long productId = Long.parseLong(request.getParameter("productId"));

            RemoveFavouriteService service = new RemoveFavouriteService();

            service.removeFavourite(productId, custEmail);

            response.sendRedirect(request.getContextPath() + "/products");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}