<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>视频信息上传界面</title>

	<link rel="stylesheet" type="text/css" href="css/上传.css" />
    <script src="js/upload.js"></script>
</head>
<body>
<%@ include file="top.jsp" %>

<div class="rg_layout" style="height: 500px">

    <div class="rg_center">
        <div class="rg_form">
            <!-- 定义表单 -->
                <table>
                    <form action="VmessageServlet" id="Mform" method="post">
                    <tr>
                        <td class="td_left">视频名</td>
                        <td class="td_right">
                            <input type="text" id="name" name="name" value="">

                        </td>
                    </tr>

                    <tr>
                        <td class="td_left">视频分区</td>
                        <td class="td_right">
<%--                            <input type="text"id="partition" name="patition" value="">--%>
                            <select id="partition" name="partition">
                                <option value ="影视">影视</option>
                                <option value ="ACG">ACG</option>
                                <option value="学习">学习</option>
                                <option value="综合">综合</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">视频简介</td>
                        <td class="td_right">
                            <textarea id="message" name="message" form="Mform"></textarea>

                        </td>
                    </tr>
                        <tr>
                            <td colspan="2" id="td_sub">
                                <input type="submit" id="btn_sub" value="信息上传"/>
                            </td>
                            <td colspan="2" id="td_ret">
                                <input type="reset" id="btn_ret" value="全部重置"/>
                            </td>
                        </tr>
                    </form>

                </table>

        </div>
    </div>
</div>

</body>
</html>