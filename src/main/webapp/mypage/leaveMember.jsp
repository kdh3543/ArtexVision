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

        .contents {
          width: 85%;
          height: 100%;
          overflow-y: auto;
          display: flex;
          justify-content: center;
        }

        .contents_wrap {
          width: 90%;

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

        .contents_notice_resign {
          margin: auto;
          width: 100%;
          margin-top: 10px;
          background-color: var(--color3);
          color: var(--color2);
        }

        .contents_notice_item {
          height: 100%;
          width: 100%;
        }

        .notice {
          font-weight: bold;
          padding: 1px;
        }

        .notice_phone {
          text-align: center;
        }

        .contents_resign_mem {
          margin: auto;
          margin-top: 50px;
          width: 80%;
          height: 40%;
          background-color: var(--color3);
          color: var(--color2);
        }

        .resign_title {
          height: 15%;
          margin-top: 10px;
          background-color: #80808040;
          border-bottom: 1px solid white;
          border-top: 1px solid white;
          font-weight: bolder;

        }

		table{
			width:100%;
			text-align: center;
		}
        .write_pw>div {
          float: left;
          width: 50%;
        }

        .write_pw {
          width: 100%;
          height: 15%;
          text-align: center;
          line-height: 48px;
        }

        .resign_btn {
          width: 100%;
          text-align: center;
        }

        .footer {
          height: 150px;
          background-color: var(--color1);
        }

        .carousel img {
          width: 100%;
          height: 100%;
        }
        
        input[type="submit"]{
          background-color: var(--color7);
          font-weight: bold;
          margin-top: 10px;
          color: var(--color2);
          border: none;
          width: 25%;
          height: 30px;
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
                회원탈퇴
              </div>
              <div class="contents_notice_resign">
                <table class="contents_notice_item">
                  <tr>
                    <td class="notice">회원 탈퇴시 유의사항<br>
                      <hr>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      사용하신 계정 정보는 회원 탈퇴 후 복구가 불가합니다.<br>
                      진행 중인 거래 건이 있거나 페널티 조치 중인 경우 탈퇴 신청이 불가합니다.<br>
                      현재 보유 중인 충전 캐시 또는 수익금이 있을 경우, 캐시 환불 및 수익금 출금을 통해 정산이 완료된 이후 탈퇴를 신청하셔야 합니다.<br>
                      현재 보유 중인 쿠폰 및 마일리지는 모두 자동 소멸되며, 탈퇴 후 재가입하더라도 양도되지 않습니다.<br>
                      구매후기 및 답글은 탈퇴 시 자동 삭제되지 않습니다. 탈퇴 후에는 계정 정보가 삭제되어 본인 확인이 불가하므로, 탈퇴 신청 전에 게시글 삭제를 요청해 주시기 바랍니다.<br>
                      탈퇴 후 회원님의 정보는 전자상거래 소비자보호법에 의거한 개인정보처리방침에 따라 관리됩니다.<br>
                      <br>
                    </td>
                  </tr>
                  <tr class="notice_phone">
                    <td>
                      문의사항 및 불편한 사항 발생시 고객센터로 문의해주시기 바랍니다.<br>
                      <br>
                      고객센터 ****-****
                    </td>
                  </tr>
                </table>
              </div>
              <form action="/leave.mem" method="post">
              <div class="contents_resign_mem">
                <div>
                  회원탈퇴시 아래 정보는 모두 삭제됩니다.
                </div>
                <div class="resign_title">
                  <table>
                    <tr>
                      <td>보유쿠폰</td>
                      <td>포인트</td>
                      <td>회원등급</td>
                    </tr>
                    <tr>
                      <td>1개</td>
                      <td>2,700원</td>
                      <td>${dto.mem_grade}</td>
                    </tr>
                  </table>
                </div>
                <div class="write_pw">
                  비밀번호 <input type="password" name="pw">
                </div>
                
              </div>
              <div class="resign_btn">
                <input type="submit" value="회원탈퇴">
              </div>
              </form>
            </div>
          </div>
          <div class="empty"></div>
        </div>
        <div class="footer">

        </div>
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