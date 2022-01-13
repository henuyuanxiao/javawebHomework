package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VideoPartitionGet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // 处理响应乱码问题:字节流需getBytes("UTF-8")
        resp.setContentType("text/html;charset=utf-8");
        String pname=req.getParameter("pname");
        System.out.println(pname);
        this.getServletContext().setAttribute("pname",pname);
    }
}
