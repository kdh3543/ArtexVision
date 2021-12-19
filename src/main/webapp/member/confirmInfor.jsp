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

      </style>
    </head>

    <body>
    <form action="/confirm.mem" method="post">
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
              <input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
            </div>
            <div class="label">
              <label for="name">이름</label>
            </div>
            <div class="input_name">
              <input type="text" name="name" id="name" placeholder="이름을 입력하세요">
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
            <div class="btns">
              <input type="submit" value="개인정보 확인" id="reset_pw_btn">
              <a href="/home.mem"><input type="button" value="홈으로" id="back_btn"></a>
            </div>
          </div>
        </div>
      </div>
      </form>
    </body>

    </html>