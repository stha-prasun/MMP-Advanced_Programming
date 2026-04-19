package com.service;

import com.dao.ProductDAO;
import com.model.enums.Category;

import java.time.LocalDateTime;

public class ProductService {
    public void addSeller(String productName, int price, Category category, LocalDateTime postedAt, String description, String imgUrl) throws Exception {


        ProductDAO dao = new ProductDAO();

        dao.insertProduct(productName, price, category, postedAt, description, imgUrl);
    }
}
