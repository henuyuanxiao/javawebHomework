package Servlet;

import jdbcweb.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckRegister")
public class CheckRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public CheckRegister() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user=request.getParameter("user");
		String userpwd=request.getParameter("Pwd1");
		String email=request.getParameter("Email");
		String sql="insert into user(name,password,Email,cdate) value(?,?,?,?)";
		User usr=new User(user,userpwd,email);
		int result=usr.insert(sql);
		if(result == -1){//用户名已存在
			request.setAttribute("register_message", "用户已存在！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		else if(result>0){//注册成功
			response.sendRedirect("/webwork2/LoginPage.jsp");
		}
		else{//注册失败
			request.setAttribute("register_message", "系统错误！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		
	}

}
