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

@WebServlet("/customer/cart")
public class CartController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CartService cartService = new CartService();

        try {
            // Get customer email from session
            String custEmail = (String) SessionUtil.getAttribute(request, "Email");

            if (custEmail == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Get cart for customer
            Cart cart = cartService.getCartByCustomerEmail(custEmail);

            if (cart == null) {
                // No cart exists yet, set empty cart
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CartService cartService = new CartService();

        String action = request.getParameter("action");

        try {
            // Get customer email from session
            String custEmail = (String) SessionUtil.getAttribute(request, "Email");

            if (custEmail == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            // Get cart for customer
            Cart cart = cartService.getCartByCustomerEmail(custEmail);

            if (cart == null) {
                response.sendRedirect(request.getContextPath() + "/customer/cart");
                return;
            }

            Long cartId = cart.getCartId();

            if ("add".equals(action)) {
                // Add item to cart
                Long productId = Long.parseLong(request.getParameter("productId"));
                String result = cartService.addItemToCart(cartId, productId);

                if ("success".equals(result)) {
                    request.getSession().setAttribute("cartMessage", "Product added to cart!");
                } else {
                    request.getSession().setAttribute("cartMessage", result);
                }

                response.sendRedirect(request.getContextPath() + "/customer/cart");

            } else if ("remove".equals(action)) {
                // Remove item from cart
                Long cartItemId = Long.parseLong(request.getParameter("cartItemId"));
                cartService.removeItemFromCart(cartItemId, cartId);

                response.sendRedirect(request.getContextPath() + "/customer/cart");

            } else {
                response.sendRedirect(request.getContextPath() + "/customer/cart");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("cartMessage", "Something went wrong");
            response.sendRedirect(request.getContextPath() + "/customer/cart");
        }
    }
}