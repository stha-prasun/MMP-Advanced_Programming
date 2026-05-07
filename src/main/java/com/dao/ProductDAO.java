package com.dao;

import com.model.Product;
import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public void insertProduct(String productName, int price, String category, LocalDateTime postedAt, String description, String imgUrl) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO product (productName, productPrice, productCategory, productPostedAt, productDescription, productImageUrl) "
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

    public List<Product> getAllProducts() throws Exception {
        List<Product> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        String sql = "SELECT * FROM product ORDER BY postedAt DESC";
        PreparedStatement pst = con.prepareStatement(sql);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Product p = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("productCategory"),
                    rs.getTimestamp("postedAt").toLocalDateTime(),
                    rs.getString("productDescription")
            );

            // Set postedAt separately (since not in constructor)
            p.setPostedAt(rs.getTimestamp("postedAt").toLocalDateTime());

            products.add(p);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }

    public Product getProductById(Long id) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "SELECT * FROM product WHERE productId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, id);
        ResultSet rs = pst.executeQuery();
        if (!rs.next()) return null;
        Product cat = new Product(
                rs.getLong("productId"),
                rs.getString("productName"),
                rs.getInt("productPrice"),
                rs.getString("productImageUrl"),
                rs.getBoolean("productIsSold"),
                rs.getString("productCategory"),
                rs.getTimestamp("postedAt").toLocalDateTime(),
                rs.getString("productDescription")
        );
        rs.close();
        pst.close();
        con.close();
        return cat;
    }
}
