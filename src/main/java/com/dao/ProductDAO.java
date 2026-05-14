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
    public void insertProduct(String productName, int price, String category,
                              LocalDateTime postedAt, String description,
                              String imgUrl, Long sellerId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO product (productName, productPrice, categoryId, " +
                "postedAt, productDescription, productImageUrl, sellerId) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";


        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, productName);
        pst.setInt(2, price);
        pst.setString(3, category);
        pst.setTimestamp(4, java.sql.Timestamp.valueOf(postedAt));
        pst.setString(5, description);
        pst.setString(6, imgUrl);
        pst.setLong(7, sellerId);

        pst.executeUpdate();

        pst.close();
        con.close();
    }


    public List<Product> getAllProducts() throws Exception {
        List<Product> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        // JOIN with seller table to get seller name
        String sql = "SELECT p.*, s.sellerName, s.sellerEmail " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "ORDER BY p.postedAt DESC";

        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Product p = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("categoryId"),
                    rs.getTimestamp("postedAt").toLocalDateTime(),
                    rs.getString("productDescription"),
                    rs.getLong("sellerId"),
                    rs.getString("sellerName")
            );

            p.setSellerEmail(rs.getString("sellerEmail"));
            products.add(p);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }


    public Product getProductById(Long id) throws Exception {
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "WHERE p.productId = ?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, id);

        ResultSet rs = pst.executeQuery();

        if (!rs.next()) {
            rs.close();
            pst.close();
            con.close();
            return null;
        }

        Product product = new Product(
                rs.getLong("productId"),
                rs.getString("productName"),
                rs.getInt("productPrice"),
                rs.getString("productImageUrl"),
                rs.getBoolean("productIsSold"),
                rs.getString("productCategory"),
                rs.getTimestamp("postedAt").toLocalDateTime(),
                rs.getString("productDescription"),
                rs.getLong("sellerId"),
                rs.getString("sellerName")
        );

        product.setSellerEmail(rs.getString("sellerEmail"));

        rs.close();
        pst.close();
        con.close();

        return product;
    }


    public void updateProductStatus(Long productId, String status) throws Exception {
        Connection con = DBconfig.getConnection();

        boolean isSold = "APPROVED".equals(status);

        String sql = "UPDATE product SET productIsSold = ? WHERE productId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setBoolean(1, isSold);
        pst.setLong(2, productId);

        pst.executeUpdate();

        pst.close();
        con.close();
    }

    //Will be used in product page to get products that are approved by admin and arent sold
    public List<Product> getAllApprovedUnsoldProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "WHERE p.isApproved = TRUE AND p.productIsSold = FALSE " +
                "ORDER BY p.postedAt DESC";

        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Product p = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("categoryId"),
                    rs.getTimestamp("postedAt").toLocalDateTime(),
                    rs.getString("productDescription"),
                    rs.getLong("sellerId"),
                    rs.getString("sellerName")
            );
            products.add(p);
        }

        rs.close();
        pst.close();
        con.close();
        return products;
    }

    public Product getApprovedUnsoldProductById(Long id) throws Exception {
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "WHERE p.productId = ? AND p.isApproved = TRUE AND p.productIsSold = FALSE";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, id);
        ResultSet rs = pst.executeQuery();

        Product product = null;
        if (rs.next()) {
            product = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("categoryId"),
                    rs.getTimestamp("postedAt").toLocalDateTime(),
                    rs.getString("productDescription"),
                    rs.getLong("sellerId"),
                    rs.getString("sellerName")
            );
        }

        rs.close();
        pst.close();
        con.close();
        return product;
    }

}
