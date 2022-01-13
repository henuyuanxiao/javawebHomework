function checkvideo(){
    if(document.getElementById("txtvideo").value.length<1||document.getElementById("txtvideo").value.length>12)
    {
        document.getElementById("video").style.color="red";
        return false;
    }
    else{
        document.getElementById("video").style.color="green";
        return true;
    }
}
function check2(){
    var a1=checkvideo();


    if(a1){
        alert("删除成功");
        return window.location.href="PersonalPage.jsp?backurl="+window.location.href;
    }
    else{
        alert("删除失败");
        return alert;
        window.history.back(-1);
    }
}