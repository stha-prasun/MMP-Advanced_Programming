package com.model;

public class Category {
    private Long categoryId;
    private String type;
    private int productCount;

    public Category(Long categoryID, String type){
        this.categoryId = categoryID;
        this.type = type;

    }

    public Category(Long categoryID, String type, int productCount){
        this.categoryId = categoryID;
        this.type = type;
        this.productCount=productCount;
    }

    public int getProductCount() { return productCount; }

    public void setProductCount(int productCount) { this.productCount = productCount; }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type=type;
    }
}
