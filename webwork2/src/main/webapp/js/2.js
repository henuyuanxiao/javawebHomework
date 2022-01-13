function checkUser(){
	if(document.getElementById("txtUser").value.length<3||document.getElementById("txtUser").value.length>5)
	{
		document.getElementById("txtUser").style.color="red";//不符合要求直接变红
		return false;
	}
	else{
		document.getElementById("txtUser").style.color="green";//符合则变蓝
		return true;
	}
}
function checkPwd1(){
	if(document.getElementById("txtPwd1").value.length<6||document.getElementById("txtPwd1").value.length>8)
	{
		document.getElementById("txtPwd1").style.color="red";
		return false;
	}
	else{
		document.getElementById("txtPwd1").style.color="green";
		return true;
	}
}
function check1(){
	var a1=checkUser();
	var a2=checkPwd1();
	if(a1&&a2){
		return true;
	}
	else{
		alert("请输入完整登录信息");
		return false;
	}
}