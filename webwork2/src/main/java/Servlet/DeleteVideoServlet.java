package Servlet;

import jdbcweb.JDBCVideo;
import jdbcweb.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteVideoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int vid=Integer.parseInt(req.getParameter("vid"));
        JDBCVideo jdbcVideo= new JDBCVideo();
        jdbcVideo.DropVideoByVID(vid);
        HttpSession session=req.getSession();
        User user=(User)session.getAttribute("user");
        user.setVideoNum(user.getVideoNum()-1);
        session.setAttribute("user",user);
        resp.sendRedirect("/webwork2/Delete.jsp");
    }
}
