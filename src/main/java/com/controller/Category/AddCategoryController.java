package com.controller.Category;

import com.service.CategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// This class is a controller that is used to that is used to add category
@WebServlet("/admin/category/add")
public class AddCategoryController extends HttpServlet {
    @Override
    // show page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/AddCategory.jsp").forward(request, response);
    }

    @Override
    // add category
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String categoryName=request.getParameter("categoryName");
            if (categoryName==null||categoryName.trim().isEmpty()){
                request.setAttribute("error", "Please Enter a Valid name");
                request.getRequestDispatcher("/WEB-INF/pages/AddCategory.jsp").forward(request, response);
                return;
            }

            if (categoryName.contains("@") || categoryName.contains("$") || categoryName.contains("#")
                    || categoryName.contains("%")|| categoryName.contains("&")|| categoryName.contains("*")){
                request.setAttribute("error", "No Special Characters allowed in Category Name");
                request.getRequestDispatcher("/WEB-INF/pages/AddCategory.jsp").forward(request, response);
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
