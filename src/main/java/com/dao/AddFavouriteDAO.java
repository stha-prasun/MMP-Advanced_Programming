package com.dao;

import com.model.Favourite;
import com.model.FavouriteItem;
import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddFavouriteDAO {
    // Get CustomerId By Email
    public Long getCustomerIdByEmail(String email) throws SQLException {

        Long customerId = null;

        String query = "SELECT customerId FROM customer WHERE custEmail = ?";

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            customerId = rs.getLong("customerId");
        }

        rs.close();

        ps.close();

        conn.close();

        return customerId;
    }

    // Get FavouriteId
    public Long getFavouriteIdByCustomerId(Long customerId) throws SQLException {

        Long favouriteId = null;

        String query = "SELECT favouriteId FROM favourites WHERE customerId = ?";

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setLong(1, customerId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            favouriteId = rs.getLong("favouriteId");
        }

        rs.close();

        ps.close();

        conn.close();

        return favouriteId;
    }

    // Create Favourite
    public void createFavourite(Favourite favourite) throws SQLException {

        String query = "INSERT INTO favourites(totalFavourites, customerId) VALUES(?, ?)";

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setInt(1, favourite.getTotalFavourites());

        ps.setLong(2, favourite.getCustomerId());

        ps.executeUpdate();

        ps.close();

        conn.close();
    }

    // Check Duplicate
    public boolean isProductAlreadyFavourite(Long favouriteId, Long productId) throws SQLException {

        boolean exists = false;

        String query = "SELECT * FROM favourite_item WHERE favouriteId = ? AND productId = ?";

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setLong(1, favouriteId);

        ps.setLong(2, productId);

        ResultSet rs = ps.executeQuery();

        exists = rs.next();

        rs.close();

        ps.close();

        conn.close();

        return exists;
    }

    // Insert
    public void addFavouriteItem(FavouriteItem item) throws SQLException {

        String query = "INSERT INTO favourite_item(favouriteId, productId) VALUES(?, ?)";

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setLong(1, item.getFavouriteId());

        ps.setLong(2, item.getProductId());

        ps.executeUpdate();

        ps.close();

        conn.close();
    }

    // Update
    public void incrementTotalFavourites(Long favouriteId) throws SQLException {

        String query = "UPDATE favourites SET totalFavourites = totalFavourites + 1 WHERE favouriteId = ?" ;

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setLong(1, favouriteId);

        ps.executeUpdate();

        ps.close();

        conn.close();
    }
}
