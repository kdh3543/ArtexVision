<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전시</title>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:300,700">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- 이미지 hover기능  -->
    <style>
      div.ex_main {
            font-family: 'Raleway', Arial, sans-serif;
            position: relative;
            overflow: hidden;
            margin: 10px;
            min-width: 230px;
            max-width: 315px;
            width: 100%;
            color: #ffffff;
            text-align: left;
            font-size: 16px;
            /* background-color: #000000; */
        }

        div.ex_main * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
        }

        div.ex_main img {
            max-width: 100%;
            backface-visibility: hidden;
            vertical-align: top;
        }

        div.ex_main:after,
        div.ex_main div {
            position: absolute;
            top: 40px;
            bottom: 40px;
            left: 20px;
            right: 20px;
        }

        div.ex_main:after {
            content: '';
            background-color: rgba(0, 0, 0, 0.65);
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
            opacity: 0;
        }

        div.ex_main div {
            z-index: 1;
            padding: 20px;
        }

        div.ex_main h4,
        div.ex_main .links {
            width: 100%;
            margin: 5px 0;
            padding: 0;
        }

        div.ex_main h4 {
            line-height: 1.1em;
            font-weight: 700;
            font-size: 1em;
            text-transform: uppercase;
            opacity: 0;
        }

        div.ex_main p {
            font-size: 0.8em;
            font-weight: 300;
            letter-spacing: 1px;
            opacity: 0;
            top: 50%;
            -webkit-transform: translateY(40px);
            transform: translateY(40px);
        }

        div.ex_main i {
            position: absolute;
            bottom: 10px;
            right: 10px;
            padding: 20px 25px;
            font-size: 34px;
            opacity: 0;
            -webkit-transform: translateX(-10px);
            transform: translateX(-10px);
        }

        div.ex_main a {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1;
        }

        div.ex_main:hover img,
        div.ex_main.hover img {
            zoom: 1;
            filter: alpha(opacity=50);
            -webkit-opacity: 0.5;
            opacity: 0.5;

            
        }

        div.ex_main:hover:after,
        div.ex_main.hover:after {
            opacity: 1;
            position: absolute;
            top: 40px;
            bottom: 40px;
            left: 20px;
            right: 20px;
        }

        div.ex_main:hover h4,
        div.ex_main.hover h4,
        div.ex_main:hover p,
        div.ex_main.hover p,
        div.ex_main:hover i,
        div.ex_main.hover i {
            -webkit-transform: translate(0px, 0px);
            transform: translate(0px, 0px);
            opacity: 1;
        }
    </style>

  
    <style>
      /* 전체 설정 css start */
      :root {
        --color1: #3d3d3d;
        --color2: white;
        --color3: #181818;
        --color4: #212121;
        --color5: #373749;
        --color6: #5f4b8b;
        --color7: #998ab4;
        --color8: #afa8ba;
        --color9: #4caf50;
        --color10: #c4302b;
        --color11: #9d2622;
      }
  
      html,body,div,span,applet,object,iframe,h1,h2,h4,h4,h5,h6,p,
      blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,
      em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,
      b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,
      table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,
      details,embed,div,div,footer,header,hgroup,menu,nav,
      output,ruby,section,summary,time,mark,audio,video {
        margin: 0;
        padding: 0;
      }
  
      * {
        box-sizing: border-box;
      }
  
      div {
        /* border: 1px solid black; */
      }
      /* 전체 설정 css end */
  
      /* container start */
      .container {
        width: 1200px;
        margin: auto;
      }
      .container>div{
      	width: 1200px;
      }
      /* container end */
      
      
      /* header start */
      .header {
        height: 40px;
        background-color: var(--color3); 
        color: var(--color2);
      }
      
      .header_list {
        display: flex;
        justify-content: flex-end;
        line-height: 40px;
      }
      
      .header_list li {
        list-style-type: none;
        padding-right: 20px;
        font-size: 0.9rem;
      }
      
      .header_list li a {
        text-decoration: none;
        color: var(--color2);
      }
  
      .search_wrap {
        padding: 5px;
        border-radius: 10px;
        background-color: var(--color4);
        color: var(--text-color);
      }
  
      .search_text {
        background-color: transparent;
        color: var(--text-color);
        border: 0;
        border-bottom: 1px solid var(--color2);
      }
  
      .search_text::placeholder {
        color: var(--text-color);
      }
  
      .search_text:focus {
        outline: none;
      }
  
      .user_detail {
        color: silver;
        padding-right: 10px;
      }
  
      #user_grade{
        background-color: var(--color2);
        border-radius: 5px;
        padding: 1px 3px 1px 3px;
      }
  
      /* header end */
  
      /* nav start */
      .nav {
        display: flex;
        height: 60px;
      }
      
      .nav_logo {
        text-align: center;
        line-height: 60px;
        width: 25%;
        height: 100%;
        font-size: 2rem;
      }
      
      .nav_side {
        align-items: right;
        width: 75%;
        height: 100%;
      }
      
      .nav_menu_list {
        display: flex;
        justify-content: space-around;
        line-height: 55px;
        padding-right: 20px;  
        
      }
      
      .nav_menu_list li {
        border: 0px;
        list-style-type: none;
        font-size: 1.2rem;
        font-weight: bold;
      }
      
      .nav_menu_list li:hover {
        border-bottom: solid var(--color11);
      }
  
      .nav_menu_list a {
        text-decoration: none;
        color: var(--color3);
      }
  
      .nav_menu_list a:hover {
        text-decoration: none;
        color: var(--color7);
      }
      /* nav end */
      
      
      .carousel_timeline {
        display: flex;
      }
      
      .main {
        height: 800px;
      }
  
      .sidebar {
        width: 15%;
        height: 100%;
        background-color: var(--color3);
        float: left;
      }
  
      .list_title {
        color: var(--color2);
        padding-top: 20px;
        text-align: center;
      }
  
      .sidebar_item_list {
        padding-top: 20px;
        list-style-type: none;
        display: flex;
        flex-direction: column;
      }
  
      .sidebar_item {
        width: 100%;
        padding-top: 10px;
        padding-bottom: 10px;
        text-align: center;
      }
  
      .sidebar_item:hover {
        background-color: var(--color11);
      }
  
      .sidebar_item a {
        font-size: 1rem;
        text-decoration: none;
        color: var(--color2);
      }
  
      .contents {
        width: 85%;
        height: 800px;
        float: left;
        padding-left: 50px;
        padding-right: 50px;
      }
  
      .footer {
        height: 150px;
        background-color: var(--color1);
      }
  
      .carousel img {
        width: 100%;
        height: 100%;
      }
  
      /* 내용부분 */
  
      .contents_wrap{
          padding-top: 50px;
          padding-bottom: 50px;
          height: 100%;
      }
  
      .contents_item1{
          width: 100%;
          height: 350px;
          /* margin-bottom: 20px; */
      }
  
      .contents_item1>div{
          width: 25%;
          height: 100%;
          float: left;
      }
  
      .contents_item2{
          width: 100%;
          height: 350px;
      }
  
      .contents_item2>div{
          width: 25%;
          height: 100%;
          float: left;
      }

      .ex_main{
          width: 100%;
          height: 348px;
          text-align: center;
          padding : 40px 20px;
          float: left;
      }


          a{
         	text-align: center;
  			text-decoration: none; /* 링크의 밑줄 제거 */
 		 	color: inherit; /* 링크의 색상 제거 */
        }
            
        a:hover{
            color: black; /* 링크의 색상 제거 */
        }
  
  
      
    </style>
  </head>
  
  <body>
    <div class="container">
      <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${loginGrade }</li></span>
                <li id="welcome"> ${loginId } 님 환영합니다.</li>
                <li id="mypage"><a href="/modifyForm.mem">마이페이지</a></li>
                <li id="basket"><a href="/basket/basket.jsp" id="basket">장바구니</a></li>
                <li id=logout><a href="/logout.mem"  id="logout">로그아웃</a></li>
              </ul>
            </div>
          </c:when>
          <c:otherwise>
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li id=login><a href="/home.mem">로그인</a></li>
                <li id=signup><a href="/signup.mem">회원가입</a></li>
              </ul>
            </div>
          </c:otherwise>
     </c:choose>
    <div class="nav">
      <div class="nav_logo">
        <a href="/artexMain/mainpage.jsp"><i class="fab fa-artstation"> Artex Vision</i></a>
      </div>
      <div class="nav_side">
        <div class="nav_menu">
          <ul class="nav_menu_list">
            <li><a href="/nb_list.board?cpage=1" id="notice">NOTICE</a></li>
            <li><a href="/artexDesc/artex_desc.jsp">Artex Vision</a></li>
            <li><a href="/exhibition/main_ex/now_main_ex.jsp">전시</a></li>
            <li><a href="#" id="event">이벤트</a></li>
          </ul>
        </div>
      </div>
    </div>
      <div class="carousel_timeline">
        <div class="carousel">
          <img src="../img/artex_main_img.png" class="carousel_img">
        </div>
      </div>
  
      <div class="main">
        <div class="sidebar">
          <h2 class="list_title">전시</h2>
          <ul class="sidebar_item_list">
            <li class="sidebar_item"><a href="/exhibition/main_ex/now_main_ex.jsp">현재 전시</a></li>
          	<li class="sidebar_item"><a href="/exhibition/main_ex/future_main_ex.jsp">예정된 전시</a></li>
          	<li class="sidebar_item"><a href="/exhibition/main_ex/end_main_ex.jsp">마감된 전시</a></li>
          </ul>
        </div>
  
        <div class="contents">
          <div class="contents_wrap">
          <div style="text-align: center; font-weight:bold; font-size: larger; color: rgb(104, 104, 104);">현재 전시</div>
            <hr style="width: 200px;">
            <div class="contents_item1">
                <div>
                  <div class="ex_main"><img src="img/hashtag.png"width="100%" height="100%">
                    <div>
                      <br>
                      <h4>프로젝트 해시테그</h4>
                      <br>
                      <p>[ 전시 기간 ] <br> 21-11-03 ~ 22-02-06</p>
                      <br>
                      <p>[ 장소 ] <br> 국립 현대 미술관</p>
                    </div>
                    <a href="../now_ex/ex1_desc.jsp"></a>
                  </div>
                </div>
                <div>
                  <div class="ex_main"><img src="img/russian.png" width="100%" height="100%">
                    <div>
                      <br>
                      <h4>러시아 아방가르드</h4>
                      <br>
                      <p>[ 전시 기간 ] <br> 21-12-31 ~ 22-04-17</p>
                      <br>
                      <p>[ 장소 ] <br> 세종 문화 회관</p>
                    </div>
                    <a href="../now_ex/ex7_desc.jsp"></a>
                  </div>
                </div>
                <div>
                  <div class="ex_main"><img src="img/josun.png" width="100%" height="100%">
                    <div>
                      <br>
                      <h4>조선의 승려 장인</h4>
                      <br>
                      <p>[ 전시 기간 ] <br> 21-12-07 ~ 22-03-06</p>
                      <br>
                      <p>[ 장소 ] <br> 국립 중앙 박물관</p>
                    </div>
                    <a href="../now_ex/ex4_desc.jsp"></a>
                  </div>
                </div>
                <div>
                  <div class="ex_main"><img src="img/chagall.png" width="100%" height="100%">
                    <div>
                      <br>
                      <h4>샤갈 특별전</h4>
                      <br>
                      <p>[ 전시 기간 ] <br> 21-11-25 ~ 22-04-10</p>
                      <br>
                      <p>[ 장소 ] <br> 마이 아트 뮤지엄</p>
                    </div>
                    <a href="../now_ex/ex3_desc.jsp"></a>
                  </div>
                </div>
            </div>
            <div class="contents_item2">
              <div>
                  <div class="ex_main"><img src="img/countdown.png" width="100%" height="100%">
                    <div>
                      <br>
                      <h4>중견작가전 COUNTDOWN</h4>
                      <br>
                      <p>[ 전시 기간 ] <br> 21-12-03 ~ 21-12-26</p>
                      <br>
                      <p>[ 장소 ] <br> 세종 문화 회관</p>
                    </div>
                    <a href="../now_ex/ex8_desc.jsp"></a>
                  </div>
              </div>
              <div>
                <div class="ex_main"><img src="img/love.png" width="100%" height="100%">
                  <div>
                    <br>
                    <h4>연애의 온도 : <br>두 번째 이야기</h4>
                    <br>
                    <p>[ 전시 기간 ] <br> 21-09-15 ~ 22-02</p>
                    <br>
                    <p>[ 장소 ] <br> 석파정 서울미술관</p>
                  </div>
                  <a href="../now_ex/ex5_desc.jsp"></a>
                </div>
              </div>
              <div>
                <div class="ex_main"><img src="img/yosigo.png" width="100%" height="100%">
                  <div>
                    <br>
                    <h4>요시고 사진전</h4>
                    <br>
                    <p>[ 전시 기간 ] <br> 21-06-23 ~ 22-03-01</p>
                    <br>
                    <p>[ 장소 ] <br> 그라운드 시소</p>
                  </div>
                  <a href="../now_ex/ex6_desc.jsp"></a>
                </div>
              </div>
              <div>
                <div class="ex_main"><img src="img/weiwei.png" width="100%" height="100%">
                  <div>
                    <br>
                    <h4>아이 웨이웨이</h4>
                    <br>
                    <p>[ 전시 기간 ] <br> 21-12-11 ~ 22-04-17</p>
                    <br>
                    <p>[ 장소 ] <br> 국립 현대 미술관</p>
                  </div>
                  <a href="../now_ex/ex2_desc.jsp"></a>
                </div>
                </div>
              </div> 
            </div> 
        </div>
      </div>
      <div class="footer"></div>
    </div>
  


    <!-- hover시 발생하는거 -->
    <script>
      $(".hover").mouseleave(
          function () {
              $(this).removeClass("hover");
          }
      );
      
      $("#logout").on("click",function(){
  		if(!confirm("로그아웃 하시겠습니까?")){
  			return false;
  		}
  	})
  	
  	$("#basket").on("click",function(){
  		alert("현재 기능은 구현중에 있습니다.");
  		return false;
  	})
  	
  	$("#event").on("click",function(){
  		alert("현재 기능은 구현중에 있습니다.");
  		return false;
  	})
    </script>


  </body>


  
  
  </html>