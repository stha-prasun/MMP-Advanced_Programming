package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;


import com.model.Customer;
import com.util.DBconfig;
import com.util.PasswordUtil;

public class CustomerDAO {

    public void insertCustomer(String custName, String custEmail, String custPassword, LocalDateTime custCreatedAt, String imgUrl) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO customer (custName, custEmail, custPassword, custCreatedAt, custProfileImg) "
                + "VALUES (?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, custName);
        pst.setString(2, custEmail);
        pst.setString(3, custPassword);
        pst.setTimestamp(4, java.sql.Timestamp.valueOf(custCreatedAt));
        pst.setString(5, imgUrl);

        pst.executeUpdate();

        pst.close();
        con.close();
    }
    //logic for getCustomer: takes in custEmail and password from the front end user(service), checks if the email exists, if it does, checks if password matches
    // then creates a Customer Object with the database's email's information which will be used for the profile later on.
    // thus this function has a return type of customer
    // If this logic is invalid/wrong please let me know :)
    public Customer getCustomer(String custEmail,String custPassword) throws Exception {
        Connection con = DBconfig.getConnection();



        String sql = "SELECT * FROM customer where custEmail = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, custEmail);
        ResultSet rs = pst.executeQuery();

        if (!rs.next()) {
            return null; // email not found
        }

        String storedpass = rs.getString("custPassword");


        boolean confirmedPass = PasswordUtil.checkPassword(custPassword,storedpass );

        if(!confirmedPass){
            return null;

        }
        Customer cust= new Customer(
                rs.getLong("customerId"),
                rs.getString("custName"),
                rs.getString("custEmail"),
                rs.getString("custPassword"),
                rs.getTimestamp("custCreatedAt").toLocalDateTime(),
                rs.getString("custProfileImg")
        );
        pst.close();
        con.close();
        return cust;
    }

    public void updateCustomer(String imgUrl, String custEmail) throws SQLException {
        Connection con = DBconfig.getConnection();

        String sql = "UPDATE customer " +
                "SET custProfileImg = ? " +
                "WHERE custEmail = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, imgUrl);
        pst.setString(2, custEmail);

        pst.executeUpdate();

        pst.close();
        con.close();

    }
}