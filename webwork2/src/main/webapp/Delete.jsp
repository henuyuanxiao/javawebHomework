<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021-12-24
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><meta charset="UTF-8">
    <link rel="stylesheet" href="css/module.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/上传.css" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>删除视频</title>
    <link href="https://cdn.jsdelivr.net/npm/layui-src@2.4.5/dist/css/layui.css" rel="stylesheet"/>
    <link href="http://lowcode.magicalcoder.com/magicalcoder/assets/drag/ui/magicalcoder/1.1.0/magicalcoder.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/json3/3.3.3/json3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.6.0/echarts.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.6.0/extension/dataTool.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/layui-src@2.4.5/dist/layui.all.js"></script>
    <script src="http://www.magicalcoder.com/assets/js/common.js"></script>
    <script src="http://lowcode.magicalcoder.com/magicalcoder/assets/drag/ui/magicalcoder/1.1.0/magicalcoder.js"></script>
    <script src="js/3.js"></script>
    <script src="js/video.js"></script>
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        function myvideoget() {
            $.ajax({
                type: "post",
                url: "DeletePageServlet",
                // data:{"uname":document.getElementById("uname").innerHTML},
                datatype: "json",
                success: function (data) {
                    if(data!="") {
                        let html = "<table border='1'><tr><th width=150px>视频ID</th><th width=250px>视频名称</th><th width=80px> </th></tr>";
                        for (let i in data) {
                            html += "<tr><td align='center' id=" + i + ">" + data[i]["vid"] + "</td>";
                            html += "<td>" + data[i]["vname"] + "</td>";
                            html += "<td><button id='btn" + i + "' onclick='register(" + data[i]["vid"] + ")'>删除视频</button></td></tr>";

                        }
                        html += "</table>";
                        var p = document.createElement("p");
                        p.id = "p";
                        p.innerHTML = html;
                        document.getElementById("p").replaceWith(p);
                    }
                    else{
                        alert("您没有上传任何视频！");
                        window.location.href="PersonalPage2.0.jsp";
                    }
                },
                error: function () {
                    alert("失败");
                }
            });
        }
        function  register(i) {
            window.location.href="DeleteVideoServlet?vid="+i;
        }
    </script>
    <link rel="stylesheet" type="text/css" href="css/上传.css" />
</head>

<body onload="myvideoget()">
<body>
<%@ include file="top.jsp" %>
<div class="rg_layout" id="rg1" style=" width: 1100px; min-height: 200px; height: auto">
    <table>
        <tr>
            <th>
                <div class="rg_center" style="height: auto">
                    <div id="p" style="height: auto">
                        <style id="modules"></style>
                    </div>
                </div>
            </th>
        </tr>
    </table>
</div>
</body>
</body>
</html>
