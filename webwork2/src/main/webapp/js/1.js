function checkUser(){
	if(document.getElementById("txtUser").value.length<3||document.getElementById("txtUser").value.length>5)
	{
		document.getElementById('Usertxt').innerHTML="<em style='color:red'>3-5字符组成</em>";//不符合要求直接变红
		return false;
	}
	else{
		document.getElementById('Usertxt').innerHTML="<em style='color:blue'>OK!</em>";//符合则变蓝
		return true;
	}
}
function checkPwd1(){
	if(document.getElementById("txtPwd1").value.length<6||document.getElementById("txtPwd1").value.length>8)
	{
		document.getElementById('Pwd1txt').innerHTML="<em style='color:red'>6-8字符组成</em>";//不符合要求直接变红
		return false;
	}
	else{
		document.getElementById('Pwd1txt').innerHTML="<em style='color:blue'>OK!</em>";//符合则变蓝
		return true;
	}
}
function checkPwd2(){
	if(document.getElementById("txtPwd1").value!=document.getElementById("txtPwd2").value)
	{
		document.getElementById('Pwd2txt').innerHTML="<em style='color:red'>两次密码不一致</em>";//不符合要求直接变红
		return false;
	}
	else{
		document.getElementById('Pwd2txt').innerHTML="<em style='color:blue'>OK!</em>";//符合则变蓝
		return true;
	}
}
function checkEmail(){
	var email=document.getElementById("txtEmail").value;
	var pattern=/^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\!\:\|\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	if(!pattern.test(email)){
		document.getElementById('Emailtxt').innerHTML="<em style='color:red'>XXXXXX@qq.com</em>";//不符合要求直接变红
		return false;
	}
	else{
		document.getElementById('Emailtxt').innerHTML="<em style='color:blue'>OK!</em>";//符合则变蓝
		return true;
	}
}
function check1(){
	var a1=checkUser();
	var a2=checkPwd1();
	var a3=checkPwd2();
	var a4=checkEmail();

	if(a1&&a2&&a3&&a4){
		return true;
	}
	else{
		alert("请按要求填写信息");
		return false;
	}
}