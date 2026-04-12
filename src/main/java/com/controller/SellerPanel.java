package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/seller/dashboard")
public class SellerPanel extends HttpServlet {

    public SellerPanel() {
        super();
    }

    @Override
    public void init() throws ServletException {
        // Initialization code here
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/SellerPanel.jsp").forward(request, response);
    }
}