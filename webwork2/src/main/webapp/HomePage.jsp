<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Random" %>
<%@page import="jdbcweb.*" %>
<%@ page import="java.util.HashSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>网站主页</title>
  <link rel="shortcut icon" href="favicons/1.png">
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/common.css">
  <link rel="stylesheet" href="css/index.css">
  <script src="js/jquery.js"></script>
  <script src="js/ajaxFunction.js"></script>
  <style>
    body {
      background-image: url(image/mountain.png);
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: center center;
      line-height: 1;
      font-size: 12px;
      font-family: "Microsoft Yahei";
      color: #333;
    }
    .rg_layout {
      width: 1000px;
      height: 1100px;
      border: 8px solid #EEEEEE;
      background-color: white;
      /* 让div水平居中 */
      margin: 90px auto auto;
    }
  </style>
</head>
<body>
<%
JDBCVideo jdbcv = new JDBCVideo();
int rMax= jdbcv.getIdMax();

  HashSet<Integer> setPic = new HashSet<Integer>();
  RandomSet.randomSet(10001,rMax,4,setPic);
  int[] Pic=new int[100];
  int i=0;
  for (int j : setPic) {
    Pic[i]=j;
    i++;
  }
  video[] picVideo=new video[4];
  for(i=0;i<4;i++){
    picVideo[i]=jdbcv.idGetVideo(Pic[i]);
  }


HashSet<Integer> setRec = new HashSet<Integer>();
RandomSet.randomSet(10001,rMax,6,setRec);
int[] recommend=new int[100];
i=0;
for (int j : setRec) {
  recommend[i]=j;
  i++;
}
video[] recVideo=new video[6];
for(i=0;i<6;i++){
  recVideo[i]=jdbcv.idGetVideo(recommend[i]);
}

  HashSet<Integer> setMov = new HashSet<Integer>();
  int[] Arr1=new int[100];
  Arr1=jdbcv.ClaGetId("影视");
  RandomSet.randomSet(1,Arr1[0]+1,4,setMov);
  int[] Movie=new int[100];
  i=0;
  for (int j : setMov) {
    Movie[i]=j;
    i++;
  }
  video[] MovVideo=new video[4];
  for(i=0;i<4;i++){
    MovVideo[i]=jdbcv.idGetVideo(Arr1[Movie[i]]);
  }

  HashSet<Integer> setACG = new HashSet<Integer>();
  int[] Arr2=new int[100];
  Arr2=jdbcv.ClaGetId("ACG");
  RandomSet.randomSet(1,Arr2[0]+1,4,setACG);
  int[] ACG=new int[100];
  i=0;
  for (int j : setACG) {
    ACG[i]=j;
    i++;
  }
  video[] ACGVideo=new video[4];
  for(i=0;i<4;i++){
    ACGVideo[i]=jdbcv.idGetVideo(Arr2[ACG[i]]);
  }

  HashSet<Integer> setStu = new HashSet<Integer>();
  int[] Arr3=new int[100];
  Arr3=jdbcv.ClaGetId("学习");
  RandomSet.randomSet(1,Arr3[0]+1,4,setStu);
  int[] Stu=new int[100];
  i=0;
  for (int j : setStu) {
    Stu[i]=j;
    i++;
  }
  video[] StuVideo=new video[4];
  for(i=0;i<4;i++){
    StuVideo[i]=jdbcv.idGetVideo(Arr3[Stu[i]]);
  }

  HashSet<Integer> setCom = new HashSet<Integer>();
  int[] Arr4=new int[100];
  Arr4=jdbcv.ClaGetId("综合");
  RandomSet.randomSet(1,Arr4[0]+1,4,setCom);
  int[] COM=new int[100];
  i=0;
  for (int j : setCom) {
    COM[i]=j;
    i++;
  }
  video[] ComVideo=new video[4];
  for(i=0;i<4;i++){
    ComVideo[i]=jdbcv.idGetVideo(Arr4[COM[i]]);
  }


  JDBCRanking jdbcRanking=new JDBCRanking();
  video[] ranks=new video[10];
  ranks=jdbcRanking.getRank();
%>

  <%@ include file="top.jsp" %>

  <header id="header">    
  <img src="image/starnight.png" alt="#" width=100% height="170">
    <div id="page_top">        
      <div class="bg-wrap">
        <div class="bg"></div>
      </div>
    </div>
  </header>
  
  <table align="center">
  <div id="banner">

    <div class="page-width clearfix">
      <div class="slider fl">
        <div class="slider-img">
          <a href="videoPlay?vid=<%=picVideo[0].getVid()%>" slider-title="<%=picVideo[0].getMessage()%>">
            <img src="<%=picVideo[0].getPicPath()%>" alt="#"></a>
          <a href="videoPlay?vid=<%=picVideo[1].getVid()%>" slider-title="<%=picVideo[1].getMessage()%>">
            <img src="<%=picVideo[1].getPicPath()%>" alt="#"></a>
          <a href="videoPlay?vid=<%=picVideo[2].getVid()%>" slider-title="<%=picVideo[2].getMessage()%>">
            <img src="<%=picVideo[2].getPicPath()%>" alt="#"></a>
          <a href="videoPlay?vid=<%=picVideo[3].getVid()%>" slider-title="<%=picVideo[3].getMessage()%>">
            <img src="<%=picVideo[3].getPicPath()%>" alt="#"></a>
        </div>
        <div class="slider-title">
          <p><%=picVideo[0].getMessage()%></p>
        </div>
        <div class="slider-btn">
          <span class="cur"></span>
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
      <div class="banner-list fr">
        <ul>
          <li>
            <a href="videoPlay?vid=<%=recVideo[0].getVid()%>">
              <img src="<%=recVideo[0].getPicPath()%>" alt="">
              <div class="info">
                <p class="title"><%=recVideo[0].getVname()%></p>
              </div>
            </a>
          </li>
          <li>
            <a href="videoPlay?vid=<%=recVideo[1].getVid()%>">
              <img src="<%=recVideo[1].getPicPath()%>" alt="#">
              <div class="info">
                <p class="title"><%=recVideo[1].getVname()%></p>
              </div>
            </a>
          </li>
          <li>
            <a href="videoPlay?vid=<%=recVideo[2].getVid()%>">
              <img src="<%=recVideo[2].getPicPath()%>" alt="#">
              <div class="info">
                <p class="title"><%=recVideo[2].getVname()%></p>
              </div>
            </a>
          </li>
          <li>
            <a href="videoPlay?vid=<%=recVideo[3].getVid()%>">
              <img src="<%=recVideo[3].getPicPath()%>" alt="#">
              <div class="info">
                <p class="title"><%=recVideo[3].getVname()%></p>
              </div>
            </a>
          </li>
          <li>
            <a href="videoPlay?vid=<%=recVideo[4].getVid()%>">
              <img src="<%=recVideo[4].getPicPath()%>" alt="#">
              <div class="info">
                <p class="title"><%=recVideo[4].getVname()%></p>
              </div>
            </a>
          </li>
          <li>
            <a href="videoPlay?vid=<%=recVideo[5].getVid()%>">
              <img src="<%=recVideo[5].getPicPath()%>" alt="#">
              <div class="info">
                <p class="title"><%=recVideo[5].getVname()%></p>
              </div>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

    <div class="rg_layout">
      <!-- 影视区 -->
      <div class="mainCont clearfix" id="animation" js-move="true">
        <div class="pic-list fl" js-tab="true">
          <div class="pic-list__title">
            <i class="icon icon-animation"></i>
            <h2 >影视区</h2>
            <div class="tab-title">
            </div>
            <div class="more-wrap" >
              <a href="PartitionPage.jsp" id="mv" class="more" onclick="ajaxMovie()">更多<i></i></a>
            </div>
          </div>
          <ul class="pic-list__wrapper clearfix tab-cont__item tab-cont__cur">
            <li style="<%=jdbcv.setDisplay(MovVideo[0])%>" class="item">
              <a href="videoPlay?vid=<%=MovVideo[0].getVid()%>" class="img-link">
                <img src="<%=MovVideo[0].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=MovVideo[0].getVid()%>"><%=MovVideo[0].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(MovVideo[0].getOwner())%></div>
                  <div class="online"><i></i><%=MovVideo[0].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(MovVideo[1])%>" class="item">
              <a href="videoPlay?vid=<%=MovVideo[1].getVid()%>" class="img-link">
                <img src="<%=MovVideo[1].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=MovVideo[1].getVid()%>"><%=MovVideo[1].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(MovVideo[1].getOwner())%></div>
                  <div class="online"><i></i><%=MovVideo[1].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(MovVideo[2])%>" class="item">
              <a href="videoPlay?vid=<%=MovVideo[2].getVid()%>" class="img-link">
                <img src="<%=MovVideo[2].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=MovVideo[2].getVid()%>"><%=MovVideo[2].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(MovVideo[2].getOwner())%></div>
                  <div class="online"><i></i><%=MovVideo[2].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(MovVideo[3])%>" class="item">
              <a href="videoPlay?vid=<%=MovVideo[3].getVid()%>" class="img-link">
                <img src="<%=MovVideo[3].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=MovVideo[3].getVid()%>"><%=MovVideo[3].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(MovVideo[3].getOwner())%></div>
                  <div class="online"><i></i><%=MovVideo[3].getWatchN()%></div>
                </div>
              </div>
            </li>
         </ul>
          
        </div>
     
    
      </div>

       <div class="main-side fr" js-tab="true" >
          <div class="main-side__title">
            <div class="rank-t">
              <h3>排行</h3>
            </div>
          </div>
          <div class="main-side__cont">
            <div class="tab-cont">
              <ul class="tab-cont__item main-rank">
                <li class="item item-one">
                  <a href="videoPlay?vid=<%=ranks[0].getVid()%>">
                    <i class="n1">1</i>
                    <img src="<%=ranks[0].getPicPath()%>" alt="#">
                    <div>
                      <p class="title"><%=ranks[0].getVname()%></p>
                      <p class="mark">播放量: <%=ranks[0].getWatchN()%></p>
                    </div>
                  </a>
                </li>
                <li class="item">
                  <a href="videoPlay?vid=<%=ranks[1].getVid()%>" onclick=""><i class="n2">2</i><%=ranks[1].getVname()%></a>
                </li>
                <li class="item">
                  <a href="videoPlay?vid=<%=ranks[2].getVid()%>"><i class="n3">3</i><%=ranks[2].getVname()%></a>
                </li>
                <li class="item">
                  <a href="videoPlay?vid=<%=ranks[3].getVid()%>"><i>4</i><%=ranks[3].getVname()%></a>
                </li>
                <li class="item">
                  <a href="videoPlay?vid=<%=ranks[4].getVid()%>"><i>5</i><%=ranks[4].getVname()%></a>
                </li>
                <li class="item">
                  <a href="videoPlay?vid=<%=ranks[5].getVid()%>"><i>6</i><%=ranks[5].getVname()%></a>
                </li>
                <li class="item">
                  <a href="videoPlay?vid=<%=ranks[6].getVid()%>"><i>7</i><%=ranks[6].getVname()%></a>
                </li>
              </ul>

            </div>
          </div>
        </div>

      <!-- ACG区 -->
      <div class="mainCont clearfix" id="music" js-move="true">
        <div class="pic-list fl" js-tab="true">
          <div class="pic-list__title">
            <i class="icon icon-music"></i>
            <h2>ACG区</h2>
            <div class="tab-title">
            </div>
            <div class="more-wrap">
              <a href="PartitionPage.jsp" class="more" onclick="ajaxACG()">更多<i></i></a>
            </div>
          </div>
          <ul class="pic-list__wrapper clearfix tab-cont__item tab-cont__cur">
            <li style="<%=jdbcv.setDisplay(ACGVideo[0])%>" class="item">
              <a href="videoPlay?vid=<%=ACGVideo[0].getVid()%>" class="img-link">
                <img src="<%=ACGVideo[0].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ACGVideo[0].getVid()%>"><%=ACGVideo[0].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ACGVideo[0].getOwner())%></div>
                  <div class="online"><i></i><%=ACGVideo[0].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(ACGVideo[1])%>" class="item">
              <a href="videoPlay?vid=<%=ACGVideo[1].getVid()%>" class="img-link">
                <img src="<%=ACGVideo[1].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ACGVideo[1].getVid()%>"><%=ACGVideo[1].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ACGVideo[1].getOwner())%></div>
                  <div class="online"><i></i><%=ACGVideo[1].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(ACGVideo[2])%>" class="item">
              <a href="videoPlay?vid=<%=ACGVideo[2].getVid()%>" class="img-link">
                <img src="<%=ACGVideo[2].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ACGVideo[2].getVid()%>"><%=ACGVideo[2].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ACGVideo[2].getOwner())%></div>
                  <div class="online"><i></i><%=ACGVideo[2].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(ACGVideo[3])%>" class="item">
              <a href="videoPlay?vid=<%=ACGVideo[3].getVid()%>" class="img-link">
                <img src="<%=ACGVideo[3].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ACGVideo[3].getVid()%>"><%=ACGVideo[3].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ACGVideo[3].getOwner())%></div>
                  <div class="online"><i></i><%=ACGVideo[3].getWatchN()%></div>
                </div>
              </div>
            </li>
        
      
          </ul>
        </div>
        </div>




      <!-- 学习区 -->
      <div class="mainCont clearfix" id="yule" js-move="true">
        <div class="pic-list fl" js-tab="true">
          <div class="pic-list__title">
            <i class="icon icon-yule"></i>
            <h2>学习区</h2>
            <div class="tab-title">
            </div>
            <div class="more-wrap">
              <a href="PartitionPage.jsp" class="more" onclick="ajaxStudy()">更多<i></i></a>
            </div>
          </div>
          <ul class="pic-list__wrapper clearfix tab-cont__item tab-cont__cur">
            <li style="<%=jdbcv.setDisplay(StuVideo[0])%>" class="item">
              <a href="videoPlay?vid=<%=StuVideo[0].getVid()%>" class="img-link">
                <img src="<%=StuVideo[0].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=StuVideo[0].getVid()%>'"><%=StuVideo[0].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(StuVideo[0].getOwner())%></div>
                  <div class="online"><i></i><%=StuVideo[0].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(StuVideo[1])%>" class="item">
              <a href="videoPlay?vid=<%=StuVideo[1].getVid()%>" class="img-link">
                <img src="<%=StuVideo[1].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=StuVideo[1].getVid()%>"><%=StuVideo[1].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(StuVideo[1].getOwner())%></div>
                  <div class="online"><i></i><%=StuVideo[1].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(StuVideo[2])%>" class="item">
              <a href="videoPlay?vid=<%=StuVideo[2].getVid()%>" class="img-link">
                <img src="<%=StuVideo[2].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=StuVideo[2].getVid()%>"><%=StuVideo[2].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(StuVideo[2].getOwner())%></div>
                  <div class="online"><i></i><%=StuVideo[2].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(StuVideo[3])%>" class="item">
              <a href="videoPlay?vid=<%=StuVideo[3].getVid()%>" class="img-link">
                <img src="<%=StuVideo[3].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=StuVideo[3].getVid()%>"><%=StuVideo[3].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(StuVideo[3].getOwner())%></div>
                  <div class="online"><i></i><%=StuVideo[3].getWatchN()%></div>
                </div>
              </div>
            </li>
       
           
          </ul>
        </div>
        
        </div>


      <!-- 综合区-->
      <div class="mainCont clearfix" id="movie" js-move="true">
        <div class="pic-list fl" js-tab="true">
          <div class="pic-list__title">
            <i class="icon icon-movie"></i>
            <h2>综合区</h2>
            <div class="tab-title">
            </div>
            <div class="more-wrap">
              <a href="PartitionPage.jsp" class="more" onclick="ajaxCom()">更多<i></i></a>
            </div>
          </div>
          <ul class="pic-list__wrapper clearfix tab-cont__item tab-cont__cur">
            <li style="<%=jdbcv.setDisplay(ComVideo[0])%>" class="item">
              <a href="videoPlay?vid=<%=ComVideo[0].getVid()%>" class="img-link">
                <img src="<%=ComVideo[0].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ComVideo[0].getVid()%>"><%=ComVideo[0].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ComVideo[0].getOwner())%></div>
                  <div class="online"><i></i><%=ComVideo[0].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(ComVideo[1])%>" class="item">
              <a href="videoPlay?vid=<%=ComVideo[1].getVid()%>" class="img-link">
                <img src="<%=ComVideo[1].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ComVideo[1].getVid()%>"><%=ComVideo[1].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ComVideo[1].getOwner())%></div>
                  <div class="online"><i></i><%=ComVideo[1].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(ComVideo[2])%>" class="item">
              <a href="videoPlay?vid=<%=ComVideo[2].getVid()%>" class="img-link">
                <img src="<%=ComVideo[2].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ComVideo[2].getVid()%>"><%=ComVideo[2].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ComVideo[2].getOwner())%></div>
                  <div class="online"><i></i><%=ComVideo[2].getWatchN()%></div>
                </div>
              </div>
            </li>
            <li style="<%=jdbcv.setDisplay(ComVideo[3])%>" class="item">
              <a href="videoPlay?vid=<%=ComVideo[3].getVid()%>" class="img-link">
                <img src="<%=ComVideo[3].getPicPath()%>" alt="#">
                <span class="mask"></span>
              </a>
              <div class="img-info">
                <a href="videoPlay?vid=<%=ComVideo[3].getVid()%>"><%=ComVideo[3].getVname()%></a>
                <div class="btm">
                  <div class="user"><i></i><%=jdbcv.idGetUName(ComVideo[3].getOwner())%></div>
                  <div class="online"><i></i><%=ComVideo[3].getWatchN()%></div>
                </div>
              </div>
            </li>
            
          </ul>
        </div>
        </div>
      </div>
  </table>



<script src="js/script.js"></script>

</body>
</html>