function jump(vid) {
    location.href='视频播放.jsp?'+'txt=' + encodeURI(vid);
}

function createResult(data){
     for(let i in data) {
         var html = "<div class='module'>"+"<jsp:include page='ClickModule.jsp' >" +
             "        <jsp:param name='imagesrc' value="+data[i]["PicPath"]+" />" +
             "        <jsp:param name='vname' value="+data[i]["vname"]+" />" +
             "        <jsp:param name='username' value="+data[i]["owner"]+" />" +
             "        <jsp:param name='vname' value="+data[i]["watchN"]+" />" +
             "      </jsp:include>"+"</div>"
         document.getElementById('rg_form').innerHTML=html;
    }

}