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
    public void insertProduct(String productName, int price, Long categoryId,
                              LocalDateTime postedAt, String description,
                              String imgUrl, Long sellerId) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO product (productName, productPrice, categoryId, " +
                "postedAt, productDescription, productImageUrl, sellerId) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";


        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, productName);
        pst.setInt(2, price);
        pst.setLong(3, categoryId);
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

        // JOIN with seller and category tables
        String sql = "SELECT p.*, s.sellerName, s.sellerEmail, c.type AS categoryName " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "LEFT JOIN category c ON p.categoryId = c.categoryId " +
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
                    rs.getString("categoryName"),
                    rs.getTimestamp("postedAt").toLocalDateTime(),
                    rs.getString("productDescription"),
                    rs.getLong("sellerId"),
                    rs.getString("sellerName")
            );

            p.setSellerEmail(rs.getString("sellerEmail"));
            p.setApproved(rs.getBoolean("isApproved"));
            products.add(p);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }


    public Product getProductById(Long id) throws Exception {
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail, c.type AS categoryName " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "LEFT JOIN category c ON p.categoryId = c.categoryId " +
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
                rs.getString("categoryName"),
                rs.getTimestamp("postedAt").toLocalDateTime(),
                rs.getString("productDescription"),
                rs.getLong("sellerId"),
                rs.getString("sellerName")
        );

        product.setSellerEmail(rs.getString("sellerEmail"));
        product.setApproved(rs.getBoolean("isApproved"));

        rs.close();
        pst.close();
        con.close();

        return product;
    }
    public List<Product> getProductBySeller(String sellerEmail) throws Exception {
        Connection con = DBconfig.getConnection();
        List<Product> productList = new ArrayList<>();

        String sqlid="SELECT sellerId FROM seller WHERE sellerEmail = ?";
        PreparedStatement idpst = con.prepareStatement(sqlid);
        idpst.setString(1,sellerEmail);
        ResultSet idrs = idpst.executeQuery();
        Long Id;

        if(idrs.next()){
            Id= idrs.getLong("sellerId");
        }else{
            //returns an empty orderlist
            return productList;
        }
        idrs.close();
        idpst.close();


        String sql = "SELECT prod.*, cat.* FROM product prod LEFT JOIN category cat on prod.categoryId=cat.categoryId WHERE sellerId = ?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, Id);

        ResultSet rs = pst.executeQuery();


        while(rs.next()) {
            Product product = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("type"),
                    rs.getTimestamp("postedAt").toLocalDateTime(),
                    rs.getString("productDescription")

            );
            product.setApproved(rs.getBoolean("isApproved"));
            productList.add(product);
        }



        rs.close();
        pst.close();
        con.close();

        return productList;
    }


    public void updateProductStatus(Long productId, String status) throws Exception {
        Connection con = DBconfig.getConnection();

        boolean isApproved = "APPROVED".equals(status);

        String sql = "UPDATE product SET isApproved = ? WHERE productId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setBoolean(1, isApproved);
        pst.setLong(2, productId);

        pst.executeUpdate();

        pst.close();
        con.close();
    }

    //Will be used in product page to get products that are approved by admin and arent sold
    public List<Product> getAllApprovedUnsoldProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail, c.type AS categoryName " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "LEFT JOIN category c ON p.categoryId = c.categoryId " +
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
                    rs.getString("categoryName"),  // ← Changed from categoryId
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

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail, c.type AS categoryName " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "LEFT JOIN category c ON p.categoryId = c.categoryId " +
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
                    rs.getString("categoryName"),  // ← Changed from categoryId
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

    public List<Product> getApprovedUnsoldProductsByCategory(String category) throws Exception {
        List<Product> products = new ArrayList<>();
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail, c.type AS categoryName " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "LEFT JOIN category c ON p.categoryId = c.categoryId " +
                "WHERE p.isApproved = TRUE " +
                "AND p.productIsSold = FALSE " +
                "AND c.type = ? " +
                "ORDER BY p.postedAt DESC";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, category);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Product p = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("categoryName"),
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

    public List<Product> searchAvailableProducts(String keyword) throws Exception {
        List<Product> products = new ArrayList<>();
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail, c.type AS categoryName " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "LEFT JOIN category c ON p.categoryId = c.categoryId " +
                "WHERE p.isApproved = TRUE AND p.productIsSold = FALSE " +
                "AND p.productName LIKE ? " +
                "ORDER BY p.postedAt DESC";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, "%" + keyword + "%");
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Product p = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("categoryName"),
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

    public List<Product> searchAvailableProductsByCategory(String keyword, String category) throws Exception {
        List<Product> products = new ArrayList<>();
        Connection con = DBconfig.getConnection();

        String sql = "SELECT p.*, s.sellerName, s.sellerEmail, c.type AS categoryName " +
                "FROM product p " +
                "LEFT JOIN seller s ON p.sellerId = s.sellerId " +
                "LEFT JOIN category c ON p.categoryId = c.categoryId " +
                "WHERE p.isApproved = TRUE AND p.productIsSold = FALSE " +
                "AND c.type = ? " +
                "AND p.productName LIKE ? " +
                "ORDER BY p.postedAt DESC";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, category);
        pst.setString(2, "%" + keyword + "%");
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            Product p = new Product(
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("categoryName"),
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

    public void markProductAsSold(Long productId) throws Exception {
        Connection conn = DBconfig.getConnection();
        String sql = "UPDATE product SET productIsSold = true WHERE productId = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setLong(1, productId);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public void updateProduct(Long productId, String productName, int price,
                              Long categoryId, String description, String imgUrl) throws Exception {
        Connection con = DBconfig.getConnection();

        String sql = "UPDATE product SET productName = ?, productPrice = ?, categoryId = ?, " +
                "productDescription = ?, productImageUrl = ? WHERE productId = ?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, productName);
        pst.setInt(2, price);
        pst.setLong(3, categoryId);
        pst.setString(4, description);
        pst.setString(5, imgUrl);
        pst.setLong(6, productId);

        pst.executeUpdate();

        pst.close();
        con.close();
    }


    public void deleteProduct(Long productId) throws Exception {
        Connection con = DBconfig.getConnection();

        String sql = "DELETE FROM product WHERE productId = ?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, productId);

        pst.executeUpdate();

        pst.close();
        con.close();
    }

    
}
