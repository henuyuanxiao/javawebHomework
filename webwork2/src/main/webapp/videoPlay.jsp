<%@ page import="jdbcweb.video" %>
<%@ page import="jdbcweb.JDBCVideo" %>
<%@ page import="jdbcweb.User" %><%--
  Created by IntelliJ IDEA.
  User: 86185
  Date: 2021/11/24
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        function getComments(){//请求当前视频的所有评论
            $.ajax({
                type: "post",
                url: "CommentLoadServlet",
                data:{"vid":document.getElementById("vid").innerHTML},
                datatype: "json",
                success: function(data) {
                    var p = document.createElement("p");
                    p.id="p1";
                    p.innerHTML="";
                    for(let i in data){
                        p.innerHTML += "<hr><table align='center'>" +
                            "<tr> <th>" + data[i]["uname"] + "</th> <th>于" + data[i]["date"] + "</th> </tr> <tr > <td >" + data[i]["msg"] + "</td> </tr> </table></hr>"
                    }
                    document.getElementById("p1").replaceWith(p);
                },
                error: function() {
                }
            });
        }
        function getLikeCollectionMessage(){//请求当前视频的点赞收藏状态
            $.ajax({
                type: "post",
                url: "CheckLCServlet",
                data:{"vid":document.getElementById("vid").innerHTML,"uid":${uid}},//uid改成获取当前uid
                datatype: "json",
                success: function(data) {
                    if(data["like"]=='1')
                    {
                        btn.style.color = 'red';
                    }
                    else
                    {
                        btn.style.color = 'black';
                    }
                    if(data["collect"]=='1')
                    {
                        btn1.style.color = 'red';
                    }
                    else
                    {
                        btn1.style.color = 'black';
                    }

                },
                error: function() {
                    alert("fail");
                }
            });
        }
    </script>
    <title>视频界面</title>

    <style>
        body{
            background: url("image/mountain.png");
        }
        .div1{
            font-size: 35px;
            font-family: "楷体";
            color: deepskyblue;
            border-radius: 5px;
            text-align: center;
        }
        .div2{
            text-align: center;
        }
        .div3{
            font-size: 20px;
            align-content: center;
            align-items: center;
            align-self: center;
        }
        #like{
            font-size: 30px;
            margin-left: 195px;
            width: 100px;
            height: 40px;
            background-color: white;
            border: 1px solid white;
            border-radius: 20px;
        }
        #value{
            font-size: 40px;
            background-color: white;
            border: 1px solid white;
        }
        .rg_layout{
            width: 900px;
            height: 650px;
            border: 8px solid #EEEEEE;
            background-color: white;
            /* 让div水平居中 */
            margin: auto;
            margin-top: 30px;
        }
        .rg_layout2{
            width: 900px;
            _height: 50px;
            border: 8px solid #EEEEEE;
            background-color: white;
            /* 让div水平居中 */
            margin: auto;
            margin-top: 30px;
        }
        #commend{
            height: 400px;
            width: 400px;
        }
        #main{
            text-align: center;
        }
        #typing{
            resize: none;
            height: 50px;
            width: 400px;
        }
        #cmt{
            width: 100px;
            color: blueviolet;
            background-color: #ff8eb3;
            border-radius: 20px;
        }
        p{
            background-color:white;
        }
        #plq{
            color: deepskyblue;
            font-size: 30px;
            font-family: 楷体;
        }

    </style>
    <script type="text/javascript">
        function play() {
            var video = document.getElementById("video");
            video.play();
        }
    </script>
</head>

<%

    video video= (jdbcweb.video) request.getAttribute("video");
    JDBCVideo jdbcVideo=new JDBCVideo();
    jdbcVideo.WatchNAdd(video.getVname());
%>

<body onload="getComments();getLikeCollectionMessage()">
<%@ include file="top.jsp" %>
<div class="rg_layout">

    <div class="rg_form">
        <form action="#" method="post">
            <table>
                <div class="div1"><%=video.getVname()%></div>

                <div class="div2">
                    <div class="div3">
                        视频id:<label id="vid"><%=video.getVid()%></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        播放量:<label id="watchN"><%=video.getWatchN()%></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        分区：<label id="partition"><%=video.getclass()%></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                        作者名：<label id="uname"><%=jdbcVideo.idGetUName(video.getOwner())%></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        上传时间：<label id="date"><%=jdbcVideo.idGetUdate(video.getVid())%></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>

                    <div align="center">
                    <video id="video" onclick="play()" width="700" height="455" src="<%=video.getPath()%>" autoplay="autoplay" loop="loop" controls="controls" ></video>
                    </div>
                </div>
                <div align="center">
                    点赞量：<label id="likeNum"><%=video.getGoodN()%></label>
                    <button onclick="click()" type="button" id="like" title="点赞">&#10084;</button>&nbsp;&nbsp;&nbsp;
                    <button onclick="click()" type="button" id="value" title="收藏">&#9733;</button><br>
<%--                    简介：<label id="message"><%=video.getMessage()%></label>--%>
                    <hr>
                        <table align="center">
                            <tr>
                                <th>简介：</th>
                            </tr>
                            <tr>
                                <td><label id="message"><%=video.getMessage()%></label></td>
                            </tr>
                        </table>
                    </hr>

                </div>
            </table>
        </form>
    </div>
</div>


<div id="main">
    <div id="plq">评论区</div><hr>
    <textarea id="typing" placeholder="输入文字"></textarea>
    <button id="cmt">发送评论</button>
    <div class="rg_layout2">
    <div id="comment">
        <p id="p1"></p>
    </div>
    </div>
</div>


</body>
<script type="text/javascript">
    var btn = document.getElementById('like');
    var btn1 = document.getElementById('value');
    var btn2 = document.getElementById('cmt');
    btn.onclick = function(){//点赞按钮
        $.ajax({
            type:'POST', // 规定请求的类型（GET 或 POST）
            url:'LikeServlet', // 请求的url地址
            dataType:'text', //预期的服务器响应的数据类型
            data:{"vid":document.getElementById("vid").innerHTML,"uid":${uid}},//规定要发送到服务器的数据
            //在data里面加上当前用户的uid，格式："uid":获取uid的代码
            success: function(result){ // 当请求成功时运行的函数
                if(result!="未登录") {
                    if (btn.style.color != 'red') {
                        btn.style.color = 'red';
                        alert("点赞成功！");
                        var i = parseInt(document.getElementById("likeNum").innerHTML);
                        i = i + 1;
                        document.getElementById("likeNum").innerHTML = i;
                    } else {
                        btn.style.color = 'black';
                        var i = parseInt(document.getElementById("likeNum").innerHTML);
                        i = i - 1;
                        document.getElementById("likeNum").innerHTML = i;
                        alert("取消点赞成功！");
                    }
                }
                else{
                    alert("请先登录！");
                    window.location.href="LoginPage.jsp";
                }
            },
            error:function(){ //失败的函数
                alert("点赞失败！")
            }
        })
    }
    btn1.onclick = function(){//收藏按钮
        $.ajax({
            type:'POST', // 规定请求的类型（GET 或 POST）
            url:'CollectionServlet', // 请求的url地址
            dataType:'text', //预期的服务器响应的数据类型
            data:{"vid":document.getElementById("vid").innerHTML,"uid":${uid}},
            //uid改成可获取的
            success: function(result){ // 当请求成功时运行的函数
                if(result!="未登录") {
                    if (btn1.style.color != 'red') {
                        btn1.style.color = 'red';
                        alert(result);
                    } else {
                        btn1.style.color = 'black';
                        alert(result);
                    }
                }
                else{
                    alert("请先登录！");
                    window.location.href="LoginPage.jsp";
                }
            },
            error:function(){ //失败的函数
                alert("收藏失败！")
            }
        })
    }
    btn2.onclick=function(){//评论按钮
        // $.post("CommentServlet","vid="+$("#vid").val+";msg="+document.getElementById("typing").value+";date="+g,function (result) {
        $.ajax({
            type:"POST",
            url:"CommentServlet",
            dataType:"text",
            data:{"vid":document.getElementById("vid").innerHTML,
                "uid":${uid},//此处uid改成获取当前uid
                "msg":document.getElementById("typing").value},
            success:function (result) {

                if(result!="未登录")  {
                    document.getElementById("typing").value = "";
                    getComments();
                    alert(result);
                }
                else {
                    alert("请先登录！");
                    window.location.href="LoginPage.jsp";
                }

            }
        });
    }
</script>
</html>
