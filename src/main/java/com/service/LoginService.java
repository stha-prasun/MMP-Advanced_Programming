package com.service;

import com.dao.AdminDAO;
import com.dao.CustomerDAO;
import com.dao.SellerDAO;
import com.model.Admin;
import com.model.Customer;
import com.model.Seller;

//logic flow, sends emails pass to the customer dao, checks if customer returned/ exists or not then returns a boolean val to indicate login in or no
public class LoginService {
    public Customer login(String useremail, String custPassword) throws Exception {

        CustomerDAO custdao = new CustomerDAO();
        return custdao.getCustomer(useremail, custPassword);

    }

    // admin login
    public Admin adminLogin(String email, String password) throws Exception {

        AdminDAO admindao = new AdminDAO();
        Admin admin = admindao.getAdmin(email, password);

        return admin;


    }

    // seller login
    public Seller sellerLogin(String email, String password) throws Exception {

        SellerDAO sellerdao = new SellerDAO();
        return sellerdao.getSeller(email, password);

    }

}
