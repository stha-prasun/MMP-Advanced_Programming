package com.dao;

import com.model.Admin;
import com.util.DBconfig;
import com.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {
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
}
