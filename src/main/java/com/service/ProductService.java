package com.service;

import com.dao.ProductDAO;
import com.model.Product;
import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.util.List;

public class ProductService {
    public void addSeller(String productName, int price, String category, LocalDateTime postedAt, String description, String imgUrl) throws Exception {


        ProductDAO dao = new ProductDAO();

        dao.insertProduct(productName, price, category, postedAt, description, imgUrl);
    }

    public List<Product> getProducts() throws Exception {

        ProductDAO dao = new ProductDAO();

        return dao.getAllProducts();

    }
}
