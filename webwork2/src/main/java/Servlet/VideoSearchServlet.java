package Servlet;

import jdbcweb.video;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VideoSearchServlet extends HttpServlet {
    private video v=new video();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // 处理响应乱码问题:字节流需getBytes("UTF-8")
        resp.setContentType("text/html;charset=utf-8");
        String keyword=req.getParameter("keyword");
        System.out.println(keyword);
        this.getServletContext().setAttribute("keyword",keyword);
    }
}
