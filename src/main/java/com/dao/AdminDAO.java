package com.dao;

import com.model.Admin;
import com.util.DBconfig;
import com.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
// sql logic for admin
public class AdminDAO {
    //a method that is responsible for retrieving the Admin details according to the email.
    public Admin getAdmin(String email, String password) throws Exception {
        Connection con = DBconfig.getConnection();



        String sql = "SELECT * FROM admin where email = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, email);
        ResultSet rs = pst.executeQuery();

        if (!rs.next()) {
            return null; // email not found
        }

        String storedpass = rs.getString("password");


        boolean confirmedPass = PasswordUtil.checkPassword(password, storedpass);

        if(!confirmedPass){
            return null;
        }

        Admin admin= new Admin(
                rs.getLong("adminId"),
                rs.getString("name"),
                rs.getString("email"),
                rs.getString("password")
        );
        pst.close();
        con.close();
        return admin;
    }

    //a method that is responsible for changing the isActive status of the customer
    public boolean deactivateCustomer(boolean custIsActive, Long id) throws SQLException {
        Connection con = DBconfig.getConnection();



        String sql = "UPDATE customer SET custIsActive = ? WHERE customerId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setBoolean(1, custIsActive);
        pst.setLong(2, id);
        int rs = pst.executeUpdate();

        if (rs == 0) {
            return false;
        }
        pst.close();
        con.close();
        return true;
    }
    //a method that is responsible for changing the isActive status of the Seller
    public boolean deactivateSeller(boolean sellerIsActive, Long id) throws SQLException {
        Connection con = DBconfig.getConnection();


        String sql = "UPDATE seller SET sellerIsActive = ? WHERE sellerId = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setBoolean(1, sellerIsActive);
        pst.setLong(2, id);
        int rs = pst.executeUpdate();

        if (rs == 0) {
            return false;
        }
        pst.close();
        con.close();
        return true;
    }
}
