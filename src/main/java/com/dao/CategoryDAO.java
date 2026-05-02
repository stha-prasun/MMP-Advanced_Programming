package com.dao;

import com.model.Category;
import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public void insertCategory(String categoryName) throws Exception {

        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO category (type)"+
                "VALUES (?)";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1,categoryName);

        pst.executeUpdate();
        pst.close();
        con.close();

    }

    public List<Category> getAllCategory() throws Exception{
        Connection con = DBconfig.getConnection();

        List<Category> categoryList = new ArrayList<>();

        String sql = "SELECT * from category";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()){
            Category cat = new Category(
                    rs.getLong("categoryId"),
                    rs.getString("type")
            );
            categoryList.add(cat);
        }
        rs.close();
        pst.close();
        con.close();

        return categoryList;
    }
}
