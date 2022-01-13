package Servlet;

import jdbcweb.JDBCComment;
import jdbcweb.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CommentWriteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid=Integer.parseInt(req.getParameter("uid"));
        int vid=Integer.parseInt(req.getParameter("vid"));
        String msg=req.getParameter("msg");
        JDBCComment jdbcComment=new JDBCComment();
        int result=jdbcComment.UploadCommend(uid,vid,msg);
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session= req.getSession();
        User user=(User) session.getAttribute("user");
        if(user==null){
            resp.getWriter().write("未登录");
        }
        else {
            if (result == 0) {
                resp.getWriter().write("发送评论成功！");
            } else {
                resp.getWriter().write("发送评论失败！");
            }
        }
    }
}
