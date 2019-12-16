package com.study.web.mvc.controller;

import com.study.web.mvc.model.Prime;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/mvc/prime/*")
public class PrimeServlet extends HttpServlet {

    private void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/mvc/view/prime.jsp");
        switch(path) {
            case "/input":
                // 重導至空的 prime.jsp
                rd.forward(req, resp);
                break;
            case "/calc":
                // 計算 prime
                int n = Integer.parseInt(req.getParameter("number"));
                boolean result = new Prime().isPrime(n);
                // setAttribute
                req.setAttribute("n", n);
                req.setAttribute("result", result);
                // 重導至 prime.jsp
                rd.forward(req, resp);
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
