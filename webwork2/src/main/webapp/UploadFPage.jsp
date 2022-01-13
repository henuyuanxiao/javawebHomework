<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>视频文件上传界面</title>

	<link rel="stylesheet" type="text/css" href="css/上传.css" />
    <script src="js/upload.js"></script>
</head>
<body>
<%@ include file="top.jsp" %>

<div class="rg_layout" style="height: 200px">
    <div class="rg_center">
        <div class="rg_form">
            <!-- 定义表单 -->
                <table>
                    <form action="uploadServlet" id="Fform" method="post" enctype="multipart/form-data">
                    <tr>
                            <td class="td_left">选择封面文件:</td>
                            <td class="td_right">
                                <input type="file" id="pic" name="pic" accept="image/png,image/jpg">
                            </td>
                    </tr>

                    <tr>
                        <td class="td_left">选择视频文件:</td>
                        <td class="td_right">
                            <input type="file" id="video" name="video" accept="video/mp4">

                        </td>

                    </tr>
                    <tr>
                        <td class="td_left"></td>
                        <td class="td_right">
                            <input type="submit" value="上传文件" style="margin: 0 auto">
                        </td>
                    </tr>
                    </form>
                </table>

        </div>
    </div>
</div>

</body>
</html>