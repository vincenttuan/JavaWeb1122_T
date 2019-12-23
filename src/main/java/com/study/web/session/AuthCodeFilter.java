package com.study.web.session;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/session/*")
public class AuthCodeFilter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String code = req.getParameter("code");
        String authCode = session.getAttribute("authCode")+"";
        System.out.println(code + ", " + authCode);
        boolean pass = code != null && code.equals(authCode) ? true : false;
        
        if (pass) {
            chain.doFilter(req, resp); // 重導到下一頁
        } else {
            session.invalidate(); // session 失效
            req.setAttribute("message", "認證碼不正確");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/session/login.jsp");
            rd.forward(req, resp);
        }

    }


}
