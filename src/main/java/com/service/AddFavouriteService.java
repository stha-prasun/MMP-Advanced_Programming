package com.service;

import com.dao.AddFavouriteDAO;
import com.model.Favourite;
import com.model.FavouriteItem;

import java.sql.SQLException;

// service layer for adding favourites
public class AddFavouriteService {

    // add favourite
    public void addToFavourite(Long productId, String custEmail) throws SQLException {

        AddFavouriteDAO dao = new AddFavouriteDAO();
        // Get customer id
        Long customerId = dao.getCustomerIdByEmail(custEmail);
        // Get favourite id
        Long favouriteId = dao.getFavouriteIdByCustomerId(customerId);

        if (favouriteId == null) {

            Favourite favourite = new Favourite();

            favourite.setCustomerId(customerId);

            favourite.setTotalFavourites(0);

            dao.createFavourite(favourite);

            // get again
            favouriteId = dao.getFavouriteIdByCustomerId(customerId);
        }

        // duplicate
        boolean alreadyExists = dao.isProductAlreadyFavourite(favouriteId, productId);

        if (alreadyExists) {
            return;
        }

        FavouriteItem item = new FavouriteItem();

        item.setFavouriteId(favouriteId);

        item.setCustomerId(customerId);

        item.setProductId(productId);

        dao.addFavouriteItem(item);

        dao.incrementTotalFavourites(favouriteId);

    }
}
