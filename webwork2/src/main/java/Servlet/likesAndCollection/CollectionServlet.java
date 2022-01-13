package Servlet.likesAndCollection;

import jdbcweb.JDBClikesCollection;
import jdbcweb.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid=Integer.parseInt(req.getParameter("uid"));
        int vid=Integer.parseInt(req.getParameter("vid"));
        JDBClikesCollection jdbClikesCollection=new JDBClikesCollection();
        int i=jdbClikesCollection.ConsoleCollection(uid,vid);//补充当前用户的uid和当前视频的vid
        resp.setContentType("text/html;charset=UTF-8");
        HttpSession session= req.getSession();
        User user=(User) session.getAttribute("user");
        if(user==null){
            resp.getWriter().write("未登录");
        }
        else {
            if (i == -1) {
                jdbClikesCollection.AddCollection(uid, vid);
                resp.getWriter().write("收藏成功！");
            } else {
                jdbClikesCollection.ReduceCollection(uid, vid);
                resp.getWriter().write("取消收藏成功！");
            }
        }
    }
}
