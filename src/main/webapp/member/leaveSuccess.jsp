<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

        .find_id_box {
          margin: auto;    
          width: 450px;
          margin-top: 100px;
          padding-top: 50px;
          background-color: var(--color3);
          color: var(--color2);
          text-align: center;
        }
        .btns{
          width: 100%;
          margin-top: 20px;
          height: 50px;
          text-align: center;
        }
        input[type="button"] {
          background-color: var(--color7);
          color: var(--color2);
          border: none;
          width: 25%;
          height: 30px;
          cursor: pointer;
        }
      </style>
    </head>

    <body>
      <c:choose>
        <c:when test="${result==1}">
          <div class="find_id_box">
            회원탈퇴가 완료되었습니다.<br>
            <div class="btns">
              <input type="button" value="로그인" id="backLogin">
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <div class="find_id_box">
            비밀번호를 잘못 입력하였습니다.<br>
            다시 입력해주세요.
            <div class="btns">
              <a href="javascript:history.back()"><input type="button" value="뒤로가기"></a>
            </div>
          </div>
        </c:otherwise>
      </c:choose>
    </body>
    <script>
      $("#backLogin").on("click",function(){
        location.href="/logout.mem";
      })
    </script>
    </html>