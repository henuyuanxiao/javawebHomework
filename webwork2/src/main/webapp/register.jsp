<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>注册界面</title>
			<link rel="stylesheet" type="text/css" href="css/注册.css" />
        <script type="text/javascript" src="js/1.js">
		</script>
	</head>
	<body>

	<%@ include file="top.jsp" %>
            
		<div class="rg_layout">
			<div class="rg_left">
				<p></p>
			</div>

			<div class="rg_center">
				<div class="rg_form">
					<!-- 定义表单 -->
					<form id="form" method="post" onSubmit="return check1()" action="CheckRegister">
						<table>
							<tr>
								<td class="td_left"><%--@declare id="username"--%><label for="username">用户名</label></td>
								<td class="td_right">
									<input type="text" name="user" id="txtUser" placeholder="请输入用户名" onBlur="return checkUser()">
									<span id="Usertxt">3-5字符组成</span>
							</tr>
                       


							<tr>
								<td class="td_left"><%--@declare id="password"--%><label for="password">密码</label></td>
								<td class="td_right">
									<input type="password" name="Pwd1" id="txtPwd1" onblur="return checkPwd1()" placeholder="请输入密码" onBlur="return checkPwd1()">
									<span id="Pwd1txt">6-8字符组成</span>
							</tr>

							
                            <tr>
								<td class="td_left"><label for="txtPwd2">确认密码</label></td>
								<td class="td_right">
									<input type="password" name="Pwd2" id="txtPwd2" placeholder="再次输入密码" onBlur="return checkPwd2()">
			                       <span id="Pwd2txt">两次密码不一致</span>
							</tr>

							<tr>
								<td class="td_left"><label for="txtEmail">Email</label></td>
								<td class="td_right">
									<input type="email" name="Email" id="txtEmail" placeholder="请输入邮箱" onBlur="return checkEmail()">
												<span id="Emailtxt">xxxxxx@qq.com</span>
							</tr>
								
							<tr>
								<td></td>
								<td>${register_message}</td>
							</tr>

							
							<tr>
								<td colspan="2" id="td_sub">
								<input type="submit" id="btn_sub1" value="注册">
								<input type="reset" id="btn_sub2" value="重置">
								</td>
							</tr>
						</table>
					</form>

				</div>

			</div>

		</div>
	</body>
</html>