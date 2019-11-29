package com.study.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig(
        fileSizeThreshold = 1024*1024*3,
        maxFileSize = 1024*1024*10,
        maxRequestSize = 1024*1024*15,
        location = "C:/temp"
)
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //req.getParts().stream().filter(part -> part.getName().equals(""));
        
    }
    
}
