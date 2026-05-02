package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/admin/category/add")
public class AddCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/AddCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String categoryName=request.getParameter("categoryName");
            if (categoryName==null||categoryName.trim().isEmpty()){
                request.setAttribute("error", "All fields are required");
                request.getRequestDispatcher("/pages/Register.jsp").forward(request, response);
                return;
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
