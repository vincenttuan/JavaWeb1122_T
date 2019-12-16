package com.study.web.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/mvc/prime/*")
public class PrimeServlet extends HttpServlet {

    private void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        switch(path) {
            case "/input":
                // 重導至空的 prime.jsp
                
                break;
            case "/calc":
                // 計算 prime
                
                // setAttribute
                
                // 重導至 prime.jsp
                
                break; 
            default:
                resp.getWriter().println("fail path !");
        }
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doHandle(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doHandle(req, resp);
    }
    
}
