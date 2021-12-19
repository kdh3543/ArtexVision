<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
     
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
          display: flex;
          justify-content: center;
        }

        .contents_title {
          width: 100%;
          height: 60px;
          font-size: 25px;
          padding: 3px;
          border-bottom: 2px solid black;
          font-weight: bold;
        }

        .booking {
          margin-top: 50px;
          width: 100%;
          background-color: var(--color3);
          color: var(--color2);
        }

        .book_title {
          margin-top: 10px;
          width: 100%;
          height: 60px;
          background-color: #80808040;
          line-height: 60px;
          border-bottom: 1px solid white;
          border-top: 1px solid white;
        }

        .book_title>div {
          text-align: center;
          height: 100%;
          width: 25%;
          float: left;
        }

        .book_table{
          width: 100%; 
          table-layout:fixed;
          border-collapse: collapse;
        }
        
        .book_contents {
          height: 20%;
          width: 100%;
          height: 100px;
          border-bottom: 1px solid white;
          text-align: center;
        }

        .book_contents>div {
          text-align: center;
          float: left;
          width: 25%;
          height: 100%;
        }

        .cancel_btn {
          text-align: center;
          height: 20%;
          line-height: 120px;
        }

        .footer {
          height: 150px;
          background-color: var(--color1);
        }

        .carousel img {
          width: 100%;
          height: 100%;
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

        input[type="checkbox"] {
          width: 15px;
          height: 15px;
          cursor: pointer;
        }
      </style>
    </head>

    <body>
      <div class="container">
        <div class="header">
          <ul class="header_list">
            <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${dto.mem_grade}</li></span>
            <li> ${loginId } 님 환영합니다.</li>
            <li><a href="/modifyForm.mem">마이페이지</a></li>
            <li><a href="#">장바구니</a></li>
            <!-- <li><a href="#">로그인</a></li> -->
            <li><a href="/logout.mem">로그아웃</a></li>
            <!-- <li><a href="#">회원가입</a></li> -->
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
              </ul>
            </div>
          </div>
        </div>
        <div class="carousel_timeline">
          <div class="carousel">
            <img src="sample_carousel.png" class="carousel_img">
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
              <li class="sidebar_item"><a href="">예매내역 조회/취소</a></li>
            </ul>
            <!-- 마이페이지 end -->

          </div>
          <div class="contents">
            <div class="contents_wrap">
              <div class="contents_title">
                예매내역 취소/환불
              </div>
              <div class="booking">
                <select>
                  <option>검색</option>
                  <option>단체예약 확인</option>
                  <option>전시회 예약 확인</option>
                  <option>신청일 기준 확인</option>
                </select>
                <div class="book_title">
                  <div>예매 내역</div>
                  <div>예매 번호</div>
                  <div>전시회 날짜</div>
                  <div>선택</div>
                </div>
                <table class="book_table" >
                  <c:forEach var="book_dto" items="${list}">
                    <tr class="book_contents">
                      <td>${book_dto.bk_id}</td>
                      <td>${book_dto.bk_ex_id}</td>
                      <td>${book_dto.bk_ex_start_date} ~ ${book_dto.bk_ex_end_date}</td>
                      <td><input type="checkbox" name="check" id="check"></td>
                    </tr>
                  </c:forEach>
                </table>
              </div>
              <div class="cancel_btn">
                <input type="button" value="예매취소" id="cancel">
              </div>
            </div>
          </div>
        </div>
        <div class="footer">

        </div>
      </div>
      <script>
        let cancel = $("#cancel");
        let check = $("input[type='checkbox']");
        cancel.on("click", function(){
          let trs=$("tr");
          
          for(let i =0;i<trs.length;i++){
            if(check.eq(i).is(":checked")){
            	confirm("정말 취소하시겠습니까?");
              $(trs[i]).remove();
            }
          }
        })
      </script>
    </body>

    </html>