package com.service;

import com.dao.OrderDAO;
import com.model.Order;

import java.util.ArrayList;
import java.util.List;

public class OrderService {
    public List<Order> getAllOrderforSeller(String sellerEmail) throws Exception {
        List<Order> orderList=new ArrayList<>();
        OrderDAO dao = new OrderDAO();
        System.out.println("before getting orders");
        orderList=dao.getAllOrderforSeller(sellerEmail);
        System.out.println("after getting orders");
        System.out.println(orderList);
        return orderList;
    }
}
