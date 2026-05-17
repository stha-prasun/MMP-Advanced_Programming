package com.service;

import com.dao.CartDAO;
import com.model.Cart;

import java.sql.SQLException;

public class CartService {

    private CartDAO cartDAO;

    public CartService() {
        this.cartDAO = new CartDAO();
    }

    // Get cart for a customer by email
    public Cart getCartByCustomerEmail(String custEmail) throws SQLException {
        return cartDAO.getCartByCustomerEmail(custEmail);
    }

    // Get existing cart or create one if it doesn't exist
    public Cart getOrCreateCartByCustomerEmail(String custEmail) throws SQLException {
        Cart cart = cartDAO.getCartByCustomerEmail(custEmail);
        if (cart == null) {
            cartDAO.createCartByEmail(custEmail);
            cart = cartDAO.getCartByCustomerEmail(custEmail);
        }
        return cart;
    }

    // Create cart for customer
    public void createCartForCustomer(String customerEmail) throws SQLException {
        cartDAO.createCartByEmail(customerEmail);
    }

    // Add item to cart
    public String addItemToCart(Long cartId, Long productId) throws SQLException {
        return cartDAO.addCartItem(cartId, productId);
    }

    // Remove item from cart
    public void removeItemFromCart(Long cartItemId, Long cartId) throws SQLException {
        cartDAO.removeCartItem(cartItemId, cartId);
    }

    // Check if product is in cart
    public boolean isProductInCart(Long cartId, Long productId) throws SQLException {
        return cartDAO.isProductInCart(cartId, productId);
    }

    // Check if product is available
    public boolean isProductAvailable(Long productId) throws SQLException {
        return cartDAO.isProductAvailable(productId);
    }
}