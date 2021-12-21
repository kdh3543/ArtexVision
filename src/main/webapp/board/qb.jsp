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
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sEqbO0LRn5q+8qbTov4+1p"
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

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
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

.contents {
	width: 80%;
}

.footer {
	height: 150px;
	background-color: var(--color1);
}

.container2 {
	overflow: hidden;
	height: 800px;
}

.sidebar {
	float: left;
	width: 15%;
}

.board_qb_content {
	float: left;
	width: 85%;
	padding: 15px;
}

.board_qb_head {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	overflow: hidden;
	text-align: center;
	height: 30px;
	line-height: 30px;
}

.board_qb_boardname {
	overflow: hidden;
}

.board_qb_boardname>div {
	float: left;
}

.board_qb_prevboard {
	margin-right: 5px;
}

.board_qb_prevboard:hover {
	cursor: pointer;
}

.board_qb_presentboard {
	margin-left: 5px;
}

.board_qb_presentboard:hover {
	cursor: pointer;
}

.board_qb_head>div {
	float: left;
}

.board_qb_num {
	width: 10%;
}

.board_qb_title {
	width: 55%;
}

.board_qb_writer {
	width: 10%;
}

.board_qb_write_date {
	width: 15%;
}

.board_qb_view_count {
	width: 10%;
}

.board_qb_notice {
	border-bottom: 1px solid black;
	overflow: hidden;
	text-align: center;
	background-color: lightgray;
	height: 30px;
	line-height: 30px;
}

.board_qb_notice>div {
	float: left;
}

.board_qb_notice_num {
	width: 10%;
}

.board_qb_notice_title {
	width: 55%;
}

.board_qb_notice_title:hover {
	cursor: pointer;
}

.board_qb_notice_writer {
	width: 10%;
}

.board_qb_notice_write_date {
	width: 15%;
}

.board_qb_notice_view_count {
	width: 10%;
}

.board_qb_user_write {
	border-bottom: 1px solid black;
	overflow: hidden;
	text-align: center;
	height: 30px;
	line-height: 30px;
}

.board_qb_user_write>div {
	float: left;
}

.board_qb_user_num {
	width: 10%;
}

.board_qb_user_title {
	width: 55%;
}

.board_qb_user_title:hover {
	cursor: pointer;
}

.board_qb_user_writer {
	width: 10%;
}

.board_qb_user_write_date {
	width: 15%;
}

.board_qb_user_view_count {
	width: 10%;
}

.board_qb_search_area {
	text-align: center;
}

.board_qb_search_area>select {
	width: 10%;
}

.board_qb_search {
	width: 40%;
	height: 25px;
}

.board_qb_search_btn {
	height: 25px;
}

.board_qb_pagination {
	overflow: hidden;
	text-align: center;
}

.board_qb_page {
	text-align: text;
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
                <li><a href="../artexDesc/artex_desc.jsp">Artex Vision</a></li>
                <li><a href="../exhibition/main_ex/now_main_ex.jsp">전시</a></li>
                <li><a href="#" id="event">이벤트</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="carousel_timeline">
          <div class="carousel">
            <img src="/exhibition/img/artex_main_img.png" class="carousel_img">
          </div>
        </div>
		<div class="container2">
			<div class="sidebar">
				<h2 class="list_title">NOTICE</h2>
				<ul class="sidebar_item_list">
					<li class="sidebar_item"><a href="/nb_list.board?cpage=1">공지사항</a></li>					
                    <li class="sidebar_item"><a href="/qb_list.board?cpage=1">Q&A</a></li>
                    <li class="sidebar_item"><a href="/board/faq_home.jsp">FAQ</a></li>
				</ul>
			</div>
			<div class="board_qb_content">
				<br>
				<div class="board_qb_boardname">
					<div class="board_qb_prevboard">NOTICE</div>
					<div>></div>
					<div class="board_qb_presentboard">Q&A</div>
					
				</div>
				<hr>
				<div class="board_qb_head">
					<div class="board_qb_num">글번호</div>
					<div class="board_qb_title">제목</div>
					<div class="board_qb_writer">아이디</div>
					<div class="board_qb_write_date">작성일</div>
					<div class="board_qb_view_count">조회수</div>
				</div>
				<c:forEach var="questionboard_dto" items="${qb_list}">
				<div class="board_qb_notice">
					<div class="board_qb_notice_num">${questionboard_dto.qb_seq }</div>
					<div class="board_qb_notice_title"><a href="/qb_detail.board?qb_seq=${questionboard_dto.qb_seq }" style="text-decoration:none; color:black;">${questionboard_dto.qb_title }</a></div>
					<div class="board_qb_notice_writer">${questionboard_dto.qb_mem_id }</div>
					<div class="board_qb_notice_write_date">${questionboard_dto.detailDate }</div>
					<div class="board_qb_notice_view_count">${questionboard_dto.qb_view_count }</div>
				</div>
				</c:forEach>
				<br>
				<div class="board_qb_user_writebtn" style="text-align: right;">
					<a href="/qb_write.board"><button type=button>글쓰기</button></a>
				</div>
				<div class="board_qb_pagination">
					<div class="board_qb_page">
						<div>${qb_navi }</div>
					</div>
				</div>
				<form action="/qb_search.board" id="frmSearch">
				<div class="board_qb_search_area">
					<select id="searchOption" name="searchOption">
						<option name="searchTitle">제목</option>
						<option name="searchId">아이디</option>
					</select> <input type=text placeholder="검색어를 입력하세요" class="board_qb_search">
					<input type=button value="검색" class="board_qb_search_btn" onclick="search();">
				</div>
				</form>
			</div>
		</div>
		<!-- 커뮤니티 end -->
		
		<div class="footer"></div>
	</div>
	
	
	<script>
		function search(){
			let searchOption = document.getElementById("searchOption");
			let searchOptionIndex = document.getElementById("searchOption").options.selectedIndex;
			
			if(searchOption.options[searchOptionIndex].value != ""){

				$("#frmSearch").submit();
			}
			console.log("선택된 옵션 : " + searchOption.options[searchOptionIndex].value);
		}
		$("#logout").on("click", function () {
	          if (!confirm("로그아웃 하시겠습니까?")) {
	            return false;
	          }
	        })

	        $("#basket").on("click", function () {
	          alert("현재 기능은 구현중에 있습니다.");
	          return false;
	        })
	       
	        $("#event").on("click", function () {
	          alert("현재 기능은 구현중에 있습니다.");
	          return false;
	        })
	</script>
</body>
</html>