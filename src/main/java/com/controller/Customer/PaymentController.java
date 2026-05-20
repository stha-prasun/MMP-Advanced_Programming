package com.controller.Customer;

import com.model.Order;
import com.model.OrderItem;
import com.service.OrderService;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

// // This class is a controller that is used to redirect customers. They can either choose online or offline payment
@WebServlet("/customer/payment")
public class PaymentController extends HttpServlet {

    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String custEmail = (String) SessionUtil.getAttribute(request, "Email");
        if (custEmail == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String orderIdParam = request.getParameter("orderId");
            if (orderIdParam == null || orderIdParam.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/customer/cart");
                return;
            }

            Long orderId = Long.parseLong(orderIdParam);
            Order order = orderService.getOrderById(orderId);

            if (order == null) {
                request.getSession().setAttribute("cartMessage", "Order not found");
                response.sendRedirect(request.getContextPath() + "/customer/cart");
                return;
            }

            List<OrderItem> items = orderService.getOrderItemsByOrderId(orderId);
            int total = 0;
            for (OrderItem item : items) {
                total += item.getOrderTotalPrice();
            }

            request.setAttribute("orderId", orderId);
            request.setAttribute("orderItems", items);
            request.setAttribute("orderTotal", total);
            request.setAttribute("itemCount", items.size());

            request.getRequestDispatcher("/WEB-INF/pages/Payment.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/customer/cart");
        }
    }
}