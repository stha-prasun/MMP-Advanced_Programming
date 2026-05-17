package com.service;

import com.dao.CartDAO;
import com.dao.OrderDAO;
import com.model.Cart;
import com.model.CartItem;
import com.model.Order;
import com.model.OrderItem;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    private OrderDAO orderDAO;
    private CartDAO cartDAO;

    public OrderService() {
        this.orderDAO = new OrderDAO();
        this.cartDAO = new CartDAO();
    }

    public List<Order> getAllOrderForSeller(String sellerEmail) throws Exception {
        return orderDAO.getAllOrderforSeller(sellerEmail);
    }

    // Create order from cart
    public Long createOrderFromCart(String custEmail, Cart cart) throws Exception {
        Long customerId = cartDAO.getCustomerIdByEmail(custEmail);
        if (customerId == null) {
            throw new SQLException("Customer not found");
        }

        Long orderId = orderDAO.createOrder(customerId, cart.getCartId());

        for (CartItem cartItem : cart.getCartTotalItems()) {
            int itemTotal = cartItem.getQuantity() * cartItem.getProductPrice();
            orderDAO.createOrderItem(orderId, cartItem.getProductId(), itemTotal);
        }

        return orderId;
    }

    public Order getOrderById(Long orderId) throws SQLException {
        return orderDAO.getOrderById(orderId);
    }

    public List<OrderItem> getOrderItemsByOrderId(Long orderId) throws SQLException {
        return orderDAO.getOrderItemsByOrderId(orderId);
    }
}