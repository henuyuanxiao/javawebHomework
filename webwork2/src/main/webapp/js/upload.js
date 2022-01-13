function submitit(){
//第一个表单
    var tform1= document.getElementById("Fform");
//第二个表单
     var tform2= document.getElementById("Mform");

//提交第一个表单
    tform1.submit();
//提交第二个表单
     tform2.submit();
}

function resetit(){
//第一个表单
    var tform1= document.getElementById("Fform");
//第二个表单
    var tform2= document.getElementById("Mform");

//清空第一个表单
    tform1.reset();
//清空第二个表单
    tform2.reset();
}