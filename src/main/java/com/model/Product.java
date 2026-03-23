package com.model;

import com.model.enums.Category;

import java.time.LocalDateTime;

public class Product {

    private int productId;
    private String productName;
    private int price;
    private Category category;
    private LocalDateTime postedAt;
    private String description;
    private String imgUrl;

    public Product(int productId, String productName, int price, Category category, String description, String imgUrl) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.category = category;
        this.description = description;
        this.imgUrl = imgUrl;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public LocalDateTime getPostedAt() {
        return postedAt;
    }

    public void setPostedAt(LocalDateTime postedAt) {
        this.postedAt = postedAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
