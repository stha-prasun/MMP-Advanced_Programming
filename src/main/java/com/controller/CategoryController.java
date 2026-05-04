package com.controller;

import com.model.Category;
import com.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/admin/category")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{
            CategoryService categoryService = new CategoryService();
            List<Category> categoryList=categoryService.getAllCategory();

            // Set in Request Scope for EL access
            request.setAttribute("categories", categoryList);
            // Forward to JSP
            request.getRequestDispatcher("/pages/Category.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{

            String idParam = request.getParameter("catId");

            Long id = Long.parseLong(idParam);

            CategoryService categoryService = new CategoryService();
            categoryService.deleteCategory(id);

            List<Category> categoryList = categoryService.getAllCategory();

            request.setAttribute("categories", categoryList);

            request.getRequestDispatcher("/pages/Category.jsp").forward(request, response);
            // Forward to JSP
            request.getRequestDispatcher("/pages/Category.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong");
            throw new RuntimeException(e);
        }


    }

}


