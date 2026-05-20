package com.model;

// order item model
public class OrderItem {
    private Long orderitemId;
    private int orderTotalPrice;
    private Long orderId;
    private Long productId;

    // Product details for display
    private String productName;
    private int productPrice;
    private String productImageUrl;
    private String sellerName;

    public OrderItem() {}

    public OrderItem(Long orderitemId, int orderTotalPrice, Long orderId, Long productId) {
        this.orderitemId = orderitemId;
        this.orderTotalPrice = orderTotalPrice;
        this.orderId = orderId;
        this.productId = productId;
    }

    public Long getOrderitemId() { return orderitemId; }
    public void setOrderitemId(Long orderitemId) { this.orderitemId = orderitemId; }

    public int getOrderTotalPrice() { return orderTotalPrice; }
    public void setOrderTotalPrice(int orderTotalPrice) { this.orderTotalPrice = orderTotalPrice; }

    public Long getOrderId() { return orderId; }
    public void setOrderId(Long orderId) { this.orderId = orderId; }

    public Long getProductId() { return productId; }
    public void setProductId(Long productId) { this.productId = productId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public int getProductPrice() { return productPrice; }
    public void setProductPrice(int productPrice) { this.productPrice = productPrice; }

    public String getProductImageUrl() { return productImageUrl; }
    public void setProductImageUrl(String productImageUrl) { this.productImageUrl = productImageUrl; }

    public String getSellerName() { return sellerName; }
    public void setSellerName(String sellerName) { this.sellerName = sellerName; }
}