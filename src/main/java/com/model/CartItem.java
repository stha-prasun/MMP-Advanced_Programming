package com.model;

import java.time.LocalDateTime;

public class CartItem {
    private Long cartItemID;
    private int quantity;


    public CartItem( Long cartItemID, int quantity) {
        this.cartItemID=cartItemID;
        this.quantity = quantity;

    }

    public Long getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(Long cartItemID) {
        this.cartItemID = cartItemID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
