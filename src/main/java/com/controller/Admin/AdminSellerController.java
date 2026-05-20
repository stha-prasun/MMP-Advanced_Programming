package com.controller.Admin;

import java.io.IOException;
import java.sql.SQLException;

import com.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// This class is a controller that is used to get the seller details and deactivate seller's account
@WebServlet("/admin/seller")
public class AdminSellerController extends HttpServlet {

    @Override
    // get details
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            AdminService service = new AdminService();

            request.setAttribute("sellers", service.getAllSellers());

            request.getRequestDispatcher("/WEB-INF/pages/AdminSeller.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            throw new RuntimeException(e);
        }
    }

    @Override
    // deactivate logic
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("sellerId");
        String statusParam = request.getParameter("status");

        if (idParam == null || idParam.trim().isEmpty()) {

            request.setAttribute("error", "Seller ID is required");

            request.getRequestDispatcher("/WEB-INF/pages/AdminSeller.jsp")
                    .forward(request, response);

            return;
        }

        try {

            Long id = Long.parseLong(idParam);

            boolean status = Boolean.parseBoolean(statusParam);

            AdminService service = new AdminService();

            boolean updated = service.updateSeller(status, id);

            if (updated) {

                response.sendRedirect(request.getContextPath() + "/admin/seller");

            } else {

                request.setAttribute("error", "Seller not found");

                request.getRequestDispatcher("/WEB-INF/pages/AdminSeller.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute("error", "Invalid seller ID");

            request.getRequestDispatcher("/WEB-INF/pages/AdminSeller.jsp").forward(request, response);

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }
}