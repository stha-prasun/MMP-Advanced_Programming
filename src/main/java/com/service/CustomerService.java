package com.service;

import com.dao.CustomerDAO;
import com.util.PasswordUtil;

import java.time.LocalDateTime;

public class CustomerService {

    public void addCustomer(String custName, String custEmail, String custPassword, LocalDateTime custCreatedAt) throws Exception {

        // Hash the password
        String hashedPassword = PasswordUtil.getHashPassword(custPassword);

        CustomerDAO dao = new CustomerDAO();

        dao.insertCustomer(custName, custEmail, hashedPassword, custCreatedAt);
        System.out.println("SERVICE CALLED");
    }
}