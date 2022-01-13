package Servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jdbcweb.JDBCUser;
import jdbcweb.JDBCVideo;
import jdbcweb.video;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;

public class PersonalVideoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname_o=req.getParameter("uname");
        String[] str=uname_o.split("：");
        String uname=str[1];
        JDBCUser jdbcUser=new JDBCUser();
        int uid=jdbcUser.NameGetUid(uname);
        JDBCVideo jdbcVideo=new JDBCVideo();
        LinkedList<video> videos=jdbcVideo.uidGetVideo(uid);
        for(int i=0;i<videos.size();i++){
            videos.get(i).setMessage(jdbcVideo.idGetUName(videos.get(i).getOwner()));
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(videos);
        resp.setContentType("application/json;charset=UTF-8");
        resp.getWriter().write(json);
    }
}
