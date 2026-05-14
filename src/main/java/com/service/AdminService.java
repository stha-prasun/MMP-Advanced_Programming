package com.service;


import com.dao.AdminDAO;
import com.dao.SellerDAO;
import com.model.Seller;

import java.sql.SQLException;
import java.util.List;

public class AdminService {
    public boolean updateCustomer(boolean custIsActive, Long id)
            throws SQLException {

        AdminDAO dao = new AdminDAO();

        boolean result = dao.deactivateCustomer(custIsActive, id);

        System.out.println("SERVICE CALLED");

        return result;
    }

    public boolean updateSeller(boolean sellerIsActive, Long id)
            throws SQLException {

        AdminDAO dao = new AdminDAO();

        boolean result = dao.deactivateSeller(sellerIsActive, id);

        System.out.println("SERVICE CALLED");

        return result;
    }

    public List<Seller> getAllSellers() throws Exception {
        SellerDAO dao = new SellerDAO();
        return dao.getAllSellers();
    }
}
