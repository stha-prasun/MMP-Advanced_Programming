package com.service;

import java.sql.SQLException;

import com.dao.RemoveFavouriteDAO;

public class RemoveFavouriteService {

    public void removeFavourite(Long productId, String custEmail) throws SQLException {

        RemoveFavouriteDAO dao = new RemoveFavouriteDAO();

        // GET CUSTOMER ID
        Long customerId = dao.getCustomerIdByEmail(custEmail);

        // GET FAVOURITE ID
        Long favouriteId = dao.getFavouriteIdByCustomerId(customerId);

        if (favouriteId == null) {
            return;
        }

        // CHECK IF PRODUCT EXISTS
        boolean exists = dao.isProductAlreadyFavourite(favouriteId, productId);

        if (!exists) {
            return;
        }

        // DELETE ITEM
        dao.removeFavouriteItem(favouriteId, productId);

        // DECREMENT TOTAL
        dao.decrementTotalFavourites(favouriteId);
    }
}