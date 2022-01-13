<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="jdbcweb.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>

<html>
<head>
  <link rel="stylesheet" href="css/module.css">
<%--  <link rel="stylesheet" href="css/common.css">--%>
  <link rel="stylesheet" href="css/index.css">
  <script src="js/video.js"></script>
  <script src="js/jquery.js"></script>
  <script type="text/javascript">
    function ajaxget(){
      $.ajax({
        type: "post",
        url: "videoSendServlet",
        datatype: "json",
        success: function(data) {
            let html = "<table><tr><ul class='pic-list__wrapper clearfix tab-cont__item tab-cont__cur' style=\"height: auto\" >`";
          for (let i in data) {
            html += "<li  class='item'><a href='videoPlay?vid=" + data[i]["vid"] + "' class='img-link'><img src='" + data[i]["picPath"] + "' alt='#'>";
            html += "<span class='mask'></span></a>"
            html += "<div class='img-info'> <a href='videoPlay?vid=" + data[i]["vid"] + "'>" + data[i]["vname"] + "</a> <div class='btm'>";
            html += "<div class='user'><i></i>" + data[i]["message"] + "</div>";
            html += "<div class='online'><i></i>" + data[i]["watchN"] + "</div></div></div>";


          }
          html += "</ul></tr></table>";
          $("#rg_form").append(html);
        },
        error: function() {
          alert("失败2");
        }
      });
    }


  </script>
  <link rel="stylesheet" type="text/css" href="css/上传.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜索界面</title>
<style type="text/css">
body {
	background-image: url(image/mountain.png);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
}
.fon {
	font-family: "微软雅黑";
	font-size: 18px;
}

</style>
</head>

<body onload="ajaxget()">
<%
//  request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
//  JDBCSearch jdbcSearch = new JDBCSearch();
//    int num=jdbcSearch.getNum(keyword);

%>
<%@ include file="top.jsp"  %>
<div>
  <jsp:include page="SearchModule.jsp" >
    <jsp:param name="keyword" value="<%=keyword%>"/>
  </jsp:include>
<%--<%@ include file="SearchModule.jsp" %>--%>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<div class="rg_layout" id="rg1">
  <table>
    <tr>
    <td>
  <div class="rg_center" style="_height: auto">
    <div id="rg_form" style="_height: auto" >
      <style id="modules"></style>
    </div>
  </div>
    </td>
    </tr>
  </table>
</div>

<p>&nbsp;</p>
</body>
</html>
