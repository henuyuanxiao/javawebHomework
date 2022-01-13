package Servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jdbcweb.JDBCVideo;
import jdbcweb.video;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

public class VideoPartitionSend extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // 处理响应乱码问题:字节流需getBytes("UTF-8")
        resp.setContentType("text/html;charset=utf-8");
        JDBCVideo jdbcVideo=new JDBCVideo();
        String pname= (String) this.getServletContext().getAttribute("pname");
        System.out.println(pname);
        HttpSession session=req.getSession();
        session.setAttribute("pname",pname);
        LinkedList<video> videos = jdbcVideo.ClaGetVideo(pname);
        for(int i=0;i<videos.size();i++){
            videos.get(i).setMessage(jdbcVideo.idGetUName(videos.get(i).getOwner()));
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(videos);
        resp.setContentType("application/json;charset=UTF-8");
        resp.getWriter().write(json);
    }
}
