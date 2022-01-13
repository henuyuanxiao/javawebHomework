package Servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jdbcweb.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;


public class CommentLoadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 处理响应乱码问题:字节流需getBytes("UTF-8")
        JDBCComment jdbcComment=new JDBCComment();
        int vid=Integer.parseInt(req.getParameter("vid"));
        LinkedList<Comment> comments = jdbcComment.GetComments(vid);
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(comments);
        resp.setContentType("application/json;charset=UTF-8");
        resp.getWriter().write(json);
    }
}
