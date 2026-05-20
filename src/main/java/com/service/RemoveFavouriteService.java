package com.service;

import java.sql.SQLException;

import com.dao.RemoveFavouriteDAO;

// service layer for removing favourite
public class RemoveFavouriteService {

    public void removeFavourite(Long productId, String custEmail) throws SQLException {

        RemoveFavouriteDAO dao = new RemoveFavouriteDAO();

        // Get customer id
        Long customerId = dao.getCustomerIdByEmail(custEmail);

        Long favouriteId = dao.getFavouriteIdByCustomerId(customerId);

        if (favouriteId == null) {
            return;
        }

        boolean exists = dao.isProductAlreadyFavourite(favouriteId, productId);

        if (!exists) {
            return;
        }

        dao.removeFavouriteItem(favouriteId, productId);

        dao.decrementTotalFavourites(favouriteId);
    }
}