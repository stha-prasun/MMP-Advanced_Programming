package com.dao;

import com.model.Customer;
import com.model.Seller;
import com.util.DBconfig;
import com.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;

public class SellerDAO {
    public void insertSeller(String sellerEmail, String sellerPassword, String sellerName, String sellerLocation, boolean sellerIsActive, String verificationId, LocalDateTime sellerCreatedAt) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO seller (sellerName, sellerEmail, sellerPassword, sellerCreatedAt, sellerLocation, sellerIsActive, sellerVerificationId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, sellerName);
        pst.setString(2, sellerEmail);
        pst.setString(3, sellerPassword);
        pst.setTimestamp(4, java.sql.Timestamp.valueOf(sellerCreatedAt));
        pst.setString(5, sellerLocation);
        pst.setBoolean(6, sellerIsActive);
        pst.setString(7, verificationId);

        pst.executeUpdate();

        pst.close();
        con.close();
    }
    public Seller getSeller(String sellerEmail, String sellerPassword) throws Exception {
        Connection con = DBconfig.getConnection();



        String sql = "SELECT * FROM seller where sellerEmail = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, sellerEmail);
        ResultSet rs = pst.executeQuery();

        if (!rs.next()) {
            return null; // email not found
        }

        boolean confirmedPass = PasswordUtil.checkPassword(sellerPassword, rs.getString("sellerPassword"));

        if(!confirmedPass){
            return null;

        }
        Seller seller= new Seller(
                rs.getLong("sellerId"),
                rs.getString("sellerName"),
                rs.getString("sellerEmail"),
                rs.getString("sellerPassword"),
                rs.getString("sellerLocation"),
                rs.getBoolean("sellerIsActive"),
                rs.getString("sellerVerificationId")
        );
        pst.close();
        con.close();
        return seller;

    }
}
