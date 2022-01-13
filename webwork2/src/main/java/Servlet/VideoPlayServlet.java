package Servlet;

import jdbcweb.JDBCVideo;
import jdbcweb.video;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VideoPlayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // 处理响应乱码问题:字节流需getBytes("UTF-8")
        resp.setContentType("text/html;charset=utf-8");
        String vidS=req.getParameter("vid");
        int vid=Integer.parseInt(vidS);
        JDBCVideo jdbcVideo=new JDBCVideo();
        video video=new video();
        video= jdbcVideo.idGetVideo(vid);
        req.setAttribute("video",video);
        req.getRequestDispatcher("videoPlay.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
