package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import jdbcweb.User;

/**
 * Servlet implementation class CheckSign
 */
@WebServlet("/CheckSign")
public class CheckSign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckSign() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String user=request.getParameter("user");
		String userpwd=request.getParameter("Pwd1");
		String aotuLogin = request.getParameter("autoLogin");
		String sql="select name from user where name = ? and password = ?";
		User usr=new User(user,userpwd);
		User user1=usr.personal(user);
		boolean b=usr.select(sql);
		if(b){
			Cookie namecookie=new Cookie("name",user);
			Cookie passwordcookie=new Cookie("password",userpwd);
			if("1".equals(aotuLogin)){
				namecookie.setMaxAge(60*60*24*7);
				passwordcookie.setMaxAge(60*60*24*7);
				response.addCookie(namecookie);
				response.addCookie(passwordcookie);
				session.setAttribute("user",user1);
				int id=usr.unameGetId(user);
				session.setAttribute("uid",id);
				request.getRequestDispatcher("HomePage.jsp").forward(request, response);
			}
			else{
				namecookie.setMaxAge(0);
				passwordcookie.setMaxAge(0);
				response.addCookie(namecookie);
				response.addCookie(passwordcookie);
				session.setAttribute("user",user1);
				int id=usr.unameGetId(user);
				session.setAttribute("uid",id);
				request.getRequestDispatcher("HomePage.jsp").forward(request, response);
			}
		}
		else{
			request.setAttribute("login_message", "账号或密码错误！");
			request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
		}
	}

}
