package Servlet.likesAndCollection;

import jdbcweb.JDBClikesCollection;
import jdbcweb.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class LikesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid=Integer.parseInt(req.getParameter("uid"));
        int vid=Integer.parseInt(req.getParameter("vid"));
        System.out.println(vid);
        JDBClikesCollection jdbClikesCollection=new JDBClikesCollection();
        int i=jdbClikesCollection.ConsoleLikes(uid,vid);//补充当前用户的uid和当前视频的vid
        System.out.println(i);
        resp.setContentType("text/html;charset=UTF-8");
        HttpSession session= req.getSession();
        User user=(User) session.getAttribute("user");
        if(user==null){
            resp.getWriter().write("未登录");
        }
        else {
            if (i == -1) {
                String result = "success1";
                jdbClikesCollection.AddLikes(uid, vid);
//            jdbClikesCollection.GoodNAdd(vid);

                resp.getWriter().write(result);
            } else {
                String result = "success2";
                jdbClikesCollection.ReduceLikes(uid, vid);
//            jdbClikesCollection.GoodNReduce(vid);
                resp.getWriter().write(result);
            }
        }
    }
}
