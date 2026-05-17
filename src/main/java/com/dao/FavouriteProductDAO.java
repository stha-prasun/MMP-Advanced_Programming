package com.dao;

import com.model.FavouriteProductModel;
import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavouriteProductDAO {

    public List<FavouriteProductModel> getAllFavouriteProducts(String custEmail) throws SQLException {

        List<FavouriteProductModel> products = new ArrayList<>();

        Connection con = DBconfig.getConnection();

        // Get customer ID from email
        String getQuery = "SELECT customerId FROM customer WHERE custEmail = ?";

        PreparedStatement customerPst = con.prepareStatement(getQuery);
        customerPst.setString(1, custEmail);

        ResultSet res = customerPst.executeQuery();

        Long customerId = null;

        if (res.next()) {
            customerId = res.getLong("customerId");
        } else {
            return products; // no customer found
        }

        res.close();
        customerPst.close();

        // Get favourite products
        String sql = "SELECT fi.favouriteItemId, f.favouriteId, f.totalFavourites, p.productId, p.productName, p.productPrice, p.productImageUrl,p.productIsSold, c.type AS categoryName FROM favourites f JOIN favouriteitem fi ON f.favouriteId = fi.favouriteId JOIN product p ON fi.productId = p.productId JOIN category c ON p.categoryId = c.categoryId WHERE f.customerId = ?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setLong(1, customerId);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {

            FavouriteProductModel product = new FavouriteProductModel(
                    rs.getLong("favouriteId"),
                    rs.getLong("favouriteItemId"),
                    rs.getInt("totalFavourites"),
                    rs.getLong("productId"),
                    rs.getString("productName"),
                    rs.getInt("productPrice"),
                    rs.getString("productImageUrl"),
                    rs.getBoolean("productIsSold"),
                    rs.getString("categoryName")
            );

            products.add(product);
        }

        rs.close();
        pst.close();
        con.close();

        return products;
    }
}