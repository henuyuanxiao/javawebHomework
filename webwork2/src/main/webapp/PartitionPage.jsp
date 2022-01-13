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
        url: "videoPartitionSend",
        datatype: "json",
        success: function(data) {
            let str= "<div><span class='fon1' >"+data[0]["class"] +"区</span></div>";
            $("#title").append(str);
            let html = "<table><tr><td><ul class='pic-list__wrapper clearfix tab-cont__item tab-cont__cur' style=\"height: auto\">";
          for (let i in data) {
            html += "<li  class='item'><a href='videoPlay?vid="+data[i]["vid"]+"' class='img-link'><img src='" + data[i]["picPath"] + "' alt='#'>";
            html += "<span class='mask'></span></a>"
            html += "<div class='img-info'> <a href='videoPlay?vid="+data[i]["vid"]+"'>" + data[i]["vname"] + "</a> <div class='btm'>";
            html += "<div class='user'><i></i>" + data[i]["message"] + "</div>";
            html += "<div class='online'><i></i>" + data[i]["watchN"] + "</div></div></div>";
          }
          html+="</ul></td></tr></table>"
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
<title>分区</title>
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
.span{
  text-align:center;
}
.fon1 {
  font-family: "微软雅黑";
  font-size: xx-large;
}

</style>
</head>

<body onload="ajaxget()">

<%@ include file="top.jsp" %>
<div id="title"></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<div class="rg_layout" id="rg1" style="height: auto">
<table>
  <tr>
    <td>
  <div class="rg_center" style="height: auto">
    <div id="rg_form" style="height: auto">
      <style id="modules"></style>
    </div>
  </div>
    </td>
  </tr>
</table>
</div>
</div>
<p>&nbsp;</p>
</body>
</html>
