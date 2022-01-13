package filter;

import jdbcweb.User;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
public class autoLogin implements Filter {
    @Override
    public void init(FilterConfig filterConfig){

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 1.判断是否已登录
        // 1.1将request对象强转成HttpServletRequest类型
        HttpServletRequest rqs = (HttpServletRequest) request;
        HttpServletResponse resp=(HttpServletResponse)response;
        // 1.2获取session对象
        HttpSession session = rqs.getSession();
        String nameCookie=null;
        String passwordCookie=null;
        Cookie[] cookies= rqs.getCookies();
        Cookie cookie1=null;
        Cookie cookie2=null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("name".equals(cookie.getName())) {
                    nameCookie = cookie.getValue(); // 得到cookie的用户名
                    cookie.setMaxAge(60*60*24*7);
                    cookie1=cookie;
                }
                if ("password".equals(cookie.getName())) {
                    passwordCookie = cookie.getValue(); // 得到cookie的密码
                    cookie.setMaxAge(60*60*24*7);
                    cookie2=cookie;
                }
            }
            if (nameCookie != null && passwordCookie != null) { // 如果存在
//              session.getServletContext().setAttribute("nameCookie", nameCookie);
                resp.addCookie(cookie1);
                resp.addCookie(cookie2);
                User user1=new User();
                User user=user1.personal(nameCookie);
                session.setAttribute("user",user);
                System.out.println(11);
            }
        }
        User user=new User();
        int id=user.unameGetId(nameCookie);
        session.setAttribute("uid",id);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
