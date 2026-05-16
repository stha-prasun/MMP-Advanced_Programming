package com.service;

import com.dao.CustomerDAO;
import com.model.Customer;
import com.util.PasswordUtil;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

public class CustomerService {

    public void addCustomer(String custName, String custEmail, String custPassword, LocalDateTime custCreatedAt, String imgUrl) throws Exception {

        // Hash the password
        String hashedPassword = PasswordUtil.getHashPassword(custPassword);

        CustomerDAO dao = new CustomerDAO();

        dao.insertCustomer(custName, custEmail, hashedPassword, custCreatedAt, imgUrl);
        System.out.println("SERVICE CALLED");
    }

    public void updateCustomer(String imgUrl, String custEmail, String updatedCustEmail, String custName, String custPassword) throws SQLException {
        String hashedPassword = PasswordUtil.getHashPassword(custPassword);

        CustomerDAO dao = new CustomerDAO();

        dao.updateCustomer(imgUrl, custEmail, updatedCustEmail, custName, hashedPassword);
        System.out.println("SERVICE CALLED");
    }
    public List<Customer> getAllCustomer() throws Exception {
        CustomerDAO dao = new CustomerDAO();
        return dao.getAllCustomer();
    }
}