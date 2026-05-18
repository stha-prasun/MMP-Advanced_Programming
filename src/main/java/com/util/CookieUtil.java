package com.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Arrays;

/**
 * Class for creating cookies, putting cookies and deleting cookies
 * **/
public class CookieUtil {
    /**
     * method to add a cookie
     * @param response specifies the HttpResponse where the cookie will be added
     * @param name name of the cookie
     * @param value value of the cookie
     * @param maxAge the maximum time a cookie will last **/
    public static void addCookie(HttpServletResponse response, String name, String value, int maxAge)
    {
        Cookie cookie = new Cookie(name,value);
        cookie.setMaxAge(maxAge);
        cookie.setPath("/"); //root path so can be called anywhere
        response.addCookie(cookie);
    }

    /**
     * method to get a cookie
     * @param request specifies the HttpRequest where the cookie is needed
     * @param name name of the cookie **/
    public static Cookie getCookie(HttpServletRequest request, String name)
    {
        if (request.getCookies() != null)
        {
            //stream will iterate through all the cookies
            return Arrays.stream(request.getCookies())
                    .filter(cookie -> name.equals(cookie.getName()))//finds the cookie with the same name
                    .findFirst()//will return the first cookie that matches
                    .orElse(null);
        }
        return null;
    }

    /**
     * method to delete a cookie
     * @param response specifies the HttpResponse where the cookie will be deleted
     * @param name name of the cookie **/
    public static void deleteCookie (HttpServletResponse response, String name)
    {
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie (cookie);
    }
}
