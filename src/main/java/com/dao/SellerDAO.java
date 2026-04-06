package com.dao;

import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;

public class SellerDAO {
    public void insertSeller(String sellerEmail, String sellerPassword, String sellerName, String sellerLocation, String sellerIsActive, Long verificationId, LocalDateTime sellerCreatedAt) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO customer (sellerName, sellerEmail, sellerPassword, sellerCreatedAt, sellerLocation, sellerIsActive, verificationId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, sellerName);
        pst.setString(2, sellerEmail);
        pst.setString(3, sellerPassword);
        pst.setTimestamp(4, java.sql.Timestamp.valueOf(sellerCreatedAt));
        pst.setString(5, sellerLocation);
        pst.setString(6, sellerIsActive);
        pst.setLong(7, verificationId);

        pst.executeUpdate();

        pst.close();
        con.close();
    }
}
