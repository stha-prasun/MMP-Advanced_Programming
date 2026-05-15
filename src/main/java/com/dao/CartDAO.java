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

    // Get cart by customer email with all cart items
    public Cart getCartByCustomerEmail(String custEmail) throws SQLException {

        Connection con = DBconfig.getConnection();

        // Get customer ID from email
        String getQuery = "SELECT customerId FROM customer WHERE custEmail = ?";
        PreparedStatement customerPst = con.prepareStatement(getQuery);
        customerPst.setString(1, custEmail);
        ResultSet res = customerPst.executeQuery();

        Long customerId = null;
        if (res.next()) {
            customerId = res.getLong("customerId");
        } else {
            res.close();
            customerPst.close();
            con.close();
            return null; // no customer found
        }
        res.close();
        customerPst.close();

        // Get cart for customer
        String cartQuery = "SELECT * FROM cart WHERE customerId = ?";
        PreparedStatement cartPst = con.prepareStatement(cartQuery);
        cartPst.setLong(1, customerId);
        ResultSet cartRs = cartPst.executeQuery();

        Cart cart = null;
        if (cartRs.next()) {
            cart = new Cart();
            cart.setCartId(cartRs.getLong("cartId"));
            cart.setCustomerId(customerId);
        } else {
            cartRs.close();
            cartPst.close();
            con.close();
            return null; // no cart found
        }
        cartRs.close();
        cartPst.close();
        con.close();

        // Clean up sold items before fetching
        removeSoldItemsFromCart(cart.getCartId());

        // Get cart items (only unsold products)
        con = DBconfig.getConnection();
        List<CartItem> cartItems = getCartItemsByCartId(cart.getCartId(), con);
        cart.setCartTotalItems(cartItems);

        // Update and get cart total price
        updateCartTotalPrice(cart.getCartId(), con);
        cart.setCartTotalPrice(getCartTotalPrice(cart.getCartId(), con));

        con.close();
        return cart;
    }

    // Get cart items by cart ID - only returns unsold products
    private List<CartItem> getCartItemsByCartId(Long cartId, Connection con) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();

        String sql = "SELECT ci.cartItemID, ci.quantity, ci.cartId, ci.productId, " +
                "p.productName, p.productPrice, p.productImageUrl, " +
                "s.sellerName " +
                "FROM cart_item ci " +
                "JOIN product p ON ci.productId = p.productId " +
                "JOIN seller s ON p.sellerId = s.sellerId " +
                "WHERE ci.cartId = ? AND p.productIsSold = false";

        PreparedStatement pst = con.prepareStatement(sql);
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
        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO cart (cartTotalPrice, customerId) VALUES (0, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, customerId);
        pst.executeUpdate();

        pst.close();
        con.close();
    }

    // Check if product already exists in cart
    public boolean isProductInCart(Long cartId, Long productId) throws SQLException {
        Connection con = DBconfig.getConnection();

        String sql = "SELECT COUNT(*) FROM cart_item WHERE cartId = ? AND productId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.setLong(2, productId);
        ResultSet rs = pst.executeQuery();

        boolean exists = false;
        if (rs.next()) {
            exists = rs.getInt(1) > 0;
        }

        rs.close();
        pst.close();
        con.close();
        return exists;
    }

    // Get available stock for a product (isSold status)
    public boolean isProductAvailable(Long productId) throws SQLException {
        Connection con = DBconfig.getConnection();

        String sql = "SELECT productIsSold FROM product WHERE productId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, productId);
        ResultSet rs = pst.executeQuery();

        boolean available = false;
        if (rs.next()) {
            available = !rs.getBoolean("productIsSold");
        }

        rs.close();
        pst.close();
        con.close();
        return available;
    }

    // Add item to cart - single unique items only
    public String addCartItem(Long cartId, Long productId) throws SQLException {
        Connection con = DBconfig.getConnection();

        // Check if product already in cart
        if (isProductInCart(cartId, productId)) {
            con.close();
            return "This product is already in your cart";
        }

        // Check if product is still available (not sold)
        if (!isProductAvailable(productId)) {
            con.close();
            return "Sorry, this product is no longer available";
        }

        String sql = "INSERT INTO cart_item (quantity, cartId, productId) VALUES (1, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.setLong(2, productId);
        pst.executeUpdate();

        pst.close();

        // Update cart total price
        updateCartTotalPrice(cartId, con);

        con.close();
        return "success";
    }

    // Remove item from cart
    public void removeCartItem(Long cartItemId, Long cartId) throws SQLException {
        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM cart_item WHERE cartItemID = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, cartItemId);
        pst.executeUpdate();

        pst.close();

        // Update cart total price
        updateCartTotalPrice(cartId, con);

        con.close();
    }

    // Clean up sold items from cart
    public void removeSoldItemsFromCart(Long cartId) throws SQLException {
        Connection con = DBconfig.getConnection();

        String sql = "DELETE ci FROM cart_item ci " +
                "JOIN product p ON ci.productId = p.productId " +
                "WHERE ci.cartId = ? AND p.productIsSold = true";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.executeUpdate();

        pst.close();
        con.close();
    }

    // Update cart total price
    private void updateCartTotalPrice(Long cartId, Connection con) throws SQLException {
        String sql = "UPDATE cart SET cartTotalPrice = " +
                "(SELECT COALESCE(SUM(ci.quantity * p.productPrice), 0) " +
                "FROM cart_item ci " +
                "JOIN product p ON ci.productId = p.productId " +
                "WHERE ci.cartId = ? AND p.productIsSold = false) " +
                "WHERE cartId = ?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, cartId);
        pst.setLong(2, cartId);
        pst.executeUpdate();
        pst.close();
    }

    // Helper to get cart total
    private int getCartTotalPrice(Long cartId, Connection con) throws SQLException {
        String sql = "SELECT cartTotalPrice FROM cart WHERE cartId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
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
}