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

// This class is a controller that is used to add product to cart
@WebServlet("/customer/cart/add")
public class CartAddController extends HttpServlet {

    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
    }

    @Override
    // adding logic
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String custEmail = (String) SessionUtil.getAttribute(request, "Email");
            if (custEmail == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            Long productId = Long.parseLong(request.getParameter("productId"));
            Cart cart = cartService.getOrCreateCartByCustomerEmail(custEmail);
            Long cartId = cart.getCartId();

            String result = cartService.addItemToCart(cartId, productId);

            if ("success".equals(result)) {
                request.getSession().setAttribute("cartMessage", "Product added to cart!");
            } else {
                request.getSession().setAttribute("cartMessage", result);
            }

            response.sendRedirect(request.getContextPath() + "/customer/cart");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("cartMessage", "Something went wrong");
            response.sendRedirect(request.getContextPath() + "/customer/cart");
        }
    }
}