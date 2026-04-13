package com.filter;

import com.util.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String ROOT = "/";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException
    {
        // Cast the request and response to HttpServletRequest and HttpServletResponse
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        // Get the requested URI

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        String path = uri.substring(contextPath.length());


        if (path.startsWith("/resources/") || path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg")   || path.startsWith("/WEB-INF")) {

            chain.doFilter(request, response);
            return;
        }

        Object user = SessionUtil.getAttribute(req, "Email");

        boolean isLoggedIn = user != null;

        boolean isPublic = path.equals(LOGIN) || path.equals(REGISTER) || path.equals(HOME);

        if (!isLoggedIn) {
            if (isPublic) {
                res.sendRedirect(contextPath + HOME);
            } else {
                res.sendRedirect(contextPath + HOME);
            }
        } else {
            //seession
            if (isPublic && !path.equals(HOME)) {
                res.sendRedirect(contextPath + "/home");
            } else {
                chain.doFilter(request, response);
            }
        }

    }

    @Override
    public void destroy() {}

}
