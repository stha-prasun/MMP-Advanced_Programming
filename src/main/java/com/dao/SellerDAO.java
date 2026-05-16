package com.dao;

import com.model.Seller;
import com.util.DBconfig;
import com.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class SellerDAO {
    public void insertSeller(String sellerEmail, String sellerPassword, String sellerName,
                             String sellerLocation, boolean sellerIsActive, String verificationId,
                             LocalDateTime sellerCreatedAt) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO seller (sellerName, sellerEmail, sellerPassword, sellerCreatedAt, " +
                "sellerLocation, sellerIsActive, sellerVerificationId) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

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

        String sql = "SELECT * FROM seller WHERE sellerEmail = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, sellerEmail);
        ResultSet rs = pst.executeQuery();

        if (!rs.next()) {
            rs.close();
            pst.close();
            con.close();
            return null; // email not found
        }

        boolean confirmedPass = PasswordUtil.checkPassword(sellerPassword, rs.getString("sellerPassword"));

        if(!confirmedPass){
            rs.close();
            pst.close();
            con.close();
            return null;
        }

        Seller seller = new Seller(
                rs.getLong("sellerId"),
                rs.getString("sellerName"),
                rs.getString("sellerEmail"),
                rs.getString("sellerPassword"),
                rs.getString("sellerLocation"),
                rs.getBoolean("sellerIsActive"),
                rs.getString("sellerVerificationId")
        );

        rs.close();
        pst.close();
        con.close();
        return seller;
    }

    public List<Seller> getAllSellers() throws Exception {
        Connection con = DBconfig.getConnection();
        List<Seller> sellerList = new ArrayList<>();
        String sql="SELECT * FROM seller";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Seller seller = new Seller(
                    rs.getLong("sellerId"),
                    rs.getString("sellerName"),
                    rs.getString("sellerEmail"),
                    rs.getString("sellerPassword"),
                    rs.getString("sellerLocation"),
                    rs.getBoolean("sellerIsActive"),
                    rs.getString("sellerVerificationId")
            );
            sellerList.add(seller);
        }
        rs.close();
        pst.close();
        con.close();
        return sellerList;
    }

    public void updateSeller(String sellerEmail, String updatedSellerEmail, String sellerName, String sellerPassword) throws SQLException {
        Connection con = DBconfig.getConnection();

        String sql = "UPDATE seller " +
                "SET sellerEmail = ?, " +
                "sellerName = ?, " +
                "sellerPassword = ? " +
                "WHERE sellerEmail = ?";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, updatedSellerEmail);
        pst.setString(2, sellerName);
        pst.setString(3, sellerPassword);
        pst.setString(4, sellerEmail);

        pst.executeUpdate();

        pst.close();
        con.close();
    }

}


