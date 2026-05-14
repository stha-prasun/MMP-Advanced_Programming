package com.service;

import com.dao.OrderDAO;
import com.model.Order;

import java.util.ArrayList;
import java.util.List;

public class OrderService {
    public List<Order> getAllOrderforSeller(String sellerEmail) throws Exception {
        List<Order> orderList=new ArrayList<>();
        OrderDAO dao = new OrderDAO();
        orderList=dao.getAllOrderforSeller(sellerEmail);
        return orderList;
    }
}
