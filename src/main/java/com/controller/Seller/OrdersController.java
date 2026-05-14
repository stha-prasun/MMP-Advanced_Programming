package com.controller.Seller;

import java.io.IOException;
import java.util.List;

import com.model.Order;
import com.service.OrderService;
import com.util.CookieUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/seller/orders")
public class OrdersController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //getting email from cookies
        Cookie cookie = CookieUtil.getCookie(request,"Email");
        String sellerEmail = null;
        if (cookie!=null){
            sellerEmail=cookie.getValue();
        }
        else{
            System.out.println("Cookie not there");
        }

        try{
            OrderService orderService = new OrderService();
            List<Order> orderList = orderService.getAllOrderforSeller(sellerEmail);

            request.setAttribute("orderList",orderList);
            request.getRequestDispatcher("/WEB-INF/pages/Orders.jsp").forward(request, response);




        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
}