package com.service;

import com.dao.CategoryDAO;
import com.model.Category;

import java.util.List;

public class CategoryService {
    public void addCategory(String categoryName) throws Exception {
        CategoryDAO dao = new CategoryDAO();
        dao.insertCategory(categoryName);
    }

    public List<Category> getAllCategory() throws Exception{
        CategoryDAO dao = new CategoryDAO();


        return dao.getAllCategory();
    }

    public Category getCategoryById(Long Id) throws Exception{
        CategoryDAO dao = new CategoryDAO();

        return dao.getCategory(Id);
    }
}
