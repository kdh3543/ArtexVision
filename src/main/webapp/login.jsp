<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>ArtexVision Login</title>
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

        .login_box {
          margin: auto;
          margin-top: 100px;
          background-color: var(--color3);
          width: 350px;
          height: 600px;
        }

        .login_logo {
          color: var(--color2);
          text-align: center;
          height: 20%;
          line-height: 50px;
          padding-left: 20px;
          padding-right: 20px;
        }

        .login_input {
          text-align: center;
        }

        #id,
        #pw {
          text-align: center;
          width: 80%;
          height: 40px;
          background-color: transparent;
          color: var(--color2);
          border: 0;
          border-bottom: 1px solid var(--color5);
        }

        #id:focus,
        #pw:focus {
          outline: none;
        }

        #id::placeholder,
        #pw::placeholder {
          color: var(--color2);
        }

        .login_btn_wrap {
          width: 100%;
          height: 100px;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .login_btn {
          background-color: var(--color7);
          width: 90%;
          height: 30px;
          color: var(--color2);
          border: var(--color1);
          cursor: pointer;
        }

        .btns {
          width: 100%;
          height: 50px;
          text-align: center;
          line-height: 50px;
        }

        button {
          width: 30%;
          height: 30px;
          background-color: var(--color7);
          color: var(--color2);
          border: var(--color1);
          cursor: pointer;
        }
      </style>
    </head>

    <body>  
          <form action="/login.mem" method="post">
            <div class="login_box">
              <div class="login_logo">
                <h2>LOGIN</h2>
                <hr>
              </div>
              <div class="login_contents">
                <div class="login_input">
                  <div class="input_id">
                    <input type="text" name="id" id="id" placeholder="Input your ID">
                  </div>
                  <div class="input_pw">
                    <input type="password" name="pw" id="pw" placeholder="Input your PASSWORD">
                  </div>
                </div>
                <div class="login_btn_wrap">
                  <input type="submit" value="LOGIN" class="login_btn" id="login_btn">
                </div>
              </div>
              </form>
              <div class="btns_wrap">
                <div class="btns">
                  <a href="/signup.mem"><button type="button" id="signup_btn" class="signup_btn">회원가입</button></a>
                  <a href="/findId.mem"><button type="button" id="find_id_btn" class="find_id_btn">아이디 찾기</button></a>
                  <a href="/confirmInfor.mem"><button type="button" id="modify_pw_btn" class="modify_pw_btn">비밀번호
                      변경</button></a>
                </div>
              </div>
            </div>
          
    </body>
    </html>