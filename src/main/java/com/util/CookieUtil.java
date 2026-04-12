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

    public static Cookie getCookie(HttpServletRequest request, String name)
    {
        if (request.getCookies() != null)
        {
            return Arrays.stream(request.getCookies())
                    .filter(cookie -> name.equals(cookie.getName()))
                    .findFirst()
                    .orElse(null);
        }
        return null;
    }

    public static void deleteCookie (HttpServletResponse response, String name)
    {
        Cookie cookie = new Cookie(name, null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie (cookie);
    }
}
