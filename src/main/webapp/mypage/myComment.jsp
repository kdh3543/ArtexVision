<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>마이페이지</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
      <style>
        /* 전체 설정 css start */
        input:-webkit-autofill,
        input:-webkit-autofill:hover,
        input:-webkit-autofill:focus,
        input:-webkit-autofill:active {
          /* transition: background-color 5000s ease-in-out 0s; */
          transition: background-color 9999s ease-out;
          box-shadow: 0 0 0px 1000px transparent inset !important;
          -webkit-text-fill-color: var(--color2) !important;
        }

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
          height: 800px;
        }

        .main>div {
          float: left;
        }

        .sidebar {
          width: 15%;
          height: 100%;
          background-color: var(--color3);
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

        .contents_wrap {
          width: 90%;
        }

        .contents {
          width: 85%;
          height: 100%;
          overflow-y: auto;
          display: flex;
          justify-content: center;
        }


        .contents_title {
          width: 100%;
          height: 10%;
          font-size: 25px;
          padding: 3px;
          border-bottom: 2px solid black;
          line-height: 70px;
          font-weight: bold;
        }

        .user_write {
          width: 100%;
          height: 70%;
        }

        .user_title {
          margin-top: 20px;
          width: 100%;
          height: 4%;
          text-align: center;
          border-bottom: 1px solid black;
          border-top: 1px solid black;
          background-color: #80808040;
          font-weight: bold;
        }

        .user_title>div {
          float: left;
          height: 100%;
        }

        .wnum {
          width: 10%;
        }

        .wtitle {
          width: 50%;
        }

        .wdate,
        .wreadnum {
          width: 20%;
        }

        .rank_contents {
          width: 100%;
          height: 5%;
          text-align: center;
          line-height: 34px;
          border-bottom: 1px solid black;
        }

        .rank_contents>div {
          float: left;
          height: 100%;
        }

        .page {
          width: 100%;
          height: 5%;
          text-align: center;
          line-height: 40px;
        }

        .board_nb_content {
          float: left;
          width: 85%;
          padding: 15px;
        }

        .board_nb_head {
          margin-top: 10px;
          border-top: 1px solid black;
          border-bottom: 1px solid black;
          overflow: hidden;
          text-align: center;
          height: 30px;
          line-height: 30px;
        }

        .board_nb_head>div {
          float: left;
        }

        .board_nb_num {
          width: 10%;
        }

        .board_nb_title {
          width: 55%;
        }

        .board_nb_writer {
          width: 10%;
        }

        .board_nb_write_date {
          width: 15%;
        }

        .board_nb_view_count {
          width: 10%;
        }

        .board_nb_notice {
          border-bottom: 1px solid black;
          overflow: hidden;
          text-align: center;
          background-color: lightgray;
          height: 30px;
          line-height: 30px;
        }

        .board_nb_notice>div {
          float: left;
        }

        .board_nb_notice_num {
          width: 10%;
        }

        .board_nb_notice_title {
          width: 55%;
        }

        .board_nb_notice_title:hover {
          cursor: pointer;
        }

        .board_nb_notice_writer {
          width: 10%;
        }

        .board_nb_notice_write_date {
          width: 15%;
        }

        .board_nb_notice_view_count {
          width: 10%;
        }

        .board_nb_user_write {
          border-bottom: 1px solid black;
          overflow: hidden;
          text-align: center;
          height: 30px;
          line-height: 30px;
        }

        .board_nb_user_write>div {
          float: left;
        }

        .board_nb_user_num {
          width: 10%;
        }

        .board_nb_user_title {
          width: 55%;
        }

        .board_nb_user_title:hover {
          cursor: pointer;
        }

        .board_nb_user_writer {
          width: 10%;
        }

        .board_nb_user_write_date {
          width: 15%;
        }

        .board_nb_user_view_count {
          width: 10%;
        }

        .board_nb_search_area {
          text-align: center;
        }

        .board_nb_search_area>select {
          width: 10%;
        }

        .board_nb_search {
          width: 40%;
          height: 25px;
        }

        .board_nb_search_btn {
          height: 25px;
        }

        .board_nb_pagination {
          overflow: hidden;
          text-align: center;
        }

        .board_nb_page {
          text-align: text;
        }

        .footer {
          height: 150px;
          background-color: var(--color1);
        }

        .carousel img {
          width: 100%;
          height: 100%;
        }

        [type=button]:hover {
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

            <!-- 마이페이지 start -->
            <h2 class="list_title">마이페이지</h2><br>
            <h3 class="list_title">회원 정보</h3>
            <ul class="sidebar_item_list">
              <li class="sidebar_item"><a href="/modifyForm.mem">회원 정보 수정</a></li>
              <li class="sidebar_item"><a href="/myCommentForm.mem">내가 쓴 글/댓글</a></li>
              <li class="sidebar_item"><a href="/leaveForm.mem">회원 탈퇴</a></li>
            </ul>
            <h3 class="list_title">예매 내역</h3>
            <ul class="sidebar_item_list">
              <li class="sidebar_item"><a href="/bookRefund.book">예매내역 조회/취소</a></li>
            </ul>
            <!-- 마이페이지 end -->

          </div>
          <div class="contents">
            <div class="contents_wrap">
              <div class="contents_title">
                내가 쓴 글, 댓글 조회
              </div>
              <div class="board_nb_head">
                <div class="board_nb_num">글번호</div>
                <div class="board_nb_title">제목</div>
                <div class="board_nb_writer">아이디</div>
                <div class="board_nb_write_date">작성일</div>
                <div class="board_nb_view_count">조회수</div>
              </div>
              <div class="board_nb_notice">
                <div class="board_nb_notice_num">-</div>
                <div class="board_nb_notice_title">올린글</div>
                <div class="board_nb_notice_writer">올린사람 id</div>
                <div class="board_nb_notice_write_date">방금 전</div>
                <div class="board_nb_notice_view_count">100</div>
              </div>
              <c:forEach var="noticeboard_dto" items="${nb_list}">
                <div class="board_nb_user_write">
                  <div class="board_nb_user_num">${noticeboard_dto.nb_seq }</div>
                  <div class="board_nb_user_title"><a href="/nb_detail.board?nb_seq=${noticeboard_dto.nb_seq }"
                      style="text-decoration:none; color:black;">${board_dto.nb_title }</a></div>
                  <div class="board_nb_user_writer">${noticeboard_dto.nb_mem_id }</div>
                  <div class="board_nb_user_write_date">${noticeboard_dto.detailDate }</div>
                  <div class="board_nb_user_view_count">${noticeboard_dto.nb_view_count }</div>
                </div>
              </c:forEach>
              <br>
              <div class="board_nb_user_writebtn" style="text-align: right;">
                <a href="/nb_write.board"><button type=button>글쓰기</button></a>
              </div>
              <div class="board_nb_pagination">
                <div class="board_nb_page">
                  <div>${nb_navi }</div>
                </div>
              </div>
              <div class="board_nb_search_area">
                <select>
                  <option>제목</option>
                </select> <input type=text placeholder="검색어를 입력하세요" class="board_nb_search">
                <input type=button value="검색" class="board_nb_search_btn">
              </div>

            </div>
          </div>

        </div>
        <div class="footer">
            <div class="fContainer">
              <div class="fLogo">
                <i class="fab fa-artstation" id="fLogoImg"> Artex Vision</i>
              </div>
              <div></div>

            </div>
        </div>
        <style>
          .fContainer{
            width: 100%;
            height: 100%;
          }
          .fContainer>div{
            float: left;
          }
          .fLogo{
            height: 100%;
            width: 30%;
            text-align: center;
            line-height: 150px;
          }
          #fLogoImg{
            font-size: 40px;
            color: white;
          }
        </style>
      </div>
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

	</script>
    </html>