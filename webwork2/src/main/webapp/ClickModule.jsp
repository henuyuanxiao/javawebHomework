<%--
  Created by IntelliJ IDEA.
  User: 12450
  Date: 2021/11/22
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="jdbcweb.*" %>
<html>
<head>
    <link rel="stylesheet" href="css/module.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    <title>Title</title>
</head>
<body>
<%

    String imgsrc=request.getParameter("imgsrc");
    String vname=request.getParameter("vname");
    String username=request.getParameter("username");
    String watchN=request.getParameter("watchN");
%>
<ul class="pic-list__wrapper clearfix tab-cont__item tab-cont__cur">
<li  class="item">
    <a href="#" class="img-link">
        <img src="<%=imgsrc%>" alt="#">
        <span class="mask"></span>
    </a>
    <div class="img-info">
        <a href="#"><%=vname%></a>
        <div class="btm">
            <div class="user"><i></i><%=username%></div>
            <div class="online"><i></i><%=watchN%></div>
        </div>
    </div>
</li>
</ul>
</body>
</html>

<%--<jsp:include page="ClickModule.jsp">--%>
<%--    <jsp:param name="imgsrc" value="+data[i]["PicPath"]+"/>--%>
<%--    <jsp:param name="vname" value="+data[i]["vname"]+"/>--%>
<%--    <jsp:param name="owner" value="+data[i]["owner"]+"/>--%>
<%--    <jsp:param name="watchN" value="+data[i]["watchN"]+"/>--%>
<%--</jsp:include>--%>