package com.study.web.async;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/job/long")
public class LongJobServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.print("1. 開始 Servlet 進入 " + new Date() + " <br>");
        out.flush();

        // 商業邏輯(長長長長...工作) !
        //new Thread(new LongJob(resp)).start(); // 資料無法回到前台
        try {
            // 等待10秒鐘，用來模擬任務所需要的時間
            out.println("2.任務處理開始的時間：" + new Date() + ".<p>");
            Thread.sleep(10000);
            out.println("2.任務處理完畢的時間：" + new Date() + ".<p>");
            out.flush();
            // 任務完成
        } catch (Exception e) {
            e.printStackTrace();
        }

        out.print("3. 自 Servlet 離開 " + new Date() + " <br>");
        out.flush();

    }

    class LongJob implements Runnable {

        private HttpServletResponse resp = null;

        public LongJob(HttpServletResponse resp) {
            this.resp = resp;
        }

        public void run() {
            try {
                PrintWriter out = resp.getWriter();
                // 等待10秒鐘，用來模擬任務所需要的時間
                out.println("2.任務處理開始的時間：" + new Date() + ".<p>");
                Thread.sleep(10000);
                out.println("2.任務處理完畢的時間：" + new Date() + ".<p>");
                out.flush();
                // 任務完成
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
