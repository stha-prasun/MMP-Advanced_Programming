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

// This class is a controller that is used to get all cart items and show them
@WebServlet("/customer/cart")
public class CartController extends HttpServlet {

    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
    }

    @Override
    // get all cart items
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String custEmail = (String) SessionUtil.getAttribute(request, "Email");
            if (custEmail == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            Cart cart = cartService.getCartByCustomerEmail(custEmail);

            if (cart == null) {
                request.setAttribute("cart", null);
                request.setAttribute("cartItems", null);
                request.setAttribute("totalItems", 0);
                request.setAttribute("totalPrice", 0);
            } else {
                request.setAttribute("cart", cart);
                request.setAttribute("cartItems", cart.getCartTotalItems());
                request.setAttribute("totalItems", cart.getCartTotalItems() != null ? cart.getCartTotalItems().size() : 0);
                request.setAttribute("totalPrice", cart.getCartTotalPrice());
            }

            request.getRequestDispatcher("/WEB-INF/pages/Cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong loading your cart");
            request.getRequestDispatcher("/WEB-INF/pages/Cart.jsp").forward(request, response);
        }
    }
}