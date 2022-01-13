<%--
  Created by IntelliJ IDEA.
  User: 86185
  Date: 2021/10/5
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>视频界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        #form1 div {
            color: #D6D6D6;
        }
    </style>
</head>
<body>
<%@ include file="top.jsp" %>
<div align="center">
    <table width="870" border="1" cellspacing="0">
        <tr>
            <td width="864" height="47" bgcolor="#FFFF00"><div align="center"><strong>顶部栏</strong></div></td>
        </tr>
        <tr>
            <td height="602" bgcolor="#FFFFCC"><div align="center">
                <table width="775" border="1" cellspacing="0">
                    <tr>
                        <td height="35" colspan="20" bgcolor="#99CC66" ><div align="center">
                            <p><strong>视频名</strong></p>
                        </div></td>
                    </tr>
                    <tr>
                        <td width="204" height="26"><div align="center">视频id</div></td>
                        <td width="175"><div align="center">分区</div></td>
                        <td width="204"><div align="center">视频上传时间</div></td>
                        <td width="174"><div align="center">上传者</div></td>
                    </tr>
                    <tr>
                        <td height="469" colspan="4" bgcolor="#FFFFFF">&nbsp;</td>
                    </tr>
                    <tr>
                        <td height="84" colspan="2" bgcolor="#CCCCFF"><form id="form1" name="form1" method="post" action="">
                            <div align="center">
                              <input name="点赞" type="submit" id="thumb" style="width:90px;height:50px;background: darkorange" value="点赞"/>
                            </div>
                        </form>
                      <div align="center"></div></td>
                        <td height="80" bgcolor="#CCCCFF" id="num1">点赞量</td>
                        <td height="80" bgcolor="#CCCCFF" id="num2">播放量</td>
                    </tr>
                    <tr>
                        <td height="62" colspan="4">视频简介</td>
                    </tr>
                </table>
            </div></td>
        </tr>
    </table>
</div>
</body>
</html>