package com.controller.Customer;

import com.model.Cart;
import com.service.CartService;
import com.service.OrderService;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/customer/checkout")
public class CheckoutController extends HttpServlet {

    private CartService cartService;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        cartService = new CartService();
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // GET should not create orders — just redirect to cart
        request.getSession().setAttribute("cartMessage", "Please use the checkout button in your cart.");
        response.sendRedirect(request.getContextPath() + "/customer/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String custEmail = (String) SessionUtil.getAttribute(request, "Email");
        if (custEmail == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            Cart cart = cartService.getCartByCustomerEmail(custEmail);

            if (cart == null || cart.getCartTotalItems() == null || cart.getCartTotalItems().isEmpty()) {
                request.getSession().setAttribute("cartMessage", "Your cart is empty");
                response.sendRedirect(request.getContextPath() + "/customer/cart");
                return;
            }

            Long orderId = orderService.createOrderFromCart(custEmail, cart);
            response.sendRedirect(request.getContextPath() + "/customer/payment?orderId=" + orderId);

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("cartMessage", "Checkout failed. Please try again.");
            response.sendRedirect(request.getContextPath() + "/customer/cart");
        }
    }
}