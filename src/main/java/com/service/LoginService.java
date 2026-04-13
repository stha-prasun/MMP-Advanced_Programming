package com.service;

import com.dao.CustomerDAO;
import com.dao.SellerDAO;
import com.model.Customer;
import com.model.Seller;

//logic flow, sends emails pass to the customer dao, checks if customer returned/ exists or not then returns a boolean val to indicate login in or no
public class LoginService {
    public boolean login(String useremail, String custPassword) throws Exception {


        CustomerDAO custdao = new CustomerDAO();
        Customer cust = custdao.getCustomer(useremail, custPassword);
        if (cust == null) {
            return false;
        }
        return true;


    }


}
