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

        .popup_box {
          margin: auto;
          width: 1000px;
          margin-top: 30px;
          margin-bottom: 30px;
          padding-top: 50px;
          background-color: var(--color3);
          color: var(--color2);
          padding-bottom: 10px;
        }

        .popup_logo {
          padding-left: 20px;
          padding-right: 20px;
          color: var(--color2);
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

        .member_rank {
          width: 100%;
          height: 90%;
        }

        .rank_empty {
          width: 100%;
          height: 10%;
        }

        .rank_title {
          width: 100%;
          height: 10%;
          text-align: center;
          line-height: 70px;
          background-color: #80808040;
          font-weight: bold;
          font-size: 20px;
        }

        .rank_title>div {
          float: left;
          height: 100%;
          width: 25%;
        }

        .rank_contents {
          width: 100%;
          height: 12%;
          text-align: center;
          line-height: 85px;
        }

        .rank_contents>div {
          float: left;
          height: 100%;
          width: 25%;
        }

        .closeBtn{
          width: 100%;
          text-align: center;
        }
      </style>
    </head>

    <body>

        <div class="popup_box">
          <div class="popup_logo">
            <h2>회원등급</h2>
            <hr>
          </div>
          <div class="member_rank">
            <div class="rank_empty"></div>
            <div class="rank_title">
              <div id="line">등급 점수</div>
              <div id="line">추가 할인</div>
              <div id="line">추가 적립</div>
              <div>등급 추가 혜택</div>
            </div>
            <div class="rank_contents">
              <div>~2000점 : 모든 고객</div>
              <div>할인 없음</div>
              <div>1% 추가 할인</div>
              <div>혜택 없음</div>
            </div>
            <div class="rank_contents">
              <div>2001점 ~ 5000점 : 실버</div>
              <div>3% 추가 할인</div>
              <div>3% 추가 적립</div>
              <div>혜택 없음</div>
            </div>
            <div class="rank_contents">
              <div>5001점 ~ 8000점 : 골드</div>
              <div>5% 추가 할인</div>
              <div>5% 추가 적립</div>
              <div>3% 할인 쿠폰 1개</div>
            </div>
            <div class="rank_contents">
              <div>8001점 ~ 10000점 : 플래티넘</div>
              <div>7% 추가 할인</div>
              <div>7% 추가 적립</div>
              <div>5% 할인 쿠폰 1개</div>
            </div>
            <div class="rank_contents">
              <div>10001점 ~ : 다이아</div>
              <div>10% 추가 할인</div>
              <div>10% 추가 적립</div>
              <div>5% 할인 쿠폰 3개</div>
            </div>
            
          </div>
          <div class="closeBtn">
            <input type="button" value="닫기" id="close">
          </div>
        </div>
        <script>
          $("#close").on("click",function(){
            self.close();
          })
        </script>
    </body>

    </html>