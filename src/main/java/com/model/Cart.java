package com.model;

import java.util.List;

public class Cart {
    private Long cartId;
    private List<CartItem> cartTotalItems;
    private int cartTotalPrice;



    public Cart(Long cartId, int cartTotalPrice, List<CartItem> cartTotalItems) {
        this.cartId = cartId;
        this.cartTotalPrice=cartTotalPrice;
        this.cartTotalItems = cartTotalItems;
    }

    public Cart() {
    }

    public Long getCartId() {
        return cartId;
    }

    public void setCartId(Long cartId) {
        this.cartId = cartId;
    }


    public List<CartItem> getCartTotalItems() {
        return cartTotalItems;
    }

    public void setCartTotalItems(List<CartItem> cartTotalItems) {
        this.cartTotalItems = this.cartTotalItems;
    }

    public int getCartTotalPrice() {
        return cartTotalPrice;
    }

    public void setCartTotalPrice(int cartTotalPrice) {
        this.cartTotalPrice = cartTotalPrice;
    }
}
