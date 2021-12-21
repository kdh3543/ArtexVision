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
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sEnbO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        
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

        .container2 {
            height: 800px;
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
        }

        .sidebar {
            float: left;
            width: 15%;
            height: 100%;
        }

        .board_nb_content {
            float: left;
            width: 85%;
            padding: 15px;
        }

        .board_nb_head {
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            overflow: hidden;
            text-align: center;
            height: 30px;
            line-height: 30px;
        }

        .board_nb_boardname {
            overflow: hidden;
        }

        .board_nb_boardname>div {
            float: left;
        }

        .board_nb_prevboard {
            margin-right: 5px;
        }

        .board_nb_prevboard:hover {
            cursor: pointer;
        }

        .board_nb_presentboard {
            margin-left: 5px;
        }

        .board_nb_presentboard:hover {
            cursor: pointer;
        }

        .board_nb_head>div {
            float: left;
        }

        .board_nb_num {
            width: 10%;
        }

        .board_nb_writer {
            width: 10%;
        }

        .board_nb_write_date {
            width: 10%;
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
            width: 60%;
        }

        .board_nb_notice_title:hover {
            cursor: pointer;
        }

        .board_nb_notice_writer {
            width: 10%;
        }

        .board_nb_notice_write_date {
            width: 10%;
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
            width: 60%;
        }

        .board_nb_user_title:hover {
            cursor: pointer;
        }

        .board_nb_user_writer {
            width: 10%;
        }

        .board_nb_user_write_date {
            width: 10%;
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

        
        #nb_title, #nb_contents{
        	border: 0px;
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
                <h2 class="list_title">NOTICE </h2>
                <ul class="sidebar_item_list">
                    <li class="sidebar_item"><a href="/nb_list.board?cpage=1">공지사항</a></li>                    
                    <li class="sidebar_item"><a href="">Q&A</a></li>
                    <li class="sidebar_item"><a href="/board/faq_home.jsp">FAQ</a></li>
                </ul>
            </div>
            <br>
            <div class="board_nb_content">
                <div class="board_nb_boardname">
                    <div class="board_nb_prevboard">NOTICE</div>
                    <div>></div>
                    <div class="board_nb_presentboard"><a href="/nb_list.board?cpage=1" style="text-decoration:none; color:black;">공지사항</a></div>
                </div>
                <hr>
                <form action="/nb_modify.board" id = "frmDetail">
                    <div class="board_nb_write" style="width:100%;">
                    	<input type=hidden value="${noticeboard_dto.nb_seq }" name=nb_seq>
                        <div class="board_nb_title"><input type=text placeholder="제목을 입력하세요"
                                style="width:100%;" name="nb_title" id="nb_title" readonly value="${noticeboard_dto.nb_title }"></div>
                                <hr>
                        <div class="board_nb_contents"><textarea placeholder="내용을 입력하세요."
                                style="width:100%; margin-top:10px; height: 330px;" readonly name="nb_contents" id="nb_contents">${noticeboard_dto.nb_contents }</textarea></div>
                    </div>
                    <br>
                    <div class="board_nb_user_writebtn" style="text-align: right;">
 				<a href="javascript:history.back()"><button type=button id=toList>목록으로</button></a>
				<c:if test="${noticedto.writer == loginID}">
					<button type=button id=mod>수정하기</button>
					<button type=button id=del>삭제하기</button>
					<button type=button id=modOk style="display:none;">수정완료</button>
					<button type=button id=modCancel style="display:none;">취소</button>
				</c:if>
                    </div>
                </form>
                <br>
            </div>
        </div>

        <!-- 커뮤니티 end -->        
        <div class="footer"></div>        

        <!-- 커뮤니티 end -->
        <div class="footer">

        </div>

    </div>
    
    <script>
		$("#del").on("click",function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="/nb_delete.board?nb_seq=${noticeboard_dto.nb_seq}";
			}
		});
		
		$("#toList").on("click",function(){
			location.href="/nb_list.board";			
		});
		
		let bkTitle = "";
		let bkContents = "";
		
		$("#mod").on("click",function(){
			
			bkTitle = $("#nb_title").val();
			bkContents = $("#nb_contents").val();
			
			$("#nb_title").removeAttr("readonly");
			$("#nb_contents").removeAttr("readonly");
			$("#mod").css("display","none");
			$("#del").css("display","none");
			$("#modOk").css("display","inline");
			$("#modCancel").css("display","inline");
		});
		
		$("#modOk").on("click",function(){
			if(confirm("이대로 수정하시겠습니까?")){
				$("#frmDetail").submit();
			}
		});
		
		$("#modCancel").on("click",function(){
			if(confirm("정말 취소하시겠습니까?")){
				$("#nb_title").val(bkTitle);
				$("#nb_contents").val(bkContents);
				$("#nb_title").attr("readonly","");
				$("#nb_contents").attr("readonly","");
				$("#mod").css("display","inline");
				$("#del").css("display","inline");
				$("#modOk").css("display","none");
				$("#modCancel").css("display","none");
			}
		})
		
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