package com.service;

import com.dao.SellerDAO;
import com.util.PasswordUtil;

import java.time.LocalDateTime;

public class SellerService {
    public void addSeller(String sellerEmail, String sellerPassword, String sellerName, String sellerLocation, String sellerIsActive, Long verificationId, LocalDateTime sellerCreatedAt) throws Exception {

        // Hash the password
        String hashedPassword = PasswordUtil.getHashPassword(sellerPassword);
        String hashedNID = PasswordUtil.getHashPassword(verificationId.toString());
        Long LongNID = Long.parseLong(hashedNID);

        SellerDAO dao = new SellerDAO();

        dao.insertSeller(sellerEmail, hashedPassword, sellerName, sellerLocation, sellerIsActive, LongNID, sellerCreatedAt);
    }
}
