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
          margin-top: 30px;
          margin-bottom: 30px;
          padding-top: 50px;
          background-color: var(--color3);
          color: var(--color2);
        }

        .find_id_logo {
          padding-left: 20px;
          padding-right: 20px;
          color: var(--color2);
        }

        .find_id_input {
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


        .input_name,
        .input_birth,
        .input_phone,
        .btns,
        .back_btn {
          height: 50px;
          line-height: 50px;
          padding-left: 20px;
        }

        #name,
        #birth,
        #phone,
        #phone1,
        #phone2 {
          background-color: transparent;
          border: 0;
          border-bottom: 1px solid var(--color2);
          color: var(--color2);
          font-size: 1rem;
        }

        #name:focus,
        #birth:focus,
        #phone:focus,
        #phone1:focus,
        #phone2:focus {
          outline: none;
        }

        #name::placeholder,
        #birth::placeholder,
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
        input[type="submit"] {
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
      <form action="/confirmId.mem" method="post" id="frm">
        <div class="find_id_box">
          <div class="find_id_logo">
            <h2>ID 찾기</h2>
            <hr>
          </div>
          <div class="find_id_contents">
            <div class="find_id_input">
              <div class="label">
                <label for="name">이름</label>
              </div>
              <div class="input_name">
                <input type="text" name="name" id="name" placeholder="이름을 입력하세요">
              </div>
              <div class="label">
                <label for="birth">생년월일</label>
              </div>
              <div class="input_birth">
                <input type="date" name="birth" id="birth">
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
                <input type="submit" value="찾기" id="find_id_btn">
                <a href="javascript:history.back()"><input type="button" value="뒤로가기" id="back_btn"></a>
              </div>
            </div>
          </div>
        </div>
      </form>
      <script>
        let frm = $("#frm");
        let name = $("#name");
        let birth = $("#birth");     
        let phone1 = $("#phone1");
        let phone2 = $("#phone2");
  
        frm.on("submit", function () {
          let nameRegex = /[가-힣a-z]{2,5}/g;
          let nameResult = nameRegex.test(name.val());
          if (!nameResult) {
            alert("이름을 입력해주세요.");
            name.val("");
            name.focus();
            return false;
          }

          let birthRegex = /\d{4}-\d{2}-\d{2}/;
          let birthResult = birthRegex.test(birth.val());
          if (!birthResult) {
            alert("생년월일을 선택해주세요.");
            return false;
          }

          let phoneRegex = /^\d{4}$/;
          let phone1Result = phoneRegex.test(phone1.val());
          let phone2Result = phoneRegex.test(phone2.val());
          if (!phone1Result || !phone2Result) {
            alert("전화번호를 제대로 입력해주세요.");
            phone1.val("");
            phone2.val("");
            phone1.focus();
            return false;
          }
        })
      </script>
    </body>

    </html>