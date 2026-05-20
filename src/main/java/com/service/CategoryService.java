package com.service;

import com.dao.CategoryDAO;
import com.model.Category;

import java.util.List;

// service layer for category
public class CategoryService {

    // add category
    public void addCategory(String categoryName) throws Exception {
        CategoryDAO dao = new CategoryDAO();
        dao.insertCategory(categoryName);
    }

    // get all category
    public List<Category> getAllCategory() throws Exception {
        CategoryDAO dao = new CategoryDAO();
        return dao.getAllCategory();
    }

    // update category
    public void updateCategory(Long id, String newName) throws Exception {
        CategoryDAO dao = new CategoryDAO();
        dao.updateCategory(id, newName);
    }

    // delete category
    public void deleteCategory(Long id) throws Exception {
        CategoryDAO dao = new CategoryDAO();
        dao.deleteCategory(id);
    }

    // get product count
    public int getProductCount(Long id) throws Exception {
        CategoryDAO dao = new CategoryDAO();
        return dao.getProductCount(id);
    }
}