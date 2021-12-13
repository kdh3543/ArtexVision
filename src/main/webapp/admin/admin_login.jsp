<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LOGIN</title>
  <style>
    /* 전체 설정 css start */
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

    html,body,div,span,applet,object,iframe,
    h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,
    acronym,address,big,cite,code,del,dfn,
    em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,
    tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,
    fieldset,form,label,legend,table,caption,
    tbody,tfoot,thead,tr,th,td,
    article,aside,canvas,details,embed,figure,figcaption,
    footer,header,hgroup,menu,nav,output,ruby,section,summary,
    time,mark,audio,video {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

	input:-webkit-autofill,
    input:-webkit-autofill:hover,
    input:-webkit-autofill:focus,
    input:-webkit-autofill:active {
      /* transition: background-color 5000s ease-in-out 0s; */
      transition: background-color 9999s ease-out;
      box-shadow: 0 0 0px 1000px transparent inset !important;
      -webkit-text-fill-color: var(--color2) !important;
    }

    .login_box {
      margin: auto;
      background-color: var(--color3);
      width: 350px;
      height: 250px;
      margin-top: 30px;
      margin-bottom: 30px;
    }

    .login_logo {
      color: var(--color2);
      text-align: center;
      height: 20%;
      line-height: 60px;
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
      border-bottom: 1px solid var(--color2);
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
      color: var(--color2);
      width: 90%;
      height: 30px;
      border: var(--color1);
    }
    
    .login_btn:hover {
      cursor: pointer;
    }

  </style>
</head>

<body>
  <form action="/admin_login.admin" method="post">
  <div class="login_box">
    <div class="login_logo">
      <h2>ADMIN LOGIN</h2>
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
  </div>
  </form>
</body>
</html>