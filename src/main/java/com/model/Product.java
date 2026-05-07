package com.model;

import java.time.LocalDateTime;

public class Product {

    private Long productId;
    private String productName;
    private int productPrice;
    private String productImageUrl;
    private boolean productIsSold;
    private String productCategory;
    private LocalDateTime postedAt;
    private String productDescription;

    public Product(Long productId, String productName, int productPrice, String productImageUrl, boolean productIsSold, String productCategory, LocalDateTime postedAt, String productDescription) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImageUrl = productImageUrl;
        this.productIsSold = productIsSold;
        this.productCategory = productCategory;
        this.postedAt = postedAt;
        this.productDescription = productDescription;
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

    public boolean isProductIsSold() {
        return productIsSold;
    }

    public void setProductIsSold(boolean productIsSold) {
        this.productIsSold = productIsSold;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public LocalDateTime getPostedAt() {
        return postedAt;
    }

    public void setPostedAt(LocalDateTime postedAt) {
        this.postedAt = postedAt;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }
}
