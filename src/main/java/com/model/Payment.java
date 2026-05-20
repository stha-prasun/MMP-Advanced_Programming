package com.model;

// payment model
public class Payment {
    private Long paymentId;
    private int paidAmount;
    private String type;

    public Payment(Long paymentId, int paidAmount, String type) {
        this.paymentId = paymentId;
        this.paidAmount = paidAmount;
        this.type = type;
    }

    public Long getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Long paymentId) {
        this.paymentId = paymentId;
    }

    public int getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(int paidAmount) {
        this.paidAmount = paidAmount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
