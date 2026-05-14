package com.model;

import java.time.LocalDateTime;

public class Order {
    private Long orderId;
    private LocalDateTime orderedAt;
    private String orderStatus;

    //Now for detils of Customer
    Customer customer;

    //Now for details of the Product
    Product product;

    //detials of the order-item
    OrderItem orderItem;

    //POJO CREATION

    public Order (Long orderId, LocalDateTime orderedAt, String orderStatus, Customer customer, Product product, OrderItem orderItem){
        this.orderId=orderId;
        this.orderedAt=orderedAt;
        this.orderStatus=orderStatus;
        this.customer=customer;
        this.product=product;
        this.orderItem=orderItem;
    }
    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public LocalDateTime getOrderedAt() {
        return orderedAt;
    }

    public void setOrderedAt(LocalDateTime orderedAt) {
        this.orderedAt = orderedAt;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public OrderItem getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItem orderItem) {
        this.orderItem = orderItem;
    }
}
