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

        .signup_box {
          margin: auto;
          width: 450px;
          margin-top: 30px;
          margin-bottom: 30px;
          padding-top: 50px;
          background-color: var(--color3);
          color: var(--color2);
        }

        .signup_logo {
          padding-left: 20px;
          padding-right: 20px;
          color: var(--color2);
        }

        .signup_input {
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
        .input_birth,
        .input_email,
        .input_phone,
        .input_zipcode,
        .input_addr1,
        .input_addr2,
        .input_account,
        .btns,
        .back_btn {
          height: 50px;
          line-height: 50px;
          padding-left: 20px;
        }

        .id_dup_check_result,
        .pw_check_result {
          height: 10px;
          line-height: 10px;
          padding-left: 20px;
          font-size: 0.8rem;
          font-weight: bold;
          margin-bottom: 10px;
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

        #id_dup_check {
          width: 75px;
        }

        #find_zipcode_wrap {
          padding-left: 30px;
        }
      </style>
    </head>

    <body>

      <form action="/insert.mem" method="post" id="frm">
        <div class="signup_box">
          <div class="signup_logo">
            <h2>회원가입</h2>
            <hr>
          </div>
          <div class="signup_contents">
            <div class="signup_input">
              <div class="label">
                <label for="id">아이디</label>
              </div>
              <div class="input_id">
                <input type="text" name="id" id="id" placeholder="아이디를 입력하세요">
                <span id="id_dup_check_wrap"> <input type="button" value="중복확인" id="id_dup_check">
                </span>
              </div>
              <div class="id_dup_check_result" id="id_dup_check_result"></div>
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
                </select> - <input type="text" name="phone1" id="phone1"> - <input type="text" name="phone2"
                  id="phone2">
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
                <input type="submit" value="회원가입" id="signup_btn"> <input type="reset" value="다시입력" id="reset_btn">
                <input type="button" value="뒤로가기" id="back_btn">
              </div>
            </div>
          </div>
        </div>
      </form>

      <script>
        let frm = $("#frm");
        let id = $("#id");
        let id_dup_check = $("#id_dup_check");
        let id_dup_check_result = $("#id_dup_check_result");
        let pw1 = $("#pw1");
        let pw2 = $("#pw2");
        let pw_check_result = $("#pw_check_result");
        let name = $("#name");
        let birth = $("#birth");
        let email = $("#email");
        let phone1 = $("#phone1");
        let phone2 = $("#phone2");
        let find_zipcode = $("#find_zipcode");
        let zipcode = $("#zipcode");
        let addr1 = $("#addr1");
        let addr2 = $("#addr2");

        $(function () {
          id_dup_check.on("click", function () {
            $.ajax({
              uri: "/idCheck.mem",
              data: { id: id.val() }
            }).done(function (resp) {
              if (resp == "true") {
                id_dup_check_result.css("color", "red");
                id_dup_check_result.text("이미 사용중인 ID 입니다.")
              } else {
                id_dup_check_result.css("color", "green");
                id_dup_check_result.text("사용가능한 ID 입니다.")
              }
            })
          })
        })

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
          let idRegex = /[a-z][a-z0-9]{5,10}/g;
          let idResult = idRegex.test(id.val());
          if (!idResult) {
            alert("아이디를 제대로 입력해주세요.");

            id.val("");
            id.focus();
            return false;
          }

          let pwRegex = /[a-z0-9]{4}/;
          let pwResult = pwRegex.test(pw2.val());
          if (!pwResult) {
            alert("패스워드를 형식에 맞게 제대로 입력하세요.");
            pw1.val("");
            pw2.val("");
            pw1.focus();
            return false;
          }

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

          let emailRegex = /.+?@.+?\.com/g;
          let emailResult = emailRegex.test(email.val());
          if (!emailResult) {
            alert("이메일을 제대로 입력해주세요.");
            email.val("");
            email.focus();
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

        document.getElementById("find_zipcode").onclick = function () {
          new daum.Postcode({
            oncomplete: function (data) {
              document.getElementById("zipcode").value = data.zonecode;
              document.getElementById("addr1").value = data.roadAddress;
              document.getElementById("addr2").value = data.jibunAddress;
            }
          }).open();
        }
      </script>
    </body>

    </html>