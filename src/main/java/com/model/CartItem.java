package com.model;

// cart item model
public class CartItem {
    private Long cartItemID;
    private int quantity;
    private Long cartId;
    private Long productId;
    private String productName;
    private int productPrice;
    private String productImageUrl;
    private String sellerName;

    public CartItem() {
    }

    public CartItem(Long cartItemID, int quantity, Long cartId, Long productId) {
        this.cartItemID = cartItemID;
        this.quantity = quantity;
        this.cartId = cartId;
        this.productId = productId;
    }

    public CartItem(Long cartItemID, int quantity, Long cartId, Long productId,
                    String productName, int productPrice, String productImageUrl, String sellerName) {
        this.cartItemID = cartItemID;
        this.quantity = quantity;
        this.cartId = cartId;
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImageUrl = productImageUrl;
        this.sellerName = sellerName;
    }

    public Long getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(Long cartItemID) {
        this.cartItemID = cartItemID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Long getCartId() {
        return cartId;
    }

    public void setCartId(Long cartId) {
        this.cartId = cartId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImageUrl() {
        return productImageUrl;
    }

    public void setProductImageUrl(String productImageUrl) {
        this.productImageUrl = productImageUrl;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }
}