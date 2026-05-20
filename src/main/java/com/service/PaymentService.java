package com.service;

import com.dao.CartDAO;
import com.dao.OrderDAO;
import com.dao.PaymentDAO;
import com.dao.ProductDAO;
import com.model.Order;
import com.model.OrderItem;

import java.util.List;

// service layer for payment
public class PaymentService {
    private OrderDAO orderDAO;
    private CartDAO cartDAO;
    private PaymentDAO paymentDAO;
    private ProductDAO productDAO;

    public PaymentService() {
        this.orderDAO = new OrderDAO();
        this.cartDAO = new CartDAO();
        this.paymentDAO = new PaymentDAO();
        this.productDAO = new ProductDAO();
    }

    // process online payment
    public void processOnlinePayment(Long orderId) throws Exception {
        List<OrderItem> items = orderDAO.getOrderItemsByOrderId(orderId);

        for (OrderItem item : items) {
            paymentDAO.createPayment(item.getOrderTotalPrice(), "ONLINE", item.getOrderitemId());
        }

        orderDAO.updateOrderStatus(orderId, "paid");

        Order order = orderDAO.getOrderById(orderId);
        for (OrderItem item : items) {
            productDAO.markProductAsSold(item.getProductId());
        }
        cartDAO.clearCartItems(order.getCartId());
    }

    // offline paymeny
    public void processOfflinePayment(Long orderId) throws Exception {
        List<OrderItem> items = orderDAO.getOrderItemsByOrderId(orderId);

        for (OrderItem item : items) {
            paymentDAO.createPayment(item.getOrderTotalPrice(), "CASH_ON_DELIVERY", item.getOrderitemId());
        }

        orderDAO.updateOrderStatus(orderId, "pending");

        Order order = orderDAO.getOrderById(orderId);
        for (OrderItem item : items) {
            productDAO.markProductAsSold(item.getProductId());
        }
        cartDAO.clearCartItems(order.getCartId());
    }
}