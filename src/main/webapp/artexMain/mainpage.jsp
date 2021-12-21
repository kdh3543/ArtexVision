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
          height: 150px;
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
          height: 500px;
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

        .rank_star {
          width: 100%;
        }

        .rank_star>div {
          width: 20%;
          height: 100%;
          float: left;
          padding: 20px;
        }

        #star_icon {
          float: left;
          width: 50%;
          text-align: center;
        }

        #score {
          float: left;
          width: 50%;
          font-weight: bolder;
          font-size: x-large;
          text-align: center;
          padding-right: 50px;
        }

        /* 리뷰 */
        .review_con {
          width: 100%;
          height: 500px;
          background-color: white;
          margin-bottom: 40px;
        }

        .review_title {
          width: 100%;
          height: 50px;
          line-height: 50px;
          font-size: x-large;
          padding-left: 40px;
          margin-bottom: 10px;
          font-weight: bolder;
          text-align: center;
        }

        .review_txt {
          width: 100%;
          height: 350px;
        }

        .review_txt>div {
          float: left;
          width: 25%;
          height: 100%;
          /* border: 1px solid red; */
          padding: 50px;
        }

        .review_foot {
          width: 100%;
          height: 50px;
          text-align: right;
          padding-right: 30px;
          padding-top: 10px;
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
		
		
        <!-- 네비바 -->
        <div class="nav">
          <div class="nav_logo">
            <a href="mainpage.jsp"><i class="fab fa-artstation"> Artex Vision</i></a>
          </div>
          <div class="nav_side">
            <div class="nav_menu">
              <ul class="nav_menu_list">
                <li><a href="/nb_list.board?cpage=1" id="notice">NOTICE</a></li>
                <li><a href="../artexDesc/artex_desc.jsp">Artex Vision</a></li>
                <li><a href="../exhibition/main_ex/now_main_ex.jsp">전시</a></li>
                <li><a href="#" id="event">이벤트</a></li>
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
                    <img src="img/event_main1.png" class="d-block w-100" alt="이벤트1">
                  </div>
                  <div class="carousel-item" data-bs-interval="5000">
                    <img src="img/event_main2.png" class="d-block w-100" alt="이벤트2">
                  </div>
                  <div class="carousel-item">
                    <img src="img/event_main3.png" class="d-block w-100" alt="이벤트3">
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
            <div class="ex_intro">
              <div class="ex_intro_top">
                <div><a href="../exhibition/now_ex/ex2_desc.jsp"><img src="img/main_weiwei.png" width="90%"
                      height="100%"></a></div>
                <div><a href="../exhibition/now_ex/ex8_desc.jsp"><img src="img/main_countdown.png" width="90%"
                      height="100%"></a></div>
                <div><a href="../exhibition/now_ex/ex5_desc.jsp"><img src="img/main_love.png" width="90%"
                      height="100%"></a></div>
                <div><a href="../exhibition/now_ex/ex3_desc.jsp"><img src="img/main_shagall.png" width="90%"
                      height="100%"></a></div>
              </div>
              <div class="ex_intro_bottom">
                <div><a href="../exhibition/now_ex/ex6_desc.jsp"><img src="img/main_yosigo.png" width="90%"
                      height="100%"></a></div>
                <div><a href="../exhibition/now_ex/ex4_desc.jsp"><img src="img/main_josun.png" width="90%"
                      height="100%"></a></div>
                <div><a href="../exhibition/now_ex/ex7_desc.jsp"><img src="img/main_russian.png" width="90%"
                      height="100%"></a></div>
                <div><a href="../exhibition/now_ex/ex1_desc.jsp"><img src="img/main_hashtag.png" width="90%"
                      height="100%"></a></div>
              </div>
            </div>
            <a href="../exhibition/main_ex/now_main_ex.jsp">
              <div class="more">더 보기 <span style="color:gray"><i class="fas fa-angle-double-right"></i></span></div>
            </a>
          </div>


          <!-- 별점, 순위 파트 -->
          <div class="rank_con">
            <div class="rank_title">랭킹&nbsp <span>Ranking</span></div>
            <hr>
            <div class="rank_img">
              <div><a href=""><img src="img/rank_img.png" width="100%" height="100%"></a></div>
              <div><a href=""><img src="img/rank_img.png" width="100%" height="100%"></a></div>
              <div><a href=""><img src="img/rank_img.png" width="100%" height="100%"></a></div>
              <div><a href=""><img src="img/rank_img.png" width="100%" height="100%"></a></div>
              <div><a href=""><img src="img/rank_img.png" width="100%" height="100%"></a></div>
            </div>
            <div class="rank_star">
              <div>
                <div id="star_icon">
                  <i class="fas fa-star fa-2x"></i>
                </div>
                <div id="score"> 4.5 </div>
              </div>
              <div>
                <div id="star_icon">
                  <i class="fas fa-star  fa-2x"></i>
                </div>
                <div id="score"> 4.5 </div>
              </div>
              <div>
                <div id="star_icon">
                  <i class="fas fa-star fa-2x"></i>
                </div>
                <div id="score"> 4.5 </div>
              </div>
              <div>
                <div id="star_icon">
                  <i class="fas fa-star fa-2x"></i>
                </div>
                <div id="score"> 4.5 </div>
              </div>
              <div>
                <div id="star_icon">
                  <i class="fas fa-star fa-2x"></i>
                </div>
                <div id="score"> 4.5 </div>
              </div>
            </div>

          </div>


          <!--             리뷰 파트는 이미 상세 페이지에 있어서  필요없다 판단!!!!
            <div class="review_con">
                <div class="review_title">리뷰 Review </div>
                <div class="review_txt">
                    <div>리뷰1
                        <div>작성자 아이디</div>
                    </div>
                    <div>리뷰2
                        <div>작성자 아이디</div>
                    </div>
                    <div>리뷰3
                        <div>작성자 아이디</div>
                    </div>
                    <div>리뷰4
                        <div>작성자 아이디</div>
                    </div>
                </div>
                <div class="review_foot">
                    <button type="button" class="btn btn-danger">리뷰 남기러 가기</button>
                </div>
            </div>
 -->

          <!-- 이벤트 파트 -->
          <div class="evnet_con">
            <div class="event_title">이벤트&nbsp <span>Event</span>
              <!-- <a href=""><span style="color:black"><i class="fas fa-angle-double-right"></i></span></a> -->
            </div>
            <hr>
            <div class="event_img">
              <div><a href=""><img src="img/event_main1.png" width="100%" height="100%"></a></div>
              <div><a href=""><img src="img/event_main2.png" width="100%" height="100%"></a></div>
              <div><a href=""><img src="img/event_main3.png" width="100%" height="100%"></a></div>
            </div>
          </div>

          <!-- 탑 버튼 -->
          <div class="top">
            <button type="button" class="btn btn-danger">
              <a id="arrow-top" style="color:white" href="#topTarget"><i class="fas fa-arrow-up fa-2x"></i> </a>
            </button>
          </div>

        </div>
        <div class="footer"></div>

    </body>
	<script>
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
    </html>