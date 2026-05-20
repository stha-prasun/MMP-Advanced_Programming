package com.controller.Admin;

import com.model.Customer;
import com.service.AdminService;
import com.service.CustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

// This class is a controller that is used to get the customer details and deactivate customer's account
@WebServlet("/admin/customer")
public class AdminCustomerController extends HttpServlet {
    @Override
    //in this doGet method all the customers that are registered in the system will be displayed
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{
            CustomerService customerService = new CustomerService();
            List<Customer> customerList = customerService.getAllCustomer();

            //setting request scope for EL access
            request.setAttribute("customers", customerList);
            //redirection
            request.getRequestDispatcher("/WEB-INF/pages/AdminCustomer.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    // Deactivate account
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("customerId");
        String statusParam = request.getParameter("status");

        // Validation
        if (idParam == null || idParam.trim().isEmpty()) {

            request.setAttribute("error", "Customer ID is required");

            request.getRequestDispatcher("/WEB-INF/pages/AdminCustomer.jsp")
                    .forward(request, response);

            return;
        }

        try {

            Long id = Long.parseLong(idParam);

            boolean status = Boolean.parseBoolean(statusParam);

            AdminService service = new AdminService();

            boolean updated = service.updateCustomer(status, id);

            if (updated) {

                response.sendRedirect(request.getContextPath() + "/admin/customer");

            } else {

                request.setAttribute("error", "Customer not found");

                request.getRequestDispatcher("/WEB-INF/pages/AdminCustomer.jsp")
                        .forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute("error", "Invalid customer ID");

            request.getRequestDispatcher("/WEB-INF/pages/AdminCustomer.jsp")
                    .forward(request, response);

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }


}
