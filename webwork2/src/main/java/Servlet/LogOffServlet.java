package Servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import java.io.IOException;

public class LogOffServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session=req.getSession();
        session.setAttribute("user",null);
        session.setAttribute("uid",null);
        Cookie namecookie=new Cookie("name",null);
        Cookie passwordcookie=new Cookie("password",null);
        namecookie.setMaxAge(0);
        passwordcookie.setMaxAge(0);
        resp.addCookie(namecookie);
        resp.addCookie(passwordcookie);
        resp.sendRedirect("/webwork2/HomePage.jsp");
    }
}
