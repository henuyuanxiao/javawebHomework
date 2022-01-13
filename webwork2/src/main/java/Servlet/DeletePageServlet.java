package Servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jdbcweb.JDBCUser;
import jdbcweb.JDBCVideo;
import jdbcweb.User;
import jdbcweb.video;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

public class DeletePageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String uname_o=req.getParameter("uname");
//        String[] str=uname_o.split("：");
//        String uname=str[1];
        HttpSession session=req.getSession();
        User user=(User)session.getAttribute("user");
        JDBCUser jdbcUser=new JDBCUser();
        int uid=jdbcUser.NameGetUid(user.getUserName());
        JDBCVideo jdbcVideo=new JDBCVideo();
        LinkedList<video> videos=jdbcVideo.uidGetVideo(uid);

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(videos);
        resp.setContentType("application/json;charset=UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
