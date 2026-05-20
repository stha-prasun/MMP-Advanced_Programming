package com.dao;

import com.model.Customer;
import com.model.Order;
import com.model.OrderItem;
import com.model.Product;
import com.util.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// sql logic for orders
public class OrderDAO {

    // get all orders for seller using email
    public List<Order> getAllOrderforSeller(String sellerEmail) throws Exception {
        List<Order> orderList = new ArrayList<>();
        Connection con = DBconfig.getConnection();

        String getseller = "SELECT sellerId from seller where sellerEmail = ?";
        PreparedStatement sellerPst = con.prepareStatement(getseller);
        sellerPst.setString(1, sellerEmail);
        ResultSet sellerrs = sellerPst.executeQuery();

        Long sellerId;
        if (sellerrs.next()) {
            sellerId = sellerrs.getLong("sellerId");
        } else {
            return orderList;
        }
        sellerrs.close();
        sellerPst.close();

        String getQuery = "SELECT ord.*, ordit.*, prod.*, cust.* " +
                "FROM orders ord " +
                "JOIN orderitem ordit ON ord.orderId = ordit.orderId " +
                "JOIN product prod ON ordit.productId = prod.productId " +
                "JOIN customer cust ON ord.customerId = cust.customerId " +
                "WHERE prod.sellerId = ?";

        PreparedStatement orderPst = con.prepareStatement(getQuery);
        orderPst.setLong(1, sellerId);
        ResultSet orderrs = orderPst.executeQuery();

        while (orderrs.next()) {
            OrderItem orderItem = new OrderItem(
                    orderrs.getLong("orderitemId"),
                    orderrs.getInt("orderTotalPrice"),
                    orderrs.getLong("orderId"),
                    orderrs.getLong("productId")
            );

            Customer customer = new Customer(
                    orderrs.getLong("customerId"),
                    orderrs.getString("custName"),
                    orderrs.getString("custEmail"),
                    orderrs.getString("custPassword"),
                    orderrs.getBoolean("custIsActive"),
                    orderrs.getTimestamp("custCreatedAt").toLocalDateTime(),
                    orderrs.getString("custEmail")
            );

            Product product = new Product(
                    orderrs.getLong("productId"),
                    orderrs.getString("productName"),
                    orderrs.getInt("productPrice"),
                    orderrs.getString("productImageUrl"),
                    orderrs.getBoolean("productIsSold"),
                    orderrs.getTimestamp("postedAt").toLocalDateTime(),
                    orderrs.getString("productDescription")
            );

            Order order = new Order(
                    orderrs.getLong("orderId"),
                    orderrs.getTimestamp("orderedAt").toLocalDateTime(),
                    orderrs.getString("OrderStatus"),
                    orderrs.getString("deliveryLocation"),
                    customer,
                    product,
                    orderItem
            );
            orderList.add(order);
        }

        orderrs.close();
        orderPst.close();
        con.close();
        return orderList;
    }


    // create order
    public Long createOrder(Long customerId, Long cartId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "INSERT INTO orders (orderedAt, orderStatus, cartId, customerId) VALUES (NOW(), 'PENDING', ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setLong(1, cartId);
        ps.setLong(2, customerId);
        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        Long orderId = null;
        if (rs.next()) {
            orderId = rs.getLong(1);
        }
        rs.close();
        ps.close();
        conn.close();
        return orderId;
    }

    // create order item
    public void createOrderItem(Long orderId, Long productId, int orderTotalPrice) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "INSERT INTO orderitem (orderTotalPrice, orderId, productId) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, orderTotalPrice);
        ps.setLong(2, orderId);
        ps.setLong(3, productId);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    // get order by id
    public Order getOrderById(Long orderId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "SELECT * FROM orders WHERE orderId = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, orderId);
        ResultSet rs = ps.executeQuery();

        Order order = null;
        if (rs.next()) {
            order = new Order();
            order.setOrderId(rs.getLong("orderId"));
            order.setOrderedAt(rs.getTimestamp("orderedAt").toLocalDateTime());
            order.setOrderStatus(rs.getString("orderStatus"));
            order.setCartId(rs.getLong("cartId"));
            order.setCustomerId(rs.getLong("customerId"));
        }
        rs.close();
        ps.close();
        conn.close();
        return order;
    }

    // get order item by id
    public List<OrderItem> getOrderItemsByOrderId(Long orderId) throws SQLException {
        List<OrderItem> items = new ArrayList<>();
        Connection conn = DBconfig.getConnection();
        String sql = "SELECT oi.*, p.productName, p.productImageUrl, p.productPrice, s.sellerName " +
                "FROM orderitem oi " +
                "JOIN product p ON oi.productId = p.productId " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "WHERE oi.orderId = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, orderId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            OrderItem item = new OrderItem();
            item.setOrderitemId(rs.getLong("orderitemId"));
            item.setOrderTotalPrice(rs.getInt("orderTotalPrice"));
            item.setOrderId(rs.getLong("orderId"));
            item.setProductId(rs.getLong("productId"));
            item.setProductName(rs.getString("productName"));
            item.setProductPrice(rs.getInt("productPrice"));
            item.setProductImageUrl(rs.getString("productImageUrl"));
            item.setSellerName(rs.getString("sellerName"));
            items.add(item);
        }
        rs.close();
        ps.close();
        conn.close();
        return items;
    }

    // update order status
    public void updateOrderStatus(Long orderId, String status) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "UPDATE orders SET orderStatus = ? WHERE orderId = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, status);
        ps.setLong(2, orderId);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }
}