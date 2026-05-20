package com.controller.Customer;

import java.io.IOException;
import java.sql.SQLException;

import com.service.CustomerService;
import com.util.CookieUtil;
import com.util.ImageUtil;
import com.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// This class is a controller that is used to edit the user profile
@WebServlet("/profile/edit")
@MultipartConfig
public class EditProfileController extends HttpServlet {
    
    @Override
    // get user profile
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        request.getRequestDispatcher("/WEB-INF/pages/EditProfile.jsp").forward(request, response);
    }

    @Override
    // edit profile logic
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String custName = req.getParameter("custName");
        String updatedCustEmail = req.getParameter("custEmail");
        String custPassword = req.getParameter("custPassword");

        //image handling
        Part imagePart = req.getPart("image");
        ImageUtil imageUtil = new ImageUtil();

        // Folder inside your project
        String saveFolder = "/Images/Customer";
        boolean uploaded = imageUtil.uploadImage(imagePart, saveFolder, req);

        String imgUrl;

        if (uploaded) {
            imgUrl = saveFolder + "/" + imageUtil.getImageNameFromPart(imagePart);
        } else {
            imgUrl = "default.png"; // fallback image
        }

        Cookie cookie = CookieUtil.getCookie(req, "Email");

        String custEmail = null;
        if (cookie != null) {
            custEmail = cookie.getValue();
        }

        System.out.println("Email from cookie: " + custEmail);

        CustomerService service = new CustomerService();
        try {
            service.updateCustomer(imgUrl, custEmail, updatedCustEmail, custName, custPassword);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        SessionUtil.setAttribute(req, "Email", updatedCustEmail);
        SessionUtil.setAttribute(req, "Name", custName);
        SessionUtil.setAttribute(req, "custProfileImg", imgUrl);

        CookieUtil.addCookie(resp, "Email", updatedCustEmail, 10 * 30);
        resp.sendRedirect(req.getContextPath() + "/profile");
    }
}

