package com.dao;

import com.model.Customer;
import com.model.Order;
import com.model.OrderItem;
import com.model.Product;
import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    //a method that extracts all the orders that a seller has received from various different customers
    public List<Order> getAllOrderforSeller(String sellerEmail) throws Exception {
        List<Order> orderList = new ArrayList<>();
        Connection con = DBconfig.getConnection();


        String getseller = "SELECT sellerId from seller where sellerEmail = ?";
        PreparedStatement sellerPst = con.prepareStatement(getseller);
        sellerPst.setString(1, sellerEmail);
        ResultSet sellerrs= sellerPst.executeQuery();

        Long sellerId;

        if(sellerrs.next()){
            sellerId= sellerrs.getLong("sellerId");
        }else{
            //returns an empty orderlist
            return orderList;
        }
        sellerrs.close();
        sellerPst.close();


        //After Seller ID received, joining table according to id
        String getQuery = "SELECT ord.*, ordit.*, prod.*, cust.* "+
                        "FROM orders ord "+
                        "JOIN orderitem ordit ON ord.orderId = ordit.orderId "+
                        "JOIN product prod ON ordit.productId = prod.productId "+
                        "JOIN customer cust ON ord.customerId = cust.customerId "+
                        "WHERE prod.sellerId = ?";

        PreparedStatement orderPst = con.prepareStatement(getQuery);
        orderPst.setLong(1, sellerId);
        ResultSet orderrs=orderPst.executeQuery();

        while(orderrs.next()){
            //creating Orderitem object
            OrderItem orderItem = new OrderItem(
                    orderrs.getLong("orderitemId"),
                    orderrs.getInt("orderTotalPrice")
            );
            //creating a Customer object
            Customer customer = new Customer(
                    orderrs.getLong("customerId"),
                    orderrs.getString("custName"),
                    orderrs.getString("custEmail"),
                    orderrs.getString("custPassword"),
                    orderrs.getBoolean("custIsActive"),
                    orderrs.getTimestamp("custCreatedAt").toLocalDateTime(),
                    orderrs.getString("custEmail")
            );
            //creating Product Object that the seller sold
            Product product = new Product(
                    orderrs.getLong("productId"),
                    orderrs.getString("productName"),
                    orderrs.getInt("productPrice"),
                    orderrs.getString("productImageIrl"),
                    orderrs.getBoolean("productIsSold"),
                    orderrs.getTimestamp("postedAt").toLocalDateTime(),
                    orderrs.getString("productDescription")

            );


            Order order = new Order(
                    orderrs.getLong("orderId"),
                    orderrs.getTimestamp("orderedAt").toLocalDateTime(),
                    orderrs.getString("OrderStatus"),
                    customer,
                    product,
                    orderItem
            );
            orderList.add(order);
        }
        //closing all the connections done above
        orderrs.close();
        orderPst.close();
        con.close();
        return orderList;


    }
}
