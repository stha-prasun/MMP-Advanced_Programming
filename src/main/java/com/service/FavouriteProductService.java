package com.service;

import com.dao.FavouriteProductDAO;
import com.model.FavouriteProductModel;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// service layer for fav
public class FavouriteProductService {
    // get all fav products
    public List<FavouriteProductModel> getAllFavouriteProducts(String custEmail) throws SQLException {
        List<FavouriteProductModel> products = new ArrayList<>();

        FavouriteProductDAO dao = new FavouriteProductDAO();
        products = dao.getAllFavouriteProducts(custEmail);

        return products;
    }
}
