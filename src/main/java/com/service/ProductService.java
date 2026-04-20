package com.service;

import com.dao.ProductDAO;

import java.time.LocalDateTime;

public class ProductService {
    public void addSeller(String productName, int price, String category, LocalDateTime postedAt, String description, String imgUrl) throws Exception {


        ProductDAO dao = new ProductDAO();

        dao.insertProduct(productName, price, category, postedAt, description, imgUrl);
    }
}
