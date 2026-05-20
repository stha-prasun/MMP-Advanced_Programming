package com.controller.Customer;

import com.model.Cart;
import com.service.CartService;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// This class is a controller that is used to remove product from cart
@WebServlet("/customer/cart/remove")
public class CartRemoveController extends HttpServlet {

    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
    }

    @Override
    // actual logic
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String custEmail = (String) SessionUtil.getAttribute(request, "Email");
            if (custEmail == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            Cart cart = cartService.getCartByCustomerEmail(custEmail);
            if (cart == null) {
                response.sendRedirect(request.getContextPath() + "/customer/cart");
                return;
            }

            Long cartItemId = Long.parseLong(request.getParameter("cartItemId"));
            cartService.removeItemFromCart(cartItemId, cart.getCartId());

            response.sendRedirect(request.getContextPath() + "/customer/cart");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("cartMessage", "Something went wrong");
            response.sendRedirect(request.getContextPath() + "/customer/cart");
        }
    }
}