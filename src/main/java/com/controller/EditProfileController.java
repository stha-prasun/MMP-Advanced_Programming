package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.service.CustomerService;
import com.util.CookieUtil;
import com.util.ImageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/profile/edit")
@MultipartConfig
public class EditProfileController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        request.getRequestDispatcher("/WEB-INF/pages/EditProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
            service.updateCustomer(imgUrl, custEmail);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect(req.getContextPath() + "/profile");
    }
}

