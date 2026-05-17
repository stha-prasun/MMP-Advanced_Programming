package com.dao;

import com.model.Cart;
import com.model.CartItem;
import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    // Get customer ID by email
    public Long getCustomerIdByEmail(String custEmail) throws SQLException {
        Long customerId = null;
        String query = "SELECT customerId FROM customer WHERE custEmail = ?";

        Connection conn = DBconfig.getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, custEmail);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            customerId = rs.getLong("customerId");
        }

        rs.close();
        ps.close();
        conn.close();
        return customerId;
    }

    // Get cart by customer ID
    public Cart getCartByCustomerId(Long customerId) throws SQLException {
        Cart cart = null;
        String sql = "SELECT * FROM cart WHERE customerId = ?";

        Connection conn = DBconfig.getConnection();
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, customerId);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            cart = new Cart();
            cart.setCartId(rs.getLong("cartId"));
            cart.setCustomerId(customerId);
        }

        rs.close();
        pst.close();
        conn.close();
        return cart;
    }

    // Get full cart by customer email (items + totals)
    public Cart getCartByCustomerEmail(String custEmail) throws SQLException {
        Long customerId = getCustomerIdByEmail(custEmail);
        if (customerId == null) {
            return null;
        }

        Cart cart = getCartByCustomerId(customerId);
        if (cart == null) {
            return null;
        }

        // Clean up sold items and refresh totals under one connection
        Connection conn = DBconfig.getConnection();
        try {
            removeSoldItemsFromCart(cart.getCartId(), conn);

            List<CartItem> cartItems = getCartItemsByCartId(cart.getCartId(), conn);
            cart.setCartTotalItems(cartItems);

            updateCartTotalPrice(cart.getCartId(), conn);
            cart.setCartTotalPrice(getCartTotalPrice(cart.getCartId(), conn));
        } finally {
            conn.close();
        }
        return cart;
    }

    // Get cart items by cart ID (unsold products only)
    private List<CartItem> getCartItemsByCartId(Long cartId, Connection conn) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();

        String sql = "SELECT ci.cartItemID, ci.quantity, ci.cartId, ci.productId, " +
                "p.productName, p.productPrice, p.productImageUrl, s.sellerName " +
                "FROM cartItem ci " +
                "JOIN product p ON ci.productId = p.productId " +
                "JOIN seller s ON p.sellerId = s.sellerId " +
                "WHERE ci.cartId = ? AND p.productIsSold = false";

        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, cartId);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            CartItem item = new CartItem(
                    rs.getLong("cartItemID"),
                    rs.getInt("quantity"),
                    rs.getLong("cartId"),
                    rs.getLong("productId")
            );
            item.setProductName(rs.getString("productName"));
            item.setProductPrice(rs.getInt("productPrice"));
            item.setProductImageUrl(rs.getString("productImageUrl"));
            item.setSellerName(rs.getString("sellerName"));

            cartItems.add(item);
        }

        rs.close();
        pst.close();
        return cartItems;
    }

    // Create a new cart for customer
    public void createCart(Long customerId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "INSERT INTO cart (cartTotalPrice, customerId) VALUES (0, ?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, customerId);
        pst.executeUpdate();
        pst.close();
        conn.close();
    }

    // Create cart by customer email
    public void createCartByEmail(String customerEmail) throws SQLException {
        Long customerId = getCustomerIdByEmail(customerEmail);
        if (customerId == null) {
            throw new SQLException("Customer not found with email: " + customerEmail);
        }
        createCart(customerId);
    }

    // Check if product already exists in cart
    public boolean isProductInCart(Long cartId, Long productId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "SELECT COUNT(*) FROM cartItem WHERE cartId = ? AND productId = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.setLong(2, productId);
        ResultSet rs = pst.executeQuery();

        boolean exists = false;
        if (rs.next()) {
            exists = rs.getInt(1) > 0;
        }

        rs.close();
        pst.close();
        conn.close();
        return exists;
    }

    // Check if product is available (not sold)
    public boolean isProductAvailable(Long productId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "SELECT productIsSold FROM product WHERE productId = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, productId);
        ResultSet rs = pst.executeQuery();

        boolean available = false;
        if (rs.next()) {
            available = !rs.getBoolean("productIsSold");
        }

        rs.close();
        pst.close();
        conn.close();
        return available;
    }

    // Add item to cart
    public String addCartItem(Long cartId, Long productId) throws SQLException {
        if (isProductInCart(cartId, productId)) {
            return "This product is already in your cart";
        }

        if (!isProductAvailable(productId)) {
            return "Sorry, this product is no longer available";
        }

        Connection conn = DBconfig.getConnection();
        String sql = "INSERT INTO cartItem (quantity, cartId, productId) VALUES (1, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.setLong(2, productId);
        pst.executeUpdate();
        pst.close();

        updateCartTotalPrice(cartId, conn);
        conn.close();
        return "success";
    }

    // Remove item from cart
    public void removeCartItem(Long cartItemId, Long cartId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "DELETE FROM cartItem WHERE cartItemID = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, cartItemId);
        pst.executeUpdate();
        pst.close();

        updateCartTotalPrice(cartId, conn);
        conn.close();
    }

    // Clean up sold items from cart (public self-contained version)
    public void removeSoldItemsFromCart(Long cartId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        removeSoldItemsFromCart(cartId, conn);
        conn.close();
    }

    // Clean up sold items (internal reuse version)
    private void removeSoldItemsFromCart(Long cartId, Connection conn) throws SQLException {
        String sql = "DELETE ci FROM cartItem ci " +
                "JOIN product p ON ci.productId = p.productId " +
                "WHERE ci.cartId = ? AND p.productIsSold = true";

        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.executeUpdate();
        pst.close();
    }

    // Update cart total price
    private void updateCartTotalPrice(Long cartId, Connection conn) throws SQLException {
        String sql = "UPDATE cart SET cartTotalPrice = " +
                "(SELECT COALESCE(SUM(ci.quantity * p.productPrice), 0) " +
                "FROM cartItem ci " +
                "JOIN product p ON ci.productId = p.productId " +
                "WHERE ci.cartId = ? AND p.productIsSold = false) " +
                "WHERE cartId = ?";

        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.setLong(2, cartId);
        pst.executeUpdate();
        pst.close();
    }

    // Get cart total price
    private int getCartTotalPrice(Long cartId, Connection conn) throws SQLException {
        String sql = "SELECT cartTotalPrice FROM cart WHERE cartId = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setLong(1, cartId);
        ResultSet rs = pst.executeQuery();

        int total = 0;
        if (rs.next()) {
            total = rs.getInt("cartTotalPrice");
        }

        rs.close();
        pst.close();
        return total;
    }

    public void clearCartItems(Long cartId) throws SQLException {
        Connection conn = DBconfig.getConnection();

        String deleteSql = "DELETE FROM cartItem WHERE cartId = ?";
        PreparedStatement deletePs = conn.prepareStatement(deleteSql);
        deletePs.setLong(1, cartId);
        deletePs.executeUpdate();
        deletePs.close();

        String updateSql = "UPDATE cart SET cartTotalPrice = 0 WHERE cartId = ?";
        PreparedStatement updatePs = conn.prepareStatement(updateSql);
        updatePs.setLong(1, cartId);
        updatePs.executeUpdate();
        updatePs.close();

        conn.close();
    }
}