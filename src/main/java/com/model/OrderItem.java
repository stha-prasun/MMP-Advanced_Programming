package com.model;

public class OrderItem {
    Long orderitemId;
    int orderTotalPrice;


//POJO CODE
    public OrderItem(Long orderitemId, int orderTotalPrice){
        this.orderitemId = orderitemId;
        this.orderTotalPrice=orderTotalPrice;
    }

    public Long getOrderitemId() {
        return orderitemId;
    }

    public void setOrderitemId(Long orderitemId) {
        this.orderitemId = orderitemId;
    }

    public int getOrderTotalPrice() {
        return orderTotalPrice;
    }
    public void setOrderTotalPrice(int orderTotalPrice) {
        this.orderTotalPrice = orderTotalPrice;
    }
}
