package com.controller.Customer;

import java.io.IOException;
import java.util.List;

import com.model.FavouriteProductModel;
import com.service.FavouriteProductService;
import com.util.CookieUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// This class is a controller that is used to get all the favourite products from the database
@WebServlet("/customer/favorite")
public class FavouriteProductsController extends HttpServlet {

    @Override
    // actual get logic is heree
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie cookie = CookieUtil.getCookie(request, "Email");

        String custEmail = null;
        if (cookie != null) {
            custEmail = cookie.getValue();
        }

        try {
            FavouriteProductService service = new FavouriteProductService();
            List<FavouriteProductModel> products = service.getAllFavouriteProducts(custEmail);

            request.setAttribute("productList", products);

            request.getRequestDispatcher("/WEB-INF/pages/Favorite.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}