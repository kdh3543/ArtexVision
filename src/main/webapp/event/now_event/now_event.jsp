<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Artex Vision</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


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

    html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,
    blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,
    em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,
    b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,
    table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,
    details,embed,figure,figcaption,footer,header,hgroup,menu,nav,
    output,ruby,section,summary,time,mark,audio,video {
      margin: 0;
      padding: 0;
    }

        * {
            box-sizing: border-box;
        }

        /* 전체 설정 css end */

        /* container start */
        .container {
            width: 1200px;
            margin: auto;
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

        #user_grade {
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
            margin-top:15px;
        }

        .sidebar {
            width: 15%;
            height: 100%;
            background-color: var(--color3);
            float:left;
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
            background-color: var(--color5);
        }

        .sidebar_item a {
            font-size: 1rem;
            text-decoration: none;
            color: var(--color2);
        }

        .contents {
            width: 80%;
        }

        .event_present_area{
            width:85%;
            height:100%;
            float:left;
            
        }
        .event_present_title{
            overflow: auto;
            margin-left:30px;
            margin-top:15px;
        }
        .event_present_title>div{
            float:left;
            margin-right: 10px;
        }
        .event_present_admin{
            margin-left:30px;
            font-size: small;
        }
        .footer {
            height: 150px;
            background-color: var(--color1);
        }

        .event_present_area>.hr{
            margin-top: 5px;
            margin-bottom: 5px;
            margin-left:30px;
        }

        .carousel_timeline{
            margin:30px;
        }

        .event_present_list{
            margin-left:30px;
            margin-top: 15px;
        }

        .event_present{
           overflow: auto;
           width:100%;
        }

        .event{
            float:left;
            width:50%;
            margin-bottom: 10px;
        }

        img{
            width:95%;
            height:95%;            
        }
        img:hover{
            cursor: pointer;
        }
        /*
                <div class="event_present_title">
                    <div>Event</div>
                    <div>></div>
                    <div>현재 진행중인 이벤트</div>
                </div>
        */
        
        a{
         	text-align: center;
  			text-decoration: none; /* 링크의 밑줄 제거 */
 		 	color: inherit; /* 링크의 색상 제거 */
        }
            
        a:hover{
            color: black; /* 링크의 색상 제거 */
        }
        .carousel_timeline {
            display: flex;
        }
    </style>
</head>

<body>
    <div class="container">
        <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${dto.mem_grade}</li></span>
                <li id="welcome"> ${loginId } 님 환영합니다.</li>
                <li id="mypage"><a href="/modifyForm.mem">마이페이지</a></li>
                <li id="basket"><a href="/basket/basket.jsp" id="basket">장바구니</a></li>
                <li id=logout><a href="/logout.mem" id="logout">로그아웃</a></li>
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
                <li><a href="/exhibition/artexDesc/artex_desc.jsp">Artex Vision</a></li>
                <li><a href="/exhibition/exhibition/main_ex/now_main_ex.jsp">전시</a></li>
                <li><a href="/event/now_event/now_event.jsp" id="event">이벤트</a></li>
              </ul>
            </div>
          </div>
        </div>
		<div class="carousel_timeline">
          <div class="carousel">
            <img src="/exhibition/img/artex_main_img.png" class="carousel_img">
          </div>
        </div>   
        
        <div class="main">
            <div class="sidebar">
                <h2 class="list_title">Event</h2>
                <ul class="sidebar_item_list">
                    <li class="sidebar_item"><a href="/event/now_event/now_event.jsp">진행중 이벤트</a></li>
                    <li class="sidebar_item"><a href="/event/end_event/end_event.jsp">종료 이벤트</a></li>
                </ul>
            </div>
            <div class="event_present_area">
                <div class="event_present_title">
                    <div>Event</div>
                    <div>></div>
                    <div>현재 진행중인 이벤트</div>
                </div>
                <hr class="hr">
                <div class="event_present_admin">관리자</div>
                <hr class="hr">
                  <div class="event_present_list">
                      <div class="event_present">
                          <div class="event">
                              <div class="event_photo">
                                <img src="/event/img/event_main1.png">
                              </div><br>
                              <div class="event_desc_title"><b>크리스마스 이벤트</b></div>
                              <div class="event_desc_content" style="font-size: small;">2021.12.13~2021.12.25</div>
                          </div>
                          <div class="event">
                            <div class="event_photo">
                                <img src="/event/img/event_main2.png">
                              </div><br>
                              <div class="event_desc_title"><b>신규회원가입 이벤트</b></div>
                              <div class="event_desc_content" style="font-size: small;">2021.12.13~</div>
                          </div>
                      </div>
                      <div class="event_present">
                        <div class="event">
                            <div class="event_photo">
                                <img src="/event/img/event_main3.png">
                              </div><br>
                              <div class="event_desc_title"><b>추가 마일리지 적립 이벤트</b></div>
                              <div class="event_desc_content" style="font-size: small;">2021.12.13~2021.12.31</div>
                        </div>
                      </div>
                  </div>
                  
            </div>
            
        </div>
        
    </div>
    <div class="footer"></div>
</body>

</html>