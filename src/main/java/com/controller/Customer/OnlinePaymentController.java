package com.controller.Customer;

import com.service.PaymentService;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// This class is a controller that is used to handle online payments part
@WebServlet("/customer/payment/online")
public class OnlinePaymentController extends HttpServlet {

    private PaymentService paymentService;

    @Override
    public void init() throws ServletException {
        paymentService = new PaymentService();
    }

    @Override
    // get the payment page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String custEmail = (String) SessionUtil.getAttribute(request, "Email");
        if (custEmail == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            Long orderId = Long.parseLong(request.getParameter("orderId"));
            int total = Integer.parseInt(request.getParameter("total"));

            request.setAttribute("orderId", orderId);
            request.setAttribute("orderTotal", total);

            request.getRequestDispatcher("/WEB-INF/pages/OnlinePayment.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/customer/payment");
        }
    }

    @Override
    // logic for online payment processing
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String custEmail = (String) SessionUtil.getAttribute(request, "Email");
        if (custEmail == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            Long orderId = Long.parseLong(request.getParameter("orderId"));
            paymentService.processOnlinePayment(orderId);

            request.getSession().setAttribute("orderMessage", "Payment successful! Your order has been placed.");
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("orderMessage", "Payment failed. Please try again.");
            response.sendRedirect(request.getContextPath() + "/customer/payment?orderId=" + request.getParameter("orderId"));
        }
    }
}