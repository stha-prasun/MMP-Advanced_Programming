package com.service;

import com.dao.CustomerDAO;
import com.dao.SellerDAO;
import com.model.Customer;
import com.model.Seller;
import com.util.PasswordUtil;

//logic flow, sends emails pass to the customer dao, checks if customer returned/ exists or not then returns a boolean val to indicate login in or no
public class LoginService {
    public boolean login(String useremail, String custPassword, String role) throws Exception {

        if (role.equals("customer")){
            CustomerDAO custdao = new CustomerDAO();
            Customer cust =  custdao.getCustomer(useremail,custPassword);
            if (cust==null){
                return false;
            }
            return true;
        }
        else if (role.equals("seller")){
            SellerDAO sellerdao = new SellerDAO();
            Seller seller =  sellerdao.getSeller(useremail,custPassword);
            if (seller==null){
                return false;
            }
            return true;
        }
        return false;
        }


}
