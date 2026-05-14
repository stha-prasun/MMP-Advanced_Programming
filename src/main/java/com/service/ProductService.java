package com.service;

import com.dao.ProductDAO;
import com.model.Product;

import java.time.LocalDateTime;
import java.util.List;

public class ProductService {
    public void addProduct(String productName, int price, String category,
                           LocalDateTime postedAt, String description,
                           String imgUrl, Long sellerId) throws Exception {
        ProductDAO dao = new ProductDAO();
        dao.insertProduct(productName, price, category, postedAt, description, imgUrl, sellerId);
    }

    public List<Product> getAllProducts() throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getAllProducts();
    }

    public Product getProductById(Long id) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getProductById(id);
    }

    public void approveProduct(Long productId) throws Exception {
        ProductDAO dao = new ProductDAO();
        dao.updateProductStatus(productId, "APPROVED");
    }

    public void rejectProduct(Long productId) throws Exception {
        ProductDAO dao = new ProductDAO();
        dao.updateProductStatus(productId, "REJECTED");
    }


    public List<Product> getAvailableProducts() throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getAllApprovedUnsoldProducts();
    }

    public Product getAvailableProductById(Long id) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getApprovedUnsoldProductById(id);
    }
}
