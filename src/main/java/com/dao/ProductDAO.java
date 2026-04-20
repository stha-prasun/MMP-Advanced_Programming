package com.dao;

import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;

public class ProductDAO {
    public void insertProduct(String productName, int price, String category, LocalDateTime postedAt, String description, String imgUrl) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO product (productName, price, category, postedAt, description, imgUrl) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, productName);
        pst.setInt(2, price);
        pst.setString(3, category);
        pst.setTimestamp(4, java.sql.Timestamp.valueOf(postedAt));
        pst.setString(5, description);
        pst.setString(6, imgUrl);

        pst.executeUpdate();

        pst.close();
        con.close();
    }
}
