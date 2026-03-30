package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;

import com.util.DBconfig;

public class CustomerDAO {

    public void insertCustomer(String custName, String custEmail, String custPassword, LocalDateTime custCreatedAt) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO customer (custName, custEmail, custPassword, custCreatedAt) "
                + "VALUES (?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, custName);
        pst.setString(2, custEmail);
        pst.setString(3, custPassword);
        pst.setTimestamp(4, java.sql.Timestamp.valueOf(custCreatedAt));

        pst.executeUpdate();

        pst.close();
        con.close();
    }
}