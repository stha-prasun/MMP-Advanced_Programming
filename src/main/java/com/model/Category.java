package com.model;

public class Category {
    private Long categoryId;
    private String type;

    public Category(Long categoryID, String type){
        this.categoryId = categoryID;
        this.type = type;

    }
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
