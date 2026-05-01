package com.service;

import com.dao.SellerDAO;
import com.util.PasswordUtil;

import java.time.LocalDateTime;

public class SellerService {
    public void addSeller(String sellerEmail, String sellerPassword, String sellerName, String sellerLocation, boolean sellerIsActive, String verificationId, LocalDateTime sellerCreatedAt) throws Exception {

        // Hash the password
        String hashedPassword = PasswordUtil.getHashPassword(sellerPassword);
        String hashedNID = PasswordUtil.getHashPassword(verificationId);

        SellerDAO dao = new SellerDAO();

        dao.insertSeller(sellerEmail, hashedPassword, sellerName, sellerLocation, sellerIsActive, hashedNID, sellerCreatedAt);
    }
}
