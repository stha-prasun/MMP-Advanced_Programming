package com.model;

import java.time.LocalDateTime;

public class Category {
    private Long categoryID;
    private String type;

    public Category(Long categoryID, String type){
        this.categoryID = categoryID;
        this.type = type;

    }
    public Long getcategoryID() {
        return categoryID;
    }

    public void setCustomerId(Long customerId) {
        this.categoryID = categoryID;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type=type;
    }
}
