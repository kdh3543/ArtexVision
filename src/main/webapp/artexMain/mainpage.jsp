<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>ArtexVision</title>
      <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      <!-- slick cdn 추가 -->
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
      <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

      <!-- 폰트 추가 -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

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

        html,
        body,
        div,
        span,
        applet,
        object,
        iframe,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        blockquote,
        pre,
        a,
        abbr,
        acronym,
        address,
        big,
        cite,
        code,
        del,
        dfn,
        em,
        img,
        ins,
        kbd,
        q,
        s,
        samp,
        small,
        strike,
        strong,
        sub,
        sup,
        tt,
        var,
        b,
        u,
        i,
        center,
        dl,
        dt,
        dd,
        ol,
        ul,
        li,
        fieldset,
        form,
        label,
        legend,
        table,
        caption,
        tbody,
        tfoot,
        thead,
        tr,
        th,
        td,
        article,
        aside,
        canvas,
        details,
        embed,
        figure,
        figcaption,
        footer,
        header,
        hgroup,
        menu,
        nav,
        output,
        ruby,
        section,
        summary,
        time,
        mark,
        audio,
        video {
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
        .container>div {
          width: 1200px;
        }


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
          /* height: 800px; */
        }

        .contents {
          width: 80%;
        }

        .footer {
          height: 300px;
          background-color: var(--color1);
        }

        .carousel img {
          width: 100%;
          height: 100%;
        }

        /* 전시회 */
        .exhibition_con {
          width: 100%;
          /*1200*/
          height: 600px;
          background-color: white;
          padding-top: 40px;
          margin-bottom: 50px;
          margin-top: 50px;
          text-align: center;
        }

        .ex_title {
          width: 100%;
          height: 50px;
          background-color: white;
          line-height: 50px;
          font-size: x-large;
          padding-left: 40px;
          margin-bottom: 10px;
          font-weight: bolder;
          text-align: center;
        }

        .ex_title>span {
          color: gray;
          font-weight: normal;
        }

        .ex_intro {
          text-align: center;
          width: 100%;
          height: 500px;
        }

        .ex_intro>div {
          text-align: center;
          width: 100%;
          height: 50%;
        }

        .ex_intro>div>div {
          width: 25%;
          height: 100%;
          float: left;
          padding: 25px;
        }

        .more {
          text-align: right;
          width: 100%;
          padding-right: 30px;
          font-size: small;
          font-weight: bolder;
          color: #afa8ba;
        }

        /* 랭킹 */
        .rank_con {
          width: 100%;
          height: 630px;
          /*background-color: rgb(243, 243, 243);*/
          padding-top: 40px;
          margin-bottom: 40px;
        }

        .rank_title {
          width: 100%;
          height: 50px;
          line-height: 50px;
          font-size: x-large;
          padding-left: 40px;
          margin-bottom: 10px;
          font-weight: bolder;
          text-align: center;
        }

        .rank_title>span {
          color: gray;
          font-weight: normal;
        }


        .rank_img {
          width: 100%;
        }

        .rank_img>div {
          width: 20%;
          height: 100%;
          float: left;
          padding: 40px 40px 20px;
        }


        /* 이벤트 */
        .event_con {
          width: 100%;
          height: 500px;
          background-color: white;
          margin-bottom: 40px;
        }

        .event_title {
          width: 100%;
          height: 50px;
          line-height: 50px;
          font-size: x-large;
          padding-left: 40px;
          margin-bottom: 10px;
          font-weight: bolder;
          text-align: center;
        }

        .event_title>span {
          color: gray;
          font-weight: normal;
        }

        .event_img {
          width: 100%;
          height: 250px;
        }

        .event_img>div {
          width: 33.3%;
          float: left;
          padding: 20px;
        }

        /* 탑버튼 */
        .top {
          text-align: center;
          padding-top: 6px;
          position: fixed;
          bottom: 70px;
          right: 150px;
          z-index: 100;
        }

        .top:hover {
          cursor: pointer;
        }

        a {
          text-align: center;
          text-decoration: none;
          /* 링크의 밑줄 제거 */
          color: inherit;
          /* 링크의 색상 제거 */
        }

        a:hover {
          color: black;
          /* 링크의 색상 제거 */
        }

        /* 랭킹 프론트 */
        /*post slider*/
        .post-slider {
          width: 100%;
          margin: 0px auto;
          position: relative;
          height: 100%;
        }

        .post-slider .silder-title {
          text-align: center;
          margin: 30px auto;
        }

        .post-slider .next {
          position: absolute;
          top: 50%;
          right: 30px;
          font-size: 2em;
          color: gray;
          cursor: pointer;
        }

        .post-slider .prev {
          position: absolute;
          top: 50%;
          left: 30px;
          font-size: 2em;
          color: gray;
          cursor: pointer;
        }

        .post-slider .post-wrapper {

          width: 84%;
          height: 100%;
          margin: 0px auto;
          overflow: hidden;
          padding: 30px 0px 10px 0px;
        }

        .post-slider .post-wrapper .post {
          width: 300px;
          height: 100%;
          margin: 0px 10px;
          display: inline-block;
          background: white;
          border-radius: 5px;
        }

        .post-slider .post-wrapper .post .post-info {
          font-size: 15px;
          height: 350%;
          padding-left: 10px;
          margin-top: 10px;
          text-align: center;
          font-family: 'Noto Sans KR', sans-serif;
        }

        .post-slider .post-wrapper .post .slider-image {
          width: 100%;
          height: 350px;
          border-top-left-radius: 5px;
          border-top-right-radius: 5px;
        }

        h4 {
          font-family: 'Noto Sans KR', sans-serif;
          font-size: 20px;
        }
      </style>

      <style>
        .fContainer {
          width: 100%;
          height: 100%;
        }

        .fContainer>div {
          float: left;
        }

        .fLogoContainer {
          height: 100%;
          width: 30%;

        }

        .fLogoContainer>div {
          height: 50%;
          width: 100%;
        }

        .fLogo {

          padding-top: 30px;
          padding-left: 30px;

        }

        .fSiteLogo {
          padding-top: 80px;
          padding-left: 120px;
        }

        #fLogoImg {
          font-size: 40px;
          color: #ffffff70;
        }

        .fContents {
          height: 100%;
          width: 70%;
          padding: 10px;
          font-weight: bold;
          color: #ffffff70;
        }

        #insta,
        #youtube,
        #facebook,
        #twitter {
          font-size: 2rem;
          color: white;
          padding-left: 10px;
        }

        .fLine1 {
          width: 100%;
          height: 20%;
          font-size: 15px;
          padding-top: 5px;
          padding-bottom: 5px;
        }

        .fLine3 {
          width: 100%;
          height: 11%;
          font-size: 15px;
        }

        .fLine2 {
          height: 20%;
          width: 100%;
          font-size: 15px;
          padding-top: 5px;
        }

        .fLine1>div {
          float: left;
          height: 100%;
          text-align: left;
          line-height: 46px;
        }

        .fLine2>div,
        .fLine3>div {
          float: left;
          height: 100%;
        }

        .exh {
          width: 35%;
        }

        .exh2 {
          width: 60%;
        }

        .ceo {
          border-right: 1px solid #ffffff70;
          width: 15%;
        }

        .ceoNum {
          line-height: 46px;
          width: 23%;
          padding-left: 15px;
          border-right: 1px solid #ffffff70;

        }

        .companyNum {
          line-height: 46px;
          width: 42%;
          padding-left: 15px;
        }
      </style>

      <!-- 이미지 hover 효과 -->
      <style>
        div.snip1283 {
          font-family: 'Raleway', Arial, sans-serif;
          color: #fff;
          position: relative;
          overflow: hidden;
          margin: 10px;
          min-width: 225px;
          max-width: 225px;
          max-height: 200px;
          width: 100%;
          color: #ffffff;
          text-align: left;
          background-color: #07090c;
          font-size: 16px;
          -webkit-perspective: 50em;
          perspective: 50em;
        }

        div.snip1283 * {
          -webkit-box-sizing: border-box;
          box-sizing: border-box;
          -webkit-transition: all 0.6s ease;
          transition: all 0.6s ease;
        }

        div.snip1283 img {
          opacity: 1;
          width: 100%;
          -webkit-transform-origin: 50% 0%;
          -ms-transform-origin: 50% 0%;
          transform-origin: 50% 0%;
        }

        div.snip1283 div {
          position: absolute;
          top: 0;
          left: 0;
          bottom: 0;
          width: 100%;
          -webkit-transform: rotateX(90deg);
          transform: rotateX(90deg);
          -webkit-transform-origin: 50% 100%;
          -ms-transform-origin: 50% 100%;
          transform-origin: 50% 100%;
          z-index: 1;
          opacity: 0;
          padding: 20px 30px;
        }

        div.snip1283 h3,
        div.snip1283 p {
          line-height: 1.5em;
        }

        div.snip1283 h3 {
          margin: 0;
          font-weight: 800;
          text-transform: uppercase;
          font-size: 15px;
        }

        div.snip1283 p {
          font-size: 0.8em;
          font-weight: 500;
          margin: 0 0 15px;
        }

        div.snip1283 .read-more {
          border: 2px solid #ffffff;
          padding: 0.5em 1em;
          font-size: 0.8em;
          text-decoration: none;
          color: #ffffff;
          display: inline-block;
        }

        div.snip1283 .read-more:hover {
          background-color: #ffffff;
          color: #000000;
        }

        div.snip1283:hover img,
        div.snip1283.hover img {
          -webkit-transform: rotateX(-90deg);
          transform: rotateX(-90deg);
          opacity: 0;
          cursor: pointer;
        }

        div.snip1283:hover div,
        div.snip1283.hover div {
          -webkit-transform: rotateX(0deg);
          transform: rotateX(0deg);
          opacity: 1;
          -webkit-transition-delay: 0.2s;
          transition-delay: 0.2s;
        }
      </style>

    </head>

    <body>

      <div class="container">

        <!-- 헤더 -->
        <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${loginGrade }</li></span>
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


        <!-- 네비바 -->
        <div class="nav">
          <div class="nav_logo">
            <a href="mainpage.jsp"><i class="fab fa-artstation"> Artex Vision</i></a>
          </div>
          <div class="nav_side">
            <div class="nav_menu">
              <ul class="nav_menu_list">
                <li><a href="/nb_list.board?cpage=1" id="notice">NOTICE</a></li>
                <li><a href="/artexDesc/artex_desc.jsp">Artex Vision</a></li>
                <li><a href="/exhibition/main_ex/now_main_ex.jsp">전시</a></li>
                <li><a href="/event/now_event/now_event.jsp" id="event">이벤트</a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="main">
          <!-- 메인 이미지 캐러셀 -> 진행중인 이벤트 보여줄 예정 -->
          <div class="carousel_timeline">
            <div class="carousel">
              <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="5000">
                    <img src="img/main_slide3.png" class="d-block w-100" alt="이벤트1">
                  </div>
                  <div class="carousel-item" data-bs-interval="5000">
                    <img src="img/main_slide1.png" class="d-block w-100" alt="이벤트2">
                  </div>
                  <div class="carousel-item">
                    <img src="img/main_slide2.png" class="d-block w-100" alt="이벤트3">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
                  data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
                  data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div>
          </div>
          <!-- 전시 파트(간략히 보여주고 링크로 세부페이지 연결) -->
          <div class="exhibition_con">
            <div class="ex_title">전시회 안내&nbsp <span>Exhibition</span></div>
            <hr>
            <br>
            <div class="ex_intro">
              <div class="ex_intro_top">
                <div>
                  <div class="snip1283">
                    <img src="img/main_weiwei.png" width="90%" height="100%">
                    <div>
                      <h3>아이 웨이웨이</h3>
                      <p>[ 전시 기간 ] <br> 21-12-11 ~ 22-04-17<br>[ 장소 ] <br> 국립 현대 미술관</p><a
                        href="/exhibition/now_ex/ex2_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="snip1283">
                    <img src="img/main_cd.png" width="100%" height="100%">
                    <div>
                      <h3>중견작가전</h3>
                      <p>[ 전시 기간 ] <br> 21-12-03 ~ 21-12-26<br>[ 장소 ] <br> 세종 문화 회관</p><a
                        href="/exhibition/now_ex/ex8_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="snip1283">
                    <img src="img/main_lo.png" width="90%" height="100%">
                    <div>
                      <h3>연애의 온도 </h3>
                      <p>[ 전시 기간 ] <br> 21-09-15 ~ 22-02<br>[ 장소 ] <br> 석파정 서울미술관</p><a
                        href="/exhibition/now_ex/ex5_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="snip1283">
                    <img src="img/main_cha.png" width="90%" height="100%">
                    <div>
                      <h3>샤갈 특별전</h3>
                      <p>[ 전시 기간 ] <br> 21-11-25 ~ 22-04-10<br>[ 장소 ] <br> 마이 아트 뮤지엄</p><a
                        href="/exhibition/now_ex/ex3_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="ex_intro_bottom">
                <div>
                  <div class="snip1283">
                    <img src="img/main_yo.png" width="90%" height="100%">
                    <div>
                      <h3>요시고 사진전</h3>
                      <p>[ 전시 기간 ] <br> 21-06-23 ~ 22-03-01<br>[ 장소 ] <br> 그라운드 시소</p><a
                        href="/exhibition/now_ex/ex6_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="snip1283">
                    <img src="img/main_jo.png" width="90%" height="100%">
                    <div>
                      <h3>조선의 승려 장인</h3>
                      <p>[ 전시 기간 ] <br> 21-12-07 ~ 22-03-06<br>[ 장소 ] <br> 국립 중앙 박물관</p><a
                        href="/exhibition/now_ex/ex4_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="snip1283">
                    <img src="img/main_ru.png" width="90%" height="100%">
                    <div>
                      <h3>러시아 아방가르드</h3>
                      <p>[ 전시 기간 ] <br> 21-12-31 ~ 22-04-17<br>[ 장소 ] <br> 세종 문화 회관</p><a
                        href="/exhibition/now_ex/ex7_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
                <div>
                  <div class="snip1283">
                    <img src="img/main_ha.png" width="90%" height="100%">
                    <div>
                      <h3>프로젝트 해시태그</h3>
                      <p>[ 전시 기간 ] <br> 21-11-03 ~ 22-02-06<br>[ 장소 ] <br> 국립 현대 미술관</p><a
                        href="/exhibition/now_ex/ex1_desc.jsp" class="read-more">More</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <a href="/exhibition/main_ex/now_main_ex.jsp">
              <div class="more">더 보기 <span style="color:gray"><i class="fas fa-angle-double-right"></i></span></div>
            </a>
          </div>


          <!-- 별점, 순위 파트 -->
          <div class="rank_con">
            <div class="page-wrapper" style="position:relative;">
              <!--page slider -->
              <div class="post-slider">
                <!-- <h1 class="silder-title">Trending Posts</h1> -->
                <div class="rank_title">랭킹&nbsp <span>Ranking</span></div>
                <hr><br>
                <i class="fas fa-chevron-left prev"></i>
                <i class="fas fa-chevron-right next"></i>
                <div class="post-wrapper">
                  <div class="post">
                    <img src="img/rk_chagall.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex3_desc.jsp" class="post-subject"> 샤갈 특별전 </a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 4.6</i>
                    </div>
                  </div>
                  <div class="post">
                    <img src="img/rk_love.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex5_desc.jsp"> 연애의 온도 : 두번째 이야기 </a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 4.43</i>
                    </div>
                  </div>
                  <div class="post">
                    <img src="img/rk_josun.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex4_desc.jsp"> 조선의 승려 장인 </a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 4.12</i>
                    </div>
                  </div>
                  <div class="post">
                    <img src="img/rk_wei.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex2_desc.jsp">아이 웨이웨이</a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 3.89</i>
                    </div>
                  </div>
                  <div class="post">
                    <img src="img/rk_russian.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex7_desc.jsp">러시아 아방가르드</a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 3.7</i>
                    </div>
                  </div>
                  <div class="post">
                    <img src="img/rk_hash.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex1_desc.jsp">프로젝트 해시테그</a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 3.58</i>
                    </div>
                  </div>
                  <div class="post">
                    <img src="img/rk_yosigo.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex6_desc.jsp">요시고 사진전</a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 3.43</i>
                    </div>
                  </div>
                  <div class="post">
                    <img src="img/rk_countdown.png" class="slider-image">
                    <div class="post-info">
                      <h4><a href="/exhibition/now_ex/ex8_desc.jsp">중견작가전 COUNTDOWN</a></h4>
                      <br>
                      <i class="far fa-star fa-lg" style="height:10%;">&nbsp 3.18</i>
                    </div>
                  </div>
                </div>
              </div>
              <!--post slider-->
            </div>
          </div>



          <!-- 이벤트 파트 -->
          <div class="evnet_con">
            <div class="event_title">이벤트&nbsp <span>Event</span>
              <br>
              <!-- <a href=""><span style="color:black"><i class="fas fa-angle-double-right"></i></span></a> -->
            </div>
            <hr>
            <div class="event_img">
              <div><a href="/event/now_event/now_event.jsp"><img src="img/event_main1.png" width="100%"
                    height="100%"></a></div>
              <div><a href="/event/now_event/now_event.jsp"><img src="img/event_main2.png" width="100%"
                    height="100%"></a></div>
              <div><a href="/event/now_event/now_event.jsp"><img src="img/event_main3.png" width="100%"
                    height="100%"></a></div>
            </div>
          </div>

          <!-- 탑 버튼 -->
          <div class="top">
            <button type="button" class="btn btn-danger">
              <a id="arrow-top" style="color:white" href="#topTarget"><i class="fas fa-arrow-up fa-2x"></i> </a>
            </button>
          </div>

        </div>
        <div class="footer">
          <div class="fContainer">
            <div class="fLogoContainer">
              <div class="fLogo">
                <i class="fab fa-artstation" id="fLogoImg"> Artex Vision</i>

              </div>
              <div class="fSiteLogo">
                <a href="https://www.instagram.com/?hl=ko"><i class="fab fa-instagram" id="insta"></i></a>
                <a href="https://www.youtube.com/"><i class="fab fa-youtube" id="youtube"></i></a>
                <a href="https://www.facebook.com/"><i class="fab fa-facebook" id="facebook"></i></a>
                <a href="https://twitter.com/"><i class="fab fa-twitter" id="twitter"></i></a>
              </div>
            </div>
            <div class="fContents">
              <div class="fLine1">
                <div class="ceo">대표자 이진호</div>
                <div class="ceoNum">전화번호 010-****-****</div>
                <div class="companyNum">사업자등록번호 13-72005511</div>
              </div>
              <div class="fLine2">
                <div class="exh">국립현대미술관 대표전화</div>
                <div class="exhNum">(서울) 02-3701-9500, (과천) 02-2188-6000,<br>(덕수궁) 02-2022-0600, (청주) 043-261-1400</div>
              </div>
              <div class="fLine3">
                <div class="exh">세종문화회관 대표전화</div>
                <div class="exhNum">02-399-1114</div>
              </div>
              <div class="fLine3">
                <div class="exh">국립중앙박물관 대표전화</div>
                <div class="exhNum">02-2077-9000</div>
              </div>
              <div class="fLine3">
                <div class="exh">마이 아트 뮤지엄 대표전화</div>
                <div class="exhNum">02-567-8878</div>
              </div>
              <div class="fLine3">
                <div class="exh">그라운드시소 서촌 대표전화</div>
                <div class="exhNum">02-501-9544</div>
              </div>
              <div class="fLine3">
                <div class="exh">석파정 서울미술관 대표전화</div>
                <div class="exhNum">02-395-0010</div>
              </div>
            </div>

          </div>
        </div>

    </body>
    <script>
      $("#logout").on("click", function () {
        if (!confirm("로그아웃 하시겠습니까?")) {
          return false;
        }
      })

      $("#basket").on("click", function () {
        alert("현재 기능은 구현중에 있습니다.");
        return false;
      })

    </script>



    <!-- 랭킹 슬라이더 slick -->
    <script>
      $('.post-wrapper').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        nextArrow: $('.next'),
        prevArrow: $('.prev'),
      });
    </script>

    <!-- 이미지 호버 효과 -->
    <script>
      $(".hover").mouseleave(
        function () {
          $(this).removeClass("hover");
        }
      );
    </script>

    </html>