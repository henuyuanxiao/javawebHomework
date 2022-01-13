package Servlet;

import jdbcweb.JDBCVideo;
import jdbcweb.User;
import jdbcweb.video;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class VmessageUploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JDBCVideo jdbcVideo=new JDBCVideo();
        int vid=jdbcVideo.getIdMax();
        req.setCharacterEncoding("UTF-8");
        String name=req.getParameter("name");
        String partition=req.getParameter("partition");
        String information=req.getParameter("message");
        HttpSession session= req.getSession();
        User user=(User) session.getAttribute("user");
        int owner=user.unameGetId(user.getUserName());
                                        //补充获取当前用户id：Owner
        video v=new video(vid,name,partition,owner,"",information,"");
        int result=jdbcVideo.UpdateVideo(v);

        session.setAttribute("vid",vid);

        PrintWriter pw=resp.getWriter();
        if(result==0){
            pw.write("<script language='javascript'>alert('上传成功！')</script>");
            resp.sendRedirect("UploadFPage.jsp");
        }else{
            pw.write("<script language='javascript'>alert('上传失败，请重试！')</script>");
            resp.sendRedirect("UploadMPage.jsp");
        }
    }
}
