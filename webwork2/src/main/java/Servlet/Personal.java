package Servlet;

import jdbcweb.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Personal extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session= req.getSession();
        String name=session.getServletContext().getAttribute("nameCookie").toString();
        User user1=new User();
        User user=user1.personal(name);
        if(user!=null){
            session.getServletContext().setAttribute("user",user);
            req.getRequestDispatcher("PersonalPage2.0.jsp").forward(req,resp);
        }
        else
            resp.sendRedirect("/webwork2/LoginPage.jsp");
    }
}