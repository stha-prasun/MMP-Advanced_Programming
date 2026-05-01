package com.model;

import java.time.LocalDateTime;

public class Seller {
    private Long sellerId;
    private String sellerEmail;
    private String sellerPassword;
    private LocalDateTime createdAt;
    private String sellerName;
    private String sellerLocation;
    private boolean sellerIsActive;
    private String verificationId;

    public Seller(Long sellerId, String sellerEmail, String sellerPassword, String sellName, String sellerLocation, boolean isActive, String verificationId) {
        this.sellerId = sellerId;
        this.sellerEmail = sellerEmail;
        this.sellerPassword = sellerPassword;
        this.sellerName = sellName;
        this.sellerLocation = sellerLocation;
        this.sellerIsActive = isActive;
        this.verificationId = verificationId;
    }

    public Long getSellerId() {
        return sellerId;
    }

    public void setSellerId(Long sellerId) {
        this.sellerId = sellerId;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public String getSellerPassword() {
        return sellerPassword;
    }

    public void setSellerPassword(String sellerPassword) {
        this.sellerPassword = sellerPassword;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getSellerLocation() {
        return sellerLocation;
    }

    public void setSellerLocation(String sellerLocation) {
        this.sellerLocation = sellerLocation;
    }

    public boolean getSellerIsActive() {
        return sellerIsActive;
    }

    public void setSellerIsActive(boolean sellerIsActive) {
        this.sellerIsActive = sellerIsActive;
    }

    public String getVerificationId() {
        return verificationId;
    }

    public void setVerificationId(String verificationId) {
        this.verificationId = verificationId;
    }
}
