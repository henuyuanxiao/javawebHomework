<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <script type="text/javascript">
        class UILayout
        {
            static SetScreenNumber(num) {
                UILayout.ScreenNumber = num;
            }
 
            static GetScreenNumber() {
                return UILayout.ScreenNumber;
            }
 
            static SetContainer(id) {
                UILayout.Container = document.getElementById(id);
            }
 
            static GetContainer() {
                return UILayout.Container;
            }
 
            static SetVideoWith(VideoWidth) {
                UILayout.VideoWidth = VideoWidth;
            }
 
            static GetVideoWith() {
                return UILayout.VideoWidth ;
            }
 
            static SetVideoHeight(VideoHeight) {
                UILayout.VideoHeight = VideoHeight;
            }
 
            static GetVideoHeight() {
                return UILayout.VideoHeight  ;
            }
 
            static SetSelectVideoIndex(index) {
                UILayout.SelectVideoIndex = index;  
            }
 
            static GetSelectVideoIndex() {
                return UILayout.SelectVideoIndex;
            }
 
            static Init(id,screenNums)
            {
                UILayout.SetContainer(id);
                UILayout.SetScreenNumber(screenNums);
                UILayout.SetVideoWith(352);
                UILayout.SetVideoHeight(288);
                UILayout.SetSelectVideoIndex(-1);
                UILayout.CreateCanvas();
                UILayout.LayoutScreens(screenNums);
            }
 
            static CreateCanvas() {
                for (var i = 1; i <= 32; i++) {
                    //显示画布
                    var canvas = document.createElement('canvas');
                    canvas.width = UILayout.GetVideoWith();
                    canvas.height = UILayout.GetVideoHeight();
                    canvas.style.border = "1px solid black";
                    canvas.style.cssFloat = "left";
                    this.Container.append(canvas);
 
                    var ctx = canvas.getContext('2d');
                    ctx.fillStyle = "gray";
                    ctx.fillRect(1, 1, canvas.width, canvas.height);
                }
            }
 
            static ContainsScreen(num) {
                var screens = [1, 4, 6, 8, 9, 10,16,24,32];
                for (var i = 0; i < screens.length; i++) {
                    if (screens[i] == num) {
                        return true;
                    }
                }
                return false;
            }
 
            static LayoutScreens(num) {
                if (num == undefined) {
                    console.log("LayoutScreens num is undefined");
                } else if (!UILayout.ContainsScreen(num)) {
                    console.log("LayoutScreens num is not in  [1, 4, 6, 8,9,10,16,24,32]");
                    return;
                } else {
                    this.ScreenNumber = num;
                }
                
                for (var i = 1; i <= this.Container.childElementCount; i++) {
                    var video = this.Container.childNodes.item(i);
                    video.index = i;
                    video.style.margin = "1px";
                    video.parentContainer = this.Container;
                    video.onclick = function () {
                        UILayout.SelectVideoIndex = this.index;
                        alert(UILayout.SelectVideoIndex);
                        for (var i = 1; i <= this.parentContainer.childElementCount; i++) {
                            if (i === UILayout.SelectVideoIndex) {
                                this.style.border = "1px solid #00FF00";
                            } else {
                                this.parentContainer.childNodes.item(i).style.border = "1px solid black";
                            }
                        }
                    };
                    if (this.ScreenNumber < i) {
                        video.style.display = "none";
                    } else {
                        video.style.display = "block";
                    }
                }
 
                var width = parseInt(this.Container.style.width.replace("px", ""));
                var height = parseInt(this.Container.style.height.replace("px", ""));
                var count = 0;
                for (var i = 1; i <= this.Container.childElementCount; i++) {
                    var video = this.Container.childNodes.item(i);
                    if (this.ScreenNumber == 1 && video.index == 1) {
                        video.style.width = (width - 5)+"px";
                        video.style.height = (height-5)+"px";
                        count++;
                    } else if (this.ScreenNumber == 4 && video.index <=4) {
                        video.style.width = (width/2 -5) + "px";
                        video.style.height =(height / 2-5) + "px";
                        count++;
                    } else if (this.ScreenNumber == 6 && video.index <= 6) {
                       if (video.index==1) {
                            video.style.width = (width / 3 *2- 6)  + "px";
                            video.style.height = (height /3 *2 - 5) + "px";
                        } else {
                            video.style.width = (width / 3 - 5)  + "px";
                            video.style.height = (height / 3 - 2) + "px";
                        }
                        if (video.index == 6)
                        {
                            video.style.cssFloat = "right";
                            video.style.marginRight = "3px";
                        }
                        count++;
                    } else if (this.ScreenNumber == 8 && video.index <= 8) {
                         if (video.index==1) {
                            video.style.width = (width / 4 *3- 4)  + "px";
                            video.style.height = (height /4 *3 - 7) + "px";
                        } else {
                            video.style.width = (width / 4 - 5)  + "px";
                            video.style.height = (height / 4 - 3) + "px";
                        }
                        if (video.index == 8)
                        {
                            video.style.cssFloat = "right";
                            video.style.marginRight = "3px";
                        }
                        count++;
                    } else if (this.ScreenNumber == 9 && video.index <= 9) {
                        video.style.width = (width / 3-5) + "px";
                        video.style.height = (height / 3-5) + "px";
                        count++;
                    }else if (this.ScreenNumber == 10 && video.index <= 10) {
                        if (video.index==1) {
                            video.style.width = (width / 5 *4- 5)  + "px";
                            video.style.height = (height /5 *4 - 10) + "px";
                        } else {
                            video.style.width = (width / 5 - 5)  + "px";
                            video.style.height = (height / 5 - 5) + "px";
                        }
                        if (video.index == 10)
                        {
                            video.style.cssFloat = "right";
                            video.style.marginRight = "3px";
                        }
                        count++;
                    }
                    else if (this.ScreenNumber == 16 && video.index <= 16) {
                        video.style.width =( width / 4-5) + "px";
                        video.style.height = (height / 4 - 5) + "px";
                        video.style.cssFloat = "left";
                        video.style.margin = "1px";
                        count++;
                    } else if (this.ScreenNumber == 24 && video.index <= 24) {
                        video.style.width =( width / 6-4) + "px";
                        video.style.height = (height / 4-3) + "px";
                        video.style.cssFloat = "left";
                        video.style.margin = "1px";
                        count++;
                    } else if (this.ScreenNumber == 32 && video.index <= 32) {
                        video.style.width =( width / 8-4) + "px";
                        video.style.height = (height / 4-2) + "px";
                        video.style.cssFloat = "left";
                        video.style.margin = "1px";
                        count++;
                    }
                    if (count == this.ScreenNumber )
                    {
                        break;
                    }
                }
            }
        }
 
        window.onload = function ()
        {
            UILayout.Init("player",4);
        }
 
        function Screens(num)
        {
            UILayout.LayoutScreens(num);
        }
 
    </script>
</head>
<body>
    <label for="cmbScreenNumbers">分屏数量:</label>
    <select id="cmbScreenNumbers" onchange="Screens(this.value)">
        <option value="1">1=1x1</option>
        <option value="4" selected="selected">4=2x2</option>
        <option value="6">6=1+5</option>
        <option value="8">8=1+7</option>
        <option value="9">9=3x3</option>
        <option value="10">10=1+9</option>
        <option value="16">16=4x4</option>
        <option value="24">24=4x6</option>
        <option value="32">32=4x8</option>
    </select>
    <div id="player" style="width:1000px;height:400px;border:1px solid #00ffff">
    </div>
</body>
</html>