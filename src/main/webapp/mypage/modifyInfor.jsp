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

        .modify_box {
          margin: auto;
          width: 450px;
          height: fit-content;
          margin-top: 30px;
          margin-bottom: 30px;
          padding-top: 30px;
          padding-bottom: 20px;
          background-color: var(--color3);
          color: var(--color2);

        }

        .label {
          height: 30px;
          padding-left: 20px;
        }

        label {
          color: var(--color2);
          line-height: 30px;
          font-weight: bold;
        }

        #gradeBenefit {
          text-align: right;
        }

        .input_id,
        .input_pw,
        .input_pw2,
        .input_name,
        .input_birth,
        .input_email,
        .input_phone,
        .input_zipcode,
        .input_addr1,
        .input_addr2,
        .input_account,
        .btns,
        .back_btn,
        .grade {
          height: 40px;
          line-height: 40px;
          padding-left: 20px;
        }

        #grade_score {
          padding-right: 70px;
        }

        #grade_score i {
          color: silver;
        }

        #id,
        #pw1,
        #pw2,
        #name,
        #birth,
        #email,
        #phone,
        #phone1,
        #phone2,
        #zipcode,
        #addr1,
        #addr2,
        #account {
          background-color: transparent;
          border: 0;
          border-bottom: 1px solid var(--color2);
          color: var(--color2);
          font-size: 1rem;
        }

        #id:focus,
        #pw1:focus,
        #pw2:focus,
        #name:focus,
        #birth:focus,
        #email:focus,
        #phone:focus,
        #phone1:focus,
        #phone2:focus,
        #zipcode:focus,
        #addr1:focus,
        #addr2:focus,
        #account:focus {
          outline: none;
        }

        #id::placeholder,
        #pw1::placeholder,
        #pw2::placeholder,
        #name::placeholder,
        #birth::placeholder,
        #email::placeholder,
        #phone::placeholder,
        #phone1::placeholder,
        #phone2::placeholder,
        #zipcode::placeholder,
        #addr1::placeholder,
        #addr2::placeholder,
        #account::placeholder {
          color: var(--color2);
          font-size: 0.8rem;
        }

        #birth {
          color: var(--color2);
          font-size: 0.8rem;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
          background-color: var(--color2);
          cursor: pointer;
        }

        select {
          color: var(--color2);
        }

        select option {
          color: var(--color1);
        }

        #phone1,
        #phone2 {
          width: 50px;
        }

        #zipcode {
          width: 100px;
        }

        #addr1,
        #addr2 {
          width: 80%;
        }

        input[type="button"],
        input[type="submit"],
        input[type="reset"] {
          background-color: var(--color7);
          color: var(--color2);
          border: none;
          width: 25%;
          height: 30px;
          cursor: pointer;
        }

        #find_zipcode_wrap {
          padding-left: 30px;
        }

        .contents {
          width: 85%;
          height: 100%;
          display: flex;
          justify-content: center;
          overflow-y: auto;
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

        .contents_wrap {
          width: 90%;
        }

        .pw_check_result {
          height: 10px;
          line-height: 10px;
          padding-left: 20px;
          font-size: 0.8rem;
          font-weight: bold;
          margin-bottom: 10px;
        }

        .footer {
          height: 150px;
          background-color: var(--color1);
        }

        .carousel img {
          width: 100%;
          height: 100%;
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
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${dto.mem_grade}</li></span>
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
                <li><a href="#" id="notice">NOTICE</a></li>
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
                회원 정보 수정
              </div>
              <form action="/modifyInfor.mem" method="post" id="frm">
                <div class="modify_box">

                  <div class="modify_contents">
                    <div class="modify_input">
                      <div class="label">
                        <label for="id">아이디</label>
                      </div>
                      <div class="input_id">
                        ${loginId}
                      </div>
                      <div class="label">
                        <label for="grade">회원 등급</label>
                      </div>
                      <div class="grade">
                        <span id="grade_score">
                          <i class="fas fa-crown"></i>
                          ${dto.mem_grade} (POINT : 0 점)
                        </span>
                        <span id="gradeBenefit">
                          <a href="#none" target="_blank" onclick="openPop()"><input type="button" id="showGradeBenefit"
                              value="등급별 혜택"></a>
                        </span>
                      </div>
                      <div class="label">
                        <label for="pw1">패스워드</label>
                      </div>
                      <div class="input_pw">
                        <input type="password" name="pw1" id="pw1" placeholder="비밀번호를 입력하세요">
                      </div>
                      <div class="label">
                        <label for="pw2">패스워드 확인</label>
                      </div>
                      <div class="input_pw2">
                        <input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인을 입력하세요">
                      </div>
                      <div class="pw_check_result" id="pw_check_result">

                      </div>
                      <div class="label">
                        <label for="name">이름</label>
                      </div>
                      <div class="input_name" >
                        ${dto.mem_name}
                      </div>
                      <div class="label">
                        <label for="birth">생년월일</label>
                      </div>
                      <div class="input_birth">
                        ${dto.mem_birth }
                      </div>
                      <div class="label">
                        <label for="email">이메일</label>
                      </div>
                      <div class="input_email">
                        <input type="email" name="email" id="email" placeholder="이메일을 입력하세요">
                      </div>
                      <div class="label">
                        <label for="phone">전화번호</label>
                      </div>
                      <div class="input_phone">
                        <select id="phone" name="phone">
                          <option value="010">010</option>
                          <option value="011">011</option>
                          <option value="016">016</option>
                          <option value="017">017</option>
                          <option value="018">018</option>
                          <option value="019">019</option>
                        </select>
                        -
                        <input type="text" name="phone1" id="phone1">
                        -
                        <input type="text" name="phone2" id="phone2">
                      </div>
                      <div class="label">
                        <label for="zipcode">우편번호</label>
                      </div>
                      <div class="input_zipcode">
                        <input type="text" name="zipcode" id="zipcode">
                        <span id="find_zipcode_wrap">
                          <input type="button" value="우편번호 찾기" id="find_zipcode">
                        </span>
                      </div>
                      <div class="label">
                        <label for="addr1">주소</label>
                      </div>
                      <div class="input_addr1">
                        <input type="text" name="addr1" id="addr1">
                      </div>
                      <div class="label">
                        <label for="addr2">상세주소</label>
                      </div>
                      <div class="input_addr2">
                        <input type="text" name="addr2" id="addr2">
                      </div>
                      <div class="label">
                        <label for="account">계좌번호 등록 (선택) </label>
                      </div>
                      <div class="input_account">
                        <input type="text" name="account" id="account" placeholder="계좌번호를 입력하세요">
                      </div>
                      <div class="btns">
                        <input type="submit" value="수정하기" id="modify_btn">
                        <input type="reset" value="다시입력" id="reset_btn">
                        <input type="button" value="뒤로가기" id="back_btn">
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>

        </div>
        <div class="footer">

        </div>
        <script>
          function openPop() {
            var popup = window.open("/memberGrade.mem", '회원 등급', 'width=800px,height=600px,scrollbars=yes top=200px, left=200px');
          }

          let frm = $("#frm");
          let pw1 = $("#pw1");
          let pw2 = $("#pw2");
          let pw_check_result = $("#pw_check_result");
          let reset_btn = $("#reset_btn");

          pw2.on("keyup", function () {
            if (pw1.val() != pw2.val()) {
              pw_check_result.css("color", "red");
              pw_check_result.text("비밀번호가 일치하지 않습니다.");
            } else {
              pw_check_result.css("color", "green");
              pw_check_result.text("비밀번호가 일치합니다.");
            }
            if (pw1.val() == "" && pw2.val() == "") {
              pw_check_result.text("");
            }
          })

          pw1.on("keyup", function () {
            if (pw1.val() != pw2.val()) {
              pw_check_result.css("color", "red");
              pw_check_result.text("비밀번호가 일치하지 않습니다.");
            } else {
              pw_check_result.css("color", "green");
              pw_check_result.text("비밀번호가 일치합니다.");
            }
            if (pw1.val() == "" && pw2.val() == "") {
              pw_check_result.text("");
            }
          })
          frm.on("submit", function () {
            if (pw2.val() != pw1.val()) {
              alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
              pw1.val("");
              pw2.val("");
              pw_check_result.text("");
              return false;
            }
          })

          document.getElementById("find_zipcode").onclick = function () {
            new daum.Postcode({
              oncomplete: function (data) {
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr1").value = data.roadAddress;
              }
            }).open();
          }

          reset_btn.on("click",function(){
            pw_check_result.text("");
          })
          
          	$("#logout").on("click",function(){
				if(!confirm("로그아웃 하시겠습니까?")){
					return false;
				}
			})
			
			$("#basket").on("click",function(){
				alert("현재 기능은 구현중에 있습니다.");
				return false;
			})
			$("#notice").on("click",function(){
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