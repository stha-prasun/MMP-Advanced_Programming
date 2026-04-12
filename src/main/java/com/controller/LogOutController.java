package com.controller;

import com.util.CookieUtil;
import com.util.SessionUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogOutController extends HttpServlet {
    private final long serialVersionUID= 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CookieUtil.deleteCookie(response, "temp");
        SessionUtil.invalidateSession(request);
        response.sendRedirect(request.getContextPath() + "/customer/login");
    }
}
