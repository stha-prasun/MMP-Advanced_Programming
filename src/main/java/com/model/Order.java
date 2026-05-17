package com.model;

import java.time.LocalDateTime;
import java.util.List;

public class Order {
    private Long orderId;
    private LocalDateTime orderedAt;
    private String orderStatus;
    private String deliveryLocation;
    private Long cartId;
    private Long customerId;
    private List<OrderItem> orderItems;
    private int orderTotalPrice;

    // Existing seller-view fields
    private Customer customer;
    private Product product;
    private OrderItem orderItem;

    public Order() {}

    public Order(Long orderId, LocalDateTime orderedAt, String orderStatus, String deliveryLocation,
                 Customer customer, Product product, OrderItem orderItem) {
        this.orderId = orderId;
        this.orderedAt = orderedAt;
        this.orderStatus = orderStatus;
        this.deliveryLocation = deliveryLocation;
        this.customer = customer;
        this.product = product;
        this.orderItem = orderItem;
    }

    public Order(Long orderId, LocalDateTime orderedAt, String orderStatus, Long cartId, Long customerId) {
        this.orderId = orderId;
        this.orderedAt = orderedAt;
        this.orderStatus = orderStatus;
        this.cartId = cartId;
        this.customerId = customerId;
    }

    public Long getOrderId() { return orderId; }
    public void setOrderId(Long orderId) { this.orderId = orderId; }

    public LocalDateTime getOrderedAt() { return orderedAt; }
    public void setOrderedAt(LocalDateTime orderedAt) { this.orderedAt = orderedAt; }

    public String getOrderStatus() { return orderStatus; }
    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }

    public String getDeliveryLocation() { return deliveryLocation; }
    public void setDeliveryLocation(String deliveryLocation) { this.deliveryLocation = deliveryLocation; }

    public Long getCartId() { return cartId; }
    public void setCartId(Long cartId) { this.cartId = cartId; }

    public Long getCustomerId() { return customerId; }
    public void setCustomerId(Long customerId) { this.customerId = customerId; }

    public List<OrderItem> getOrderItems() { return orderItems; }
    public void setOrderItems(List<OrderItem> orderItems) { this.orderItems = orderItems; }

    public int getOrderTotalPrice() { return orderTotalPrice; }
    public void setOrderTotalPrice(int orderTotalPrice) { this.orderTotalPrice = orderTotalPrice; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public Product getProduct() { return product; }
    public void setProduct(Product product) { this.product = product; }

    public OrderItem getOrderItem() { return orderItem; }
    public void setOrderItem(OrderItem orderItem) { this.orderItem = orderItem; }
}