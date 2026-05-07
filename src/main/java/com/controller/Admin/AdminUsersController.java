package com.controller.Admin;

import com.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/users")
public class AdminUsersController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/pages/AdminUsers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("customerId");

        // Validation
        if (idParam == null || idParam.trim().isEmpty()) {
            request.setAttribute("error", "Customer ID is required");
            request.getRequestDispatcher("/WEB-INF/pages/AdminUsers.jsp")
                    .forward(request, response);
            return;
        }

        try {
            Long id = Long.parseLong(idParam);

            AdminService service = new AdminService();

            boolean updated = service.updateCustomer(false, id);

            if (updated) {
                response.sendRedirect(request.getContextPath() + "/admin/users");
            } else {
                request.setAttribute("error", "Customer not found");
                request.getRequestDispatcher("/WEB-INF/pages/AdminUsers.jsp")
                        .forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute("error", "Invalid customer ID");
            request.getRequestDispatcher("/WEB-INF/pages/AdminUsers.jsp")
                    .forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
