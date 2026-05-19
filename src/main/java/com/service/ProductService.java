package com.service;

import com.dao.ProductDAO;
import com.model.Product;

import java.time.LocalDateTime;
import java.util.List;

public class ProductService {
    public void addProduct(String productName, int price, Long categoryId,
                           LocalDateTime postedAt, String description,
                           String imgUrl, Long sellerId) throws Exception {
        ProductDAO dao = new ProductDAO();
        dao.insertProduct(productName, price, categoryId, postedAt, description, imgUrl, sellerId);
    }

    public List<Product> getAllProducts() throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getAllProducts();
    }

    public Product getProductById(Long id) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getProductById(id);
    }
    //a method that returns a list of products sold by a particular seller
    public List<Product> getProductBySeller(String sellerEmail) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getProductBySeller(sellerEmail);
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

    public List<Product> getAvailableProductsByCategory(String category) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.getApprovedUnsoldProductsByCategory(category);
    }

    public List<Product> searchAvailableProducts(String keyword) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.searchAvailableProducts(keyword);
    }

    // NEW: Search within a specific category
    public List<Product> searchAvailableProductsByCategory(String keyword, String category) throws Exception {
        ProductDAO dao = new ProductDAO();
        return dao.searchAvailableProductsByCategory(keyword, category);
    }

    public void updateProduct(Long productId, String productName, int price,
                              Long categoryId, String description, String imgUrl) throws Exception {
        ProductDAO dao = new ProductDAO();
        dao.updateProduct(productId, productName, price, categoryId, description, imgUrl);
    }

    public void deleteProduct(Long productId) throws Exception {
        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(productId);
    }
}
