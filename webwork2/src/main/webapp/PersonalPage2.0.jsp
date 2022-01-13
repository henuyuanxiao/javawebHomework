<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
    <link rel="stylesheet" href="css/module.css">
    <%--  <link rel="stylesheet" href="css/common.css">--%>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/上传.css" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>个人主页</title>
    <link href="https://cdn.jsdelivr.net/npm/layui-src@2.4.5/dist/css/layui.css" rel="stylesheet"/>
    <link href="http://lowcode.magicalcoder.com/magicalcoder/assets/drag/ui/magicalcoder/1.1.0/magicalcoder.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/json3/3.3.3/json3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.6.0/echarts.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/4.6.0/extension/dataTool.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/layui-src@2.4.5/dist/layui.all.js"></script>
    <script src="http://www.magicalcoder.com/assets/js/common.js"></script>
    <script src="http://lowcode.magicalcoder.com/magicalcoder/assets/drag/ui/magicalcoder/1.1.0/magicalcoder.js"></script>
    <script src="js/3.js"></script>
    <style type="text/css">
        body {
            background-image: url(image/mountain.png);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
        }
    </style>
    <script src="js/video.js"></script>
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        function myvideoget() {
            $.ajax({
                type: "post",
                url: "PersonalVideoServlet",
                data:{"uname":document.getElementById("uname").innerHTML},
                datatype: "json",
                success: function (data) {
                    let html = "<ul class='pic-list__wrapper clearfix tab-cont__item tab-cont__cur'>";
                    for (let i in data) {
                        html += "<li  class='item'><a href='videoPlay?vid="+data[i]["vid"]+"' class='img-link'><img src='" + data[i]["picPath"] + "' alt='#'>";
                        html += "<span class='mask'></span></a>"
                        html += "<div class='img-info'> <a href='#'>" + data[i]["vname"] + "</a> <div class='btm'>";
                        html += "<div class='user'><i></i>" + data[i]["message"] + "</div>";
                        html += "<div class='online'><i></i>" + data[i]["watchN"] + "</div></div></div>";
                        <%--let html="< jsp:include page='ClickModule.jsp'>";--%>
                        <%--html+="<jsp:param name='imgsrc' value="+data[i]["PicPath"]+" />";--%>
                        <%--html+="<jsp:param name='vname' value="+data[i]["vname"]+"/>";--%>
                        <%--html+="<jsp:param name='owner' value="+data[i]["owner"]+"/>";--%>
                        <%--html+="<jsp:param name='watchN' value="+data[i]["watchN"]+"/></jsp:include>";--%>
                    }
                    html+="</ul>";
                    var p1 = document.createElement("p1");
                    p1.id="p1";
                    p1.innerHTML=html;
                    document.getElementById("p1").replaceWith(p1);
                },
                error: function () {
                    alert("失败2");
                }
            });
        }
        function mycollget() {
            $.ajax({
                type: "post",
                url: "PersonalCollServlet",
                data:{"uname":document.getElementById("uname").innerHTML},
                datatype: "json",
                success: function (data) {
                    let html = "<ul class='pic-list__wrapper clearfix tab-cont__item tab-cont__cur'>";
                    for (let i in data) {
                        html += "<li  class='item'><a href='videoPlay?vid="+data[i]["vid"]+"' class='img-link'><img src='" + data[i]["picPath"] + "' alt='#'>";
                        html += "<span class='mask'></span></a>"
                        html += "<div class='img-info'> <a href='#'>" + data[i]["vname"] + "</a> <div class='btm'>";
                        html += "<div class='user'><i></i>" + data[i]["message"] + "</div>";
                        html += "<div class='online'><i></i>" + data[i]["watchN"] + "</div></div></div>";
                    }
                    html+="</ul>";
                    var p1 = document.createElement("p1");
                    p1.id="p1";
                    p1.innerHTML=html;
                    document.getElementById("p1").replaceWith(p1);
                },
                error: function () {
                    alert("失败2");
                }
            });
        }
    </script>
    <link rel="stylesheet" type="text/css" href="css/上传.css" />
</head>
<body  class="layui-form" style="background-image:url('/image/mountain.png')" onload="myvideoget()">
<body class="layui-form">
<%@ include file="top.jsp" %>
<%--<h2><a href="HomePage.jsp">返回主页</a></h2>--%>
<div id="magicalDragScene" class="mc-root mc-ui-absolute-pane" style="width: 99.4051%; min_height: 746px;height: auto; background: white;">
    <div class="mc-ui-absolute-pane" style="position: absolute; left: 0.596421%; top: 10.8668%; width: 22.2001%; height: 626px; background-color: rgb(251, 250, 250);">
        <label class="layui-form-label" style="position:center;top: 5.59087%; font-size: 36px; width: 66.3668%; height: 43.0208px; color: rgb(255, 184, 0);">个人主页</label>
        <span id="uid" class="mc-ui-geometry-char" style="height: 38px; width: 92px; position: absolute; left: 3.44828%; top: 22.9625%; font-size: 20px;">用户ID：${uid}</span>
        <span id="uname" class="mc-ui-geometry-char" style="height: 38px; width: 92px; position: absolute; left: 3.44828%; top: 30.9625%; font-size: 20px;">用户名：${user.getUserName()}</span>
        <span id="uuid55777f41-7ce6-49a8-9f92-93591707974e" class="mc-ui-geometry-char" style="height: 43px; width: 115px; position: absolute; left: 3.59281%; top: 52.7304%; font-size: 20px;">电子邮箱：${user.getEmail()}</span>
        <span class="mc-ui-geometry-char" style="height: 43px; width: 115px; position: absolute; left: 2.69461%; top: 39.9317%; font-size: 20px;">注册时间：${user.getDate()}</span>
        <span id="uuidfcdcdf0e-c47d-4389-90e9-932d8e67f574" class="mc-ui-geometry-char" style="height: 43px; width: 115px; position: absolute; left: 3.59281%; top: 62.1638%; font-size: 20px;">视频数：${user.getVideoNum()}</span>
        <span class="mc-ui-geometry-char" style="height: 43px; width: 115px; position: absolute; left: 2.69461%; top: 70.9317%; font-size: 20px;"><a href="LogOffServlet">退出登录</a></span>
    </div>
    <div class="layui-row" style="position: absolute; left: 23.5426%; top: 44.2432%; width: 74.4805%; min_height: 730px;height: auto">
        <div class="layui-col-xs12" style="min_height: 789px;height:auto; background-color: rgb(255, 255, 255);">
            <div class="layui-form-item" style="width: 98.2457%; min_height: 730px;height: auto">
                <div class="mc-ui-absolute-pane" style="min_height: 327.021px;height: auto">
                    <ul class="layui-nav" style="width: 101.566%; position: absolute; left: -0.429172%; top: 0.305791%;">
                        <li class="layui-nav-item">
                            <a  onclick="myvideoget()">我的视频</a>
                        </li>
                        <li class="layui-nav-item">
                            <a  onclick="mycollget()">我的收藏</a>
                        </li>
                    </ul><br>
                    <div class="rg_layout" id="rg1" style=" width: 1100px; min-height: 200px; height: auto">
                        <table>
                            <tr>
                                <td>
                                    <div class="rg_center" style="height: auto">
                                        <div id="p1" style="height: auto">
                                            <style id="modules"></style>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div><br>
                    <button class="magicalcoder-layupload layui-btn" style=" width: 9.87095%; height: 38px;" type="button" mc-attr-bool-drag="true" mc-attr-bool-auto="true" mc-attr-bool-multiple="true" mc-attr-str-accept="video" mc-attr-num-size="3179191" mc-attr-num-number="2" onclick="window,location.href='UploadMPage.jsp'">上传视频</button>
                    <button class="magicalcoder-layer layui-btn" mc-attr-num-type="1" mc-attr-bool-shade="false" mc-attr-bool-shade-close="true"  mc-attr-str-area="500px,200px" onclick="window,location.href='Delete.jsp'">删除视频</button>

                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script>
    //以下脚本为标签属性转换成layui组件的还原过程
    //调试:打开浏览器控制台(F12),在代码中某行增加 debugger 即可调试
    var $ = layui.jquery, laytpl = layui.laytpl, laydate = layui.laydate, form = layui.form, layedit = layui.layedit, slider = layui.slider, element = layui.element, colorpicker = layui.colorpicker, upload = layui.upload, rate = layui.rate, carousel = layui.carousel, table = layui.table, flow = layui.flow;
    var magicalDragLayuiUtil = {
        rebuildLayUiControls: function () {
            var _t = this;
            //日期
            $(".magicalcoder-laydate").each(function (idx, item) {
                laydate.render(_t.iteratorAttr({
                    elem: item
                }, item));
            })
            //富文本
            $(".magicalcoder-layedit").each(function (idx, item) {
                var mcDataId = $(item).attr("id");
                if (mcDataId) {
                    layedit.build(mcDataId, {
                        height: 300
                    });
                }
            })
            //外键
            $(".magicalcoder-foreign-select2").each(function (idx, item) {
                var mcDataId = $(item).attr("id");
                if (mcDataId) {
                    $("#" + mcDataId).select2({
                        allowClear: true,
                        width: "150px",
                        delay: 500,
                    });
                }
            })
            //颜色选择器
            $(".magicalcoder-color-picker").each(function (idx, item) {
                colorpicker.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //上传组件
            $(".magicalcoder-layupload").each(function (idx, item) {
                upload.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //滑块
            $(".magicalcoder-slider").each(function (idx, item) {
                slider.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //评分
            $(".magicalcoder-rate").each(function (idx, item) {
                rate.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //轮播
            $(".layui-carousel").each(function (idx, item) {
                carousel.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //流加载
            $(".magicalcoder-flow").each(function (idx, item) {
                flow.load(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //代码
            $(".magicalcoder-code").each(function (idx, item) {
                layui.code(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //弹窗
            $(".magicalcoder-layer").each(function (idx, item) {
                //先隐藏起来
                $(this).next().hide();
                $(this).click(function () {
                    var config = _t.iteratorAttr({
                        elem: $(item)}, item);
                    var type = config.type;
                    if (type + '' == 1) {
                        config.content = $(this).next();
                        if (!config.content.hasClass("magicalcoder-layer-content")) {
                            config.content = config.content.find(".magicalcoder-layer-content")
                        }                }
                    if (config.btn) {
                        config.btn = config.btn.split(",")
                    }
                    if (config.area) {
                        config.area = config.area.split(",")
                    }
                    layer.open(config)
                })
            })
            //动态表格 我们单独封装了layui-table的初始化方式 至于数据排序 返回格式 等操作请根据你的具体环境自行封装
            $(".magicalcoder-table").each(function (idx,
                                                    item) {
                var cols = [];
                //读取列配置
                $(this).find(".magicalcoder-table-th").each(function (i, th) {
                    cols.push(_t.iteratorAttr({
                        title: $(this).text()}, th));
                })
                var tableConfig = _t.iteratorAttr({
                        elem: $(item),
                        cols: [cols]},
                    item);
                //初始化表格 至于返回的数据格式 您可以根据自己的系统自行改造 这里仅做一个示例 参考js\\data\\list.json
                table.render(tableConfig);
            })
            //部分组件初始化
            element.init();
            //表单初始化
            form.render();
        },
        //将标签上的属性 转换成layui函数初始化时的参数名:参数值
        iteratorAttr: function (renderConfig, dom) {
            var attrs = dom.attributes;
            for (var i = 0; i < attrs.length; i++) {
                var attr = attrs[i];
                var name = attr.name;
                var value = attr.value;
                if (name.indexOf("mc-") === 0) {
                    name = name.replace("mc-attr-", '');
                    name = name.replace("mc-event-", '');
                    if (name.indexOf('str-') === 0) {
                        name = name.replace('str-', '');
                    } else if (name.indexOf('bool-') === 0) {
                        name = name.replace('bool-', '');
                        value == 'true' || value === '' ? value = true: value = value;
                        value == 'false' ? value = false: value = value;
                    } else if (name.indexOf('num-') === 0) {
                        name = name.replace('num-', '');
                        if (value !== '' && !isNaN(value)) {
                            value = parseFloat(value);
                        }
                    } else if (name.indexOf('json-') === 0) {
                        name = name.replace('json-', '');
                        if (value !== '') {
                            value = JSON.parse(value);
                        }
                    }
                    renderConfig[this.htmlAttrNameToTuoFeng(name)] = value;
                }
            }
            return renderConfig;
        },
        //user-name -> userName html上的标签名转换成驼峰名称
        htmlAttrNameToTuoFeng: function (name) {
            var arr = name.split("-");
            var newArr = []
            for (var i = 0; i < arr.length; i++) {
                if (i != 0) {
                    if (arr[i] != '') {
                        newArr.push(this.firstCharToUpLower(arr[i]));
                    }
                } else {
                    newArr.push(arr[i]);
                }
            }
            return newArr.join('');
        },
        //首字母大写
        firstCharToUpLower: function (name) {
            var arr = name.split("");
            arr[0] = arr[0].toUpperCase();
            return arr.join('');
        },
    }
    magicalDragLayuiUtil.rebuildLayUiControls();
    //echarts自动初始化
    new McECharts().render();
    //functions-begin
    //functions-end
</script>
</body>

</html>