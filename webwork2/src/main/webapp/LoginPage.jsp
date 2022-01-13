<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录界面</title>
			<link rel="stylesheet" type="text/css" href="css/注册.css" />
           <script type="text/javascript" src="js/2.js">
</script>
	</head>
<body>
<%@ include file="top.jsp" %>
<div class="rg_layout">
	
			<div class="rg_left">
				<p>用户登录</p>
			
			</div>

			<div class="rg_center">
				<div class="rg_form">
					<!-- 定义表单 -->
				<form action="CheckSign" id="form" method="post" onSubmit="return check1()">
						<table>
							<tr>
								<td class="td_left"><%--@declare id="username"--%><label for="username">用户名</label></td>
								<td class="td_right">
									<input type="text" name="user" id="txtUser" value="${cookie.name.value}" placeholder="请输入用户名" onBlur="return checkUser()">
									<span id="User" class="error">

									</span>
								</td>
								
							</tr>
                       


							<tr>
								<td class="td_left"><%--@declare id="password"--%><label for="password">密码</label></td>
								<td class="td_right">
									<input type="password" name="Pwd1" id="txtPwd1" value="${cookie.password.value}" onblur="return checkPassword()" placeholder="请输入密码" onBlur="return checkPwd1()">
									<span id="Pwd1" class="error">

									</span>
								</td>
						
							</tr>

							<tr>
								<td></td>
								<td class="td_right">
									<input type="checkbox" checked="checked" name="autoLogin" value="1">记住我
								</td>
							</tr>
							<tr>
								<td></td>
								<td>${login_message}</td>
							</tr>

							<tr>
								<td colspan="2" id="td_sub"><input type="submit" id="btn_sub" value="登录"></td>
							</tr>
						</table>
					</form>

				</div>

			</div>

			<div class="rg_right">
				<p>没有账号？<a href="register.jsp">立即注册</a></p>
			</div>
		</div>

	</body>
</html>