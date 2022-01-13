<%@ page import="jdbcweb.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String name=request.getParameter("name");
String path=request.getParameter("path");
String partition=request.getParameter("partition");
String message=request.getParameter("message");
//JDBC方法类
JDBCVideo jdbc = new JDBCVideo();
video v=new video();
v.setVid(jdbc.getIdMax());
v.setVname(name);
v.setPath(path);
v.setOwner((int)session.getAttribute("用户id"));
v.setClass(partition);
v.setMessage(message);
jdbc.UpdateVideo(v);

%>

</body>
</html>