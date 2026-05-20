package com.controller.Seller;

import java.io.IOException;
import java.sql.SQLException;

import com.service.CustomerService;
import com.service.SellerService;
import com.util.CookieUtil;
import com.util.ImageUtil;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// This class is a controller that is used to handle seller profile edit
@WebServlet("/seller/profile/edit")
public class EditProfileController extends HttpServlet {

    @Override
    // show page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        request.getRequestDispatcher("/WEB-INF/pages/EditSellerProfile.jsp").forward(request, response);
    }

    @Override
    // actual working of edit profile feature
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String sellerName = req.getParameter("sellerName");
        String updatedSellerEmail = req.getParameter("sellerEmail");
        String sellerPassword = req.getParameter("sellerPassword");

        Cookie cookie = CookieUtil.getCookie(req, "Email");

        String sellerEmail = null;
        if (cookie != null) {
            sellerEmail = cookie.getValue();
        }

        System.out.println("Email from cookie: " + sellerEmail);

        SellerService service = new SellerService();
        try {
            service.updateSeller(sellerEmail, updatedSellerEmail, sellerName, sellerPassword);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        SessionUtil.setAttribute(req, "sellerEmail", updatedSellerEmail);
        SessionUtil.setAttribute(req, "sellerName", sellerName);

        CookieUtil.addCookie(resp, "Email", updatedSellerEmail, 10 * 30);
        resp.sendRedirect(req.getContextPath() + "/seller/profile");
    }

}