<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Artex Vision</title>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

    div {
      /* border: 1px solid black; */
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
      background-color: var(--color5);
    }

    .sidebar_item a {
      font-size: 1rem;
      text-decoration: none;
      color: var(--color2);
    }

    .contents {
      width: 85%;
      float: left;
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
        padding-top: 100px;
        margin-left: 30px;
        margin-right: 30px;
    }

    .contents_item1{
        width: 100%;
        height: 300px;
        margin-bottom: 20px;
    }

    .contents_item1>div{
        width: 25%;
        height: 100%;
        float: left;
    }

    .contents_item2{
        width: 100%;
        height: 300px;
    }

    .contents_item2>div{
        width: 25%;
        height: 100%;
        float: left;
    }

    .contents_item3{
        width: 100%;
        height: 100px;
        text-align: center;
        padding-top: 20px;
    }

    .ex_main{
        width: 100%;
        height: 80%;
        text-align: center;
        padding : 10px 10px 10px 10px;
    }

    .ex_title{
        width: 100%;
        height: 10%;
        text-align: center;
        padding-top: 10px;
        font-weight : bolder;
    }

    .ex_desc{
        width: 100%;
        height: 10%;
        text-align: center;
        padding-top: 5px;
    }



    
  </style>
</head>

<body>
  <div class="container">
    <div class="header">
      <ul class="header_list">
        <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> SILVER</li></span>
        <li> USER001 님 환영합니다.</li>
        <li><a href="#">마이페이지</a></li>
        <li><a href="#">장바구니</a></li>
        <!-- <li><a href="#">로그인</a></li> -->
        <li><a href="#">로그아웃</a></li>
        <!-- <li><a href="#">회원가입</a></li> -->
        <li>
          <span class="search_wrap">
            <input type="text" id="search_text" name="search_text" class="search_text" placeholder="INPUT SEARCH ITEM" maxlength="25">
            <a href=""><i class="fas fa-search"></i></a>
          </span>
        </li>
      </ul>
    </div>
    <div class="nav">
      <div class="nav_logo">
        <i class="fab fa-artstation"> Artex Vision</i>
      </div>
      <div class="nav_side">
        <div class="nav_menu">
          <ul class="nav_menu_list">
            <li><a href="#">NOTICE</a></li>
            <li><a href="#">Artex Vision</a></li>
            <li><a href="#">전시</a></li>
            <li><a href="#">이벤트</a></li>
            <li><a href="#">커뮤니티</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="carousel_timeline">
      <div class="carousel">
        <img src="img/sample_carousel.png" class="carousel_img">
      </div>
    </div>

    <div class="main">
      <div class="sidebar">
        <h2 class="list_title">전시</h2>
        <ul class="sidebar_item_list">
          <li class="sidebar_item"><a href="">현재 전시</a></li>
          <li class="sidebar_item"><a href="">예정된 전시</a></li>
          <li class="sidebar_item"><a href="">마감된 전시</a></li>
        </ul>
      </div>

      <div class="contents">
        <div class="contents_wrap">
          <div class="contents_item1">
              <div>
                  <div class="ex_main"><a href=""><img src="/img/ex_desc/hashtag.png" width="100%" height="100%"></a></div>
                  <div class="ex_title">프로젝트 해시태그 2021</div>
                  <div class="ex_desc">국립 현대 미술관</div>
              </div>
              <div>
                <div class="ex_main"><a href=""><img src="img/ex_img.png" width="100%" height="100%"></a></div>
                <div class="ex_title">전시명</div>
                <div class="ex_desc">장소, 일시</div>
              </div>
              <div>
                <div class="ex_main"><a href=""><img src="img/ex_img.png" width="100%" height="100%"></a></div>
                <div class="ex_title">전시명</div>
                <div class="ex_desc">장소, 일시</div>
              </div>
              <div>
                <div class="ex_main"><a href=""><img src="img/ex_img.png" width="100%" height="100%"></a></div>
                <div class="ex_title">전시명</div>
                <div class="ex_desc">장소, 일시</div>
              </div>
          </div>
          <div class="contents_item2">
            <div>
                <div class="ex_main"><a href=""><img src="img/ex_img.png" width="100%" height="100%"></a></div>
                <div class="ex_title">전시명</div>
                <div class="ex_desc">장소, 일시</div>
            </div>
            <div>
              <div class="ex_main"><a href=""><img src="img/ex_img.png" width="100%" height="100%"></a></div>
              <div class="ex_title">전시명</div>
              <div class="ex_desc">장소, 일시</div>
            </div>
            <div>
              <div class="ex_main"><a href=""><img src="img/ex_img.png" width="100%" height="100%"></a></div>
              <div class="ex_title">전시명</div>
              <div class="ex_desc">장소, 일시</div>
            </div>
            <div>
              <div class="ex_main"><a href=""><img src="img/ex_img.png" width="100%" height="100%"></a></div>
              <div class="ex_title">전시명</div>
            <div class="ex_desc">장소, 일시</div>
            </div>  
          </div>
          <!-- 네비 -->
<!--           <div class="contents_item3">
            << 1    2   3   4  >>
          </div> -->
        </div>
      </div>
    </div>

    <div class="footer"></div>
  </div>
</body>

</html>