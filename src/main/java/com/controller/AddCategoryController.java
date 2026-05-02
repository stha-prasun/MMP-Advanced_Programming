package com.controller;

import com.service.CategoryService;
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
                request.setAttribute("error", "Please Enter a Valid name");
                request.getRequestDispatcher("/pages/AddCategory.jsp").forward(request, response);
                return;
            }
            //calling service
            CategoryService service = new CategoryService();
            service.addCategory(categoryName);

            //redirection
            response.sendRedirect(request.getContextPath() + "/admin/category");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
