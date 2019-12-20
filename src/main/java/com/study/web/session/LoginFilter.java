package com.study.web.session;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/session/*")
public class LoginFilter extends HttpFilter {
    
    private static Map<String, String> users;
    static {
        users = new LinkedHashMap<>();
        users.put("admin", "1234");
        users.put("mary", "1111");
    }
    
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        boolean pass = false;
        
        if(session.getAttribute("username") == null) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            pass = check(username, password); // 登入驗證
            if(pass) { // 登入是否成功
                session.setAttribute("username", username); // 寫入 session 資料
            }
        } else {
            // 此人已登入
            pass = true;
        }
        
        if(pass) {
            chain.doFilter(req, resp); // 重導到下一頁
        } else {
            session.invalidate(); // session 失效
            req.setAttribute("message", "登入錯誤或請重新登入");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/session/login.jsp");
            rd.forward(req, resp);
        }
        
    }
    
    private boolean check(String username, String password) {
        return users.get(username) != null && users.get(username).equals(password);
    }
    
}
