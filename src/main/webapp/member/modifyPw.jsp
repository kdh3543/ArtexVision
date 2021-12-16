<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>modifyPw</title>
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

        .reset_pw_box {
          margin: auto;
          width: 450px;
          margin-top: 30px;
          margin-bottom: 30px;
          padding-top: 50px;
          background-color: var(--color3);
          color: var(--color2);
        }

        .reset_pw_logo {
          padding-left: 20px;
          padding-right: 20px;
          color: var(--color2);
        }

        .reset_pw_input {
          padding-top: 30px;
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

        .input_id,
        .input_pw,
        .input_pw2,
        .input_name,
        .input_email,
        .input_phone,
        .btns,
        .back_btn {
          height: 50px;
          line-height: 50px;
          padding-left: 20px;
        }

        #id,
        #pw1,
        #pw2,
        #name,
        #email,
        #phone,
        #phone1,
        #phone2 {
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
        #email:focus,
        #phone:focus,
        #phone1:focus,
        #phone2:focus {
          outline: none;
        }

        #id::placeholder,
        #pw1::placeholder,
        #pw2::placeholder,
        #name::placeholder,
        #email::placeholder,
        #phone::placeholder,
        #phone1::placeholder,
        #phone2::placeholder {
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

        .btns {
          text-align: center;
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

        .find_pw_box {
          margin: auto;
          width: 450px;
          margin-top: 100px;
          padding-top: 50px;
          background-color: var(--color3);
          color: var(--color2);
          text-align: center;
        }

        .pw_check_result {
          height: 10px;
          line-height: 10px;
          padding-left: 20px;
          font-size: 0.8rem;
          font-weight: bold;
          margin-bottom: 10px;
        }
      </style>
    </head>

    <body>
      <c:choose>
        <c:when test="${id!=null }">
          <form action="/modifyPw.mem" method="post">
            <div class="reset_pw_box">
              <div class="reset_pw_logo">
                <h2>비밀번호 재설정</h2>
                <hr>
              </div>
              <div class="reset_pw_contents">
                <div class="reset_pw_input">
                  <div class="label">
                    <label for="id">아이디</label>
                  </div>
                  <div class="input_id">
                    <input type="hidden" name="id" value="${id}">
                    ${id}
                  </div>
                  <div class="label">
                    <label for="pw1">패스워드</label>
                  </div>
                  <div class="input_pw">
                    <input type="password" name="pw1" id="pw1" placeholder="새로운 비밀번호를 입력하세요">
                  </div>
                  <div class="label">
                    <label for="pw2">패스워드 확인</label>
                  </div>
                  <div class="input_pw2">
                    <input type="password" name="pw2" id="pw2" placeholder="비밀번호를 한 번 더 입력하세요">
                  </div>
                  <div class="pw_check_result" id="pw_check_result">

                  </div>
                  <div class="btns">
                    <input type="submit" value="패스워드 변경" id="reset_pw_btn">
                    <a href="javascript:history.back()"><input type="button" value="뒤로가기" id="back_btn"></a>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </c:when>
        <c:otherwise>
          <div class="find_pw_box">
            등록되지 않은 정보입니다.<br>
            정보를 다시 입력하시거나 회원가입을 진행해주세요.
            <div class="btns">
              <a href="/confirmInfor.mem"><input type="button" value="다시 입력"> </a>
              <a href="/signup.mem"><input type="button" value="회원 가입"> </a>
              <a href="/home.mem"><input type="button" value="홈으로"></a>
            </div>
          </div>
        </c:otherwise>
      </c:choose>

      <script>
        let pw1 = $("#pw1");
        let pw2 = $("#pw2");
        let pw_check_result = $("#pw_check_result");
        let reset_pw_btn = $("#reset_pw_btn");

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

        reset_pw_btn.on("click", function () {
          if (pw2.val() != pw1.val()) {
            alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세요.");
            pw1.val("");
            pw2.val("");
            return false;
          }
        })
      </script>
    </body>

    </html>