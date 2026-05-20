package com.dao;

import com.util.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// sql logic for payment
public class PaymentDAO {

    // create payment
    public Long createPayment(int payedAmount, String type, Long orderItemId) throws SQLException {
        Connection conn = DBconfig.getConnection();
        String sql = "INSERT INTO payment (payedAmount, Type, orderitemId) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, payedAmount);
        ps.setString(2, type);
        ps.setLong(3, orderItemId);
        ps.executeUpdate();

        ResultSet rs = ps.getGeneratedKeys();
        Long paymentId = null;
        if (rs.next()) {
            paymentId = rs.getLong(1);
        }
        rs.close();
        ps.close();
        conn.close();
        return paymentId;
    }
}