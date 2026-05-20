package com.controller.Seller;

import java.io.IOException;
import java.util.List;

import com.model.Product;
import com.service.ProductService;
import com.service.SellerService;
import com.util.CookieUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// This class is a controller that is used for seller dashboard
@WebServlet("/seller/dashboard")
public class    SellerPanelController extends HttpServlet {

    public SellerPanelController() {
        super();
    }

    @Override
    public void init() throws ServletException {
        // Initialization code here
    }

    @Override
    // show all products
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{
            Cookie cookie = CookieUtil.getCookie(request,"Email");
            String sellerEmail = null;
            if (cookie!=null){
                sellerEmail=cookie.getValue();
            }else{
                System.out.println("Cookie not there");
            }
            ProductService productService = new ProductService();
            List<Product> productList = productService.getProductBySeller(sellerEmail);
            request.setAttribute("Products",productList);
            request.getRequestDispatcher("/WEB-INF/pages/SellerPanel.jsp").forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
}