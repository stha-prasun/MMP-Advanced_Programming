package com.dao;

import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// sql logic for removing favourites
public class RemoveFavouriteDAO {

    // Gest CustomerId
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

    // Check exists
    public boolean isProductAlreadyFavourite(Long favouriteId, Long productId) throws SQLException {

        boolean exists = false;

        String query = "SELECT * FROM favouriteitem WHERE favouriteId = ? AND productId = ?";

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

    // Remove
    public void removeFavouriteItem(Long favouriteId, Long productId) throws SQLException {

        String query = "DELETE FROM favouriteitem WHERE favouriteId = ? AND productId = ?";

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setLong(1, favouriteId);

        ps.setLong(2, productId);

        ps.executeUpdate();

        ps.close();
        conn.close();
    }

    // Decrease
    public void decrementTotalFavourites(Long favouriteId) throws SQLException {

        String query = "UPDATE favourites SET totalFavourites = totalFavourites - 1 WHERE favouriteId = ?";

        Connection conn = DBconfig.getConnection();

        PreparedStatement ps = conn.prepareStatement(query);

        ps.setLong(1, favouriteId);

        ps.executeUpdate();

        ps.close();
        conn.close();
    }
}