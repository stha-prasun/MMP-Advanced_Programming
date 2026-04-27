//package com.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import com.util.ImageUtil;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;
//
//@WebServlet("/profile/edit")
//public class EditProfileController extends HttpServlet {
//
//
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//
//        request.getRequestDispatcher("/pages/EditProfile.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        //image handling
//        Part imagePart = req.getPart("image");
//        ImageUtil imageUtil = new ImageUtil();
//
//        // Folder inside your project
//        String saveFolder = "/Images/Customer";
//        boolean uploaded = imageUtil.uploadImage(imagePart, saveFolder, request);
//
//        String imgUrl;
//
//        if (uploaded) {
//            imgUrl = saveFolder + "/" + imageUtil.getImageNameFromPart(imagePart);
//        } else {
//            imgUrl = "default.png"; // fallback image
//        }
//    }
//}
//
