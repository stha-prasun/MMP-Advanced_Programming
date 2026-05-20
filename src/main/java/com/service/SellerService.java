package com.service;

import com.dao.SellerDAO;
import com.util.PasswordUtil;

import java.sql.SQLException;
import java.time.LocalDateTime;

// service layer for seller
public class SellerService {
    // seller register
    public void addSeller(String sellerEmail, String sellerPassword, String sellerName, String sellerLocation, boolean sellerIsActive, String verificationId, LocalDateTime sellerCreatedAt) throws Exception {

        // Hash the password
        String hashedPassword = PasswordUtil.getHashPassword(sellerPassword);
        String hashedNID = PasswordUtil.getHashPassword(verificationId);

        SellerDAO dao = new SellerDAO();

        dao.insertSeller(sellerEmail, hashedPassword, sellerName, sellerLocation, sellerIsActive, hashedNID, sellerCreatedAt);
    }

    // update seller
    public void updateSeller(String sellerEmail, String updatedSellerEmail, String sellerName, String sellerPassword) throws SQLException {
        String hashedPassword = PasswordUtil.getHashPassword(sellerPassword);

        SellerDAO dao = new SellerDAO();
        dao.updateSeller(sellerEmail, updatedSellerEmail, sellerName, hashedPassword);
        System.out.println("SERVICE CALLED");
    }
}
