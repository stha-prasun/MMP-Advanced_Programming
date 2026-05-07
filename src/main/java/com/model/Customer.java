package com.model;

import com.model.enums.Role;

import java.time.LocalDateTime;

public class Customer {
    private Long customerId;
    private String custName;
    private String custEmail;
    private String custPassword;
    private boolean custIsActive;
    private LocalDateTime custCreatedAt;
    private String custProfileImg;

    public Customer(Long customerId, String custName, String custEmail, String custPassword, boolean custIsActive, LocalDateTime custCreatedAt, String custProfileImg) {
        this.customerId = customerId;
        this.custName = custName;
        this.custEmail = custEmail;
        this.custPassword = custPassword;
        this.custIsActive=custIsActive;
        this.custCreatedAt = custCreatedAt;
        this.custProfileImg = custProfileImg;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCustName() {
        return custName;
    }

    public String getCustProfileImg() {
        return custProfileImg;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getCustPassword() {
        return custPassword;
    }

    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    public boolean getCustIsActive(){return this.custIsActive;}

    public void setCustIsActive(boolean CustIsActive) {
        this.custIsActive = CustIsActive;
    }

    public LocalDateTime getCustCreatedAt() {
        return custCreatedAt;
    }

    public void setCustCreatedAt(LocalDateTime custCreatedAt) {
        this.custCreatedAt = custCreatedAt;
    }

    public void setCustProfileImg(String custProfileImg) {
        this.custProfileImg = custProfileImg;
    }
}
