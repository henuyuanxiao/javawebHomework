<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜索界面</title>
	<style type="text/css">

	  	.search1{
			height: 35px;
			width: 538px;
			background-color:purple;
			margin-left:30%;
			margin-top:10%;
			
		}

		.search1 input{
			width: 450px;
			height: 32px;
			border: 2px solid#066;
			padding-left:4px;
			font: 14px/32px "microsoft yahei";
			float:left;
		}
        .search1 button {
			height: 36px;
			width: 80px;
			background-color: #FC6;

			font: 16px/36px "microsoft yahei";
			color: #FFF;
			cursor: pointer;
		}
	</style>
	<script src="js/jquery.js"></script>
	<script type="text/javascript">
		function ajaxsub(){
			$.ajax({
				type: "post",
				url: "videoSearchServlet",
				data: {keyword:$("#w").val()},
				datatype: "String",
				success: function() {
				},
				error: function() {
					alert("失败1");
				}
			});
		}

	</script>
</head>
</head>
<body>
<%
	String word=request.getParameter("keyword");
	if(word==null)word="请输入关键字";
%>
<div class="search1">
		<form id="search-text" action="SearchPage.jsp" method="post">
			<div>
				<input type="text" id="w" name="keyword" placeholder="请输入关键字" value="<%=word%>">
				<button type="submit" id="search" value="搜索" onclick="ajaxsub()">搜索</button>
			</div>
		</form>

	</div>
</body>
</html>