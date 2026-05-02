package com.service;

import com.dao.CustomerDAO;

import java.sql.SQLException;

public class AdminService {
    public void updateCustomer(String imgUrl, String custEmail) throws SQLException {
        CustomerDAO dao = new CustomerDAO();

        dao.updateCustomer(imgUrl, custEmail);
        System.out.println("SERVICE CALLED");
    }
}
