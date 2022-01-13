package Servlet.likesAndCollection;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import jdbcweb.JDBClikesCollection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class checkLikeCollectionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid=Integer.parseInt(req.getParameter("uid"));
        System.out.println(uid);
        int vid=Integer.parseInt(req.getParameter("vid"));

        JDBClikesCollection jdbClikesCollection=new JDBClikesCollection();
        int i=jdbClikesCollection.ConsoleLikes(uid,vid);
        int j=jdbClikesCollection.ConsoleCollection(uid,vid);
        int like=0,collect=0;
        if(i==0){
            like=1;
        }
        if(j==0){
            collect=1;
        }
        System.out.println(uid+","+i+","+j);
        ObjectMapper objectMapper = new ObjectMapper();
        resp.setContentType("application/json;charset=UTF-8");
        JSONObject json=new JSONObject();
        json.put("like", like);
        json.put("collect", collect);
        resp.getWriter().println(json);
    }
}
