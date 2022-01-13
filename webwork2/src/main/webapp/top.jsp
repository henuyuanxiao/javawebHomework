<%@ page language="java"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>顶部栏</title>
		<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

			ul {
				list-style-type: none;
			}
			
			.top {
			   
				position: relative;
				left: 0;
				right: 0;
				top: 0;
				z-index: 999;
				height: 55px;
				background-color: rgba(0, 0, 0, 0.6);
			}
			

			.logo {
				float: left;
				margin-top: 2px;
			}
			
			.logo a {
				display: inline-block;
				width: 70px;
				height: 50px;
				background-image: url(image/logo.jpg);
				background-size: 70px 35px;
				margin-left:25px;
			}
			
			.nav {
				float: right;
				margin-top: 10px;
				font-size:0;
			}
			
			.nav li {
				display: inline-block;
				margin-left: 40px;
			}
			
			.nav a {
				display: inline-block;
				height: 30px;
				line-height: 30px;
				font-size: 12px;
				color: #fff;
				text-decoration: none;
			}
			
			.nav a:hover {
				color: #f0f1f2;
			}
			.search{
			position: relative;
            
            width: 412px;
            height: 50px;
            background-color: #f0f1f2;
            margin-left: 25%; 
            }
           .search input{
           	position: relative;
            float: left;
            width: 345px;
            height: 50px;
            border: 1px solid #f0f1f2;
            border-right: 0;
            color: black;
            font-size: 14px;
            padding-left: 15px;
          }
            .search button{
            position: relative;
            float: left;
            width: 50px;
            height: 50px;
            border: 0;
            margin-top:0.5%;
				background-color: #FC6;

				font-family: "微软雅黑";
				font-size: 18px;
				color: #0e181f;
				cursor: pointer;
           }

		</style>
		<script src="js/jquery.js"></script>
		<script type="text/javascript">
			function ajaxsub(){
				$.ajax({
					type: "post",
					url: "videoSearchServlet",
					data: $("#search-text").serialize(),
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
 
	<body>
	
		<div class="top">

				<h1 class="logo"><a href="HomePage.jsp"></a></h1>
				<ul class="nav">
					<li>
						<% if(session.getAttribute("user")==null){%>
						<a href="LoginPage.jsp" ><font size="3">欢迎你，主人</font> </a>
						<%}else{ %>
						<a href="/webwork2/PersonalPage2.0.jsp" ><font size="3">欢迎你，${user.getUserName()}</font> </a>
						<%}%>
					</li>
					<li>
						<a href="AboutUs.jsp"><font size="3">关于我们</font></a>
					</li>
				</ul>
			  <ul class="search" >
				  <form id="search-text" action="SearchPage.jsp" method="post">
					  <div id="search-module">
						  <input type="text" name="keyword" value="" placeholder="请输入关键词：">
						  <button type="submit" id="search" value="搜索" onclick="ajaxsub()">搜索</button>
					  </div>
				  </form>

              </ul>
			</div>
		   
           </div>
	</body>
 
</html>
