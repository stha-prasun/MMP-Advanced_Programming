package com.controller.Category;

import com.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// This class is a controller that is used to edit the category
@WebServlet("/admin/category/edit")
public class EditCategoryController extends HttpServlet {

    @Override
    // show page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/admin/category");
    }

    @Override
    // edit logic
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            Long catId = Long.parseLong(req.getParameter("catId"));
            String categoryName = req.getParameter("categoryName");

            CategoryService categoryService = new CategoryService();
            categoryService.updateCategory(catId, categoryName);

            resp.sendRedirect(req.getContextPath() + "/admin/category");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}