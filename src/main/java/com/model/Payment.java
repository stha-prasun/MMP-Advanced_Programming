package com.model;

public class Payment {
    private Long paymentId;
    private int paymentAmount;
    private String type;

    public Payment(Long paymentId, int paymentAmount, String type) {
        this.paymentId = paymentId;
        this.paymentAmount = paymentAmount;
        this.type = type;
    }

    public Long getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Long paymentId) {
        this.paymentId = paymentId;
    }

    public int getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(int paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
