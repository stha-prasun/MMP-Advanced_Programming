package com.service;

import com.dao.AddFavouriteDAO;
import com.model.Favourite;
import com.model.FavouriteItem;

import java.sql.SQLException;

public class AddFavouriteService {

    public void addToFavourite(Long productId, String custEmail) throws SQLException {

        AddFavouriteDAO dao = new AddFavouriteDAO();
        // GET CUSTOMER ID
        Long customerId = dao.getCustomerIdByEmail(custEmail);
        // GET FAVOURITE ID
        Long favouriteId = dao.getFavouriteIdByCustomerId(customerId);

        // CREATE FAVOURITES IF NOT EXISTS
        if (favouriteId == null) {

            Favourite favourite = new Favourite();

            favourite.setCustomerId(customerId);

            favourite.setTotalFavourites(0);

            dao.createFavourite(favourite);

            // GET AGAIN AFTER INSERT
            favouriteId = dao.getFavouriteIdByCustomerId(customerId);
        }

        // PREVENT DUPLICATE
        boolean alreadyExists = dao.isProductAlreadyFavourite(favouriteId, productId);

        if (alreadyExists) {
            return;
        }

        // INSERT ITEM
        FavouriteItem item = new FavouriteItem();

        item.setFavouriteId(favouriteId);

        item.setProductId(productId);

        dao.addFavouriteItem(item);

        // UPDATE TOTAL
        dao.incrementTotalFavourites(favouriteId);

    }
}
