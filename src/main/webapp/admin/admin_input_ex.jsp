<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <style>
    :root {
      --main-color: #5f4b8b;
      --sub-color1: #998ab4;
      --sub-color2: #ececec;
      --sub-color3: #3d3d3d;
      --text-color: #ffffff;
      --footer-color: #181818;
      --bg-color: #212121;
      --img-color: #373749;
      font-size: 100%;
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

    body {
      background-color: lightgray;
    }

    * {
      box-sizing: border-box;
    }

    div {
      border: 1px solid black; 
    }

    input:-webkit-autofill,
    input:-webkit-autofill:hover,
    input:-webkit-autofill:focus,
    input:-webkit-autofill:active {
      /* transition: background-color 5000s ease-in-out 0s; */
      transition: background-color 9999s ease-out;
      box-shadow: 0 0 0px 1000px transparent inset !important;
      -webkit-text-fill-color: var(--footer color) !important;
    }

	a {
      text-decoration: none;
      color: var(--text-color);
	}
	
	a:active {
      text-decoration: none;
      color: var(--text-color);
	}

    .container {
      width: 1200px;
      margin: auto;
      background-color: white;
    }

    /* header start */
    .header {
      display: flex;
      height: 75px;
    }

    .admin_logo {
      width: 25%;
      height: 100%;
      text-align: center;
      line-height: 75px;
      font-size: 1.2rem;
    }

    .userDetail {
      width: 75%;
      text-align: right;
      line-height: 75px;
      padding-right: 20px;
    }

    .userDetail i {
      padding: 20px;
    }

    /* header end */

    /* nav start */
    .nav {
      display: flex;
      justify-content: space-evenly;
      text-align: center;
      align-items: center;
      height: 100px;
      background-color: var(--bg-color);
      color: var(--text-color);
    }

    .nav_icon {
      font-size: 1.5rem;
    }

    .nav_title {
      font-size: 0.9rem;
    }

    /* nav end */

    .contents {
      height: 600px;
      background-color: var(--sub-color1);
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* input_ex start */

    .input_ex_wrap {
      margin: auto;
      display: flex;
      background-color: var(--text-color);
      width: 90%;
      height: 80%;
    }

    .ex_img_show_wrap {
      width: 30%;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .ex_img_show {
      width: 80%;
      height: 80%;
      border: 1px solid var(--footer-color)
    }

    .ex_img_show img {
      width: 100%;
      height: 100%;
    }

    .input_ex_contents_wrap {
      width: 70%;
      display: flex;
    }

    .input_ex_title_wrap {
      width: 20%;
      height: 100%;
    }

    .input_ex_title {
      height: 10%;
      text-align: right;
      line-height: 45px;
      padding-right: 5px;
    }

    .input_ex_form_wrap {
      width: 80%;
      height: 100%;
    }

    .input_ex_form {
      height: 10%;
      line-height: 45px;
      padding-left: 5px;
    }

    .input_ex_btn {
      height: 20%;
      line-height: 90px;
      text-align: center;
    }

    .input_wrap {
      padding: 5px;
      border-radius: 5px;
      background-color: var(--footer-color);
      color: var(--text-color);
    }

    input[type="text"] {
      width: 80%;
      background-color: transparent;
      color: var(--footer-color);
      border: 0;
      border-bottom: 1px solid var(--footer-color);
    }

    input[type="text"]:focus {
      outline: none;
    }

    input[type="text"]::placeholder {
      color: var(--sub-color1);
    }

	input[type="submit"] {
	  background-color: var(--sub-color1);
      color: var(--text-color);
      width: 80%;
      height: 30px;
      border: var(--color1);
	}

	input[type="button"] {
	  background-color: var(--sub-color1);
      color: var(--text-color);
      height: 30px;
      border: var(--color1);
	}
	

    /* input_ex end */

    /* footer start */
    .footer {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      height: 200px;
    }

    .footer_logo {
      height: 30%;
      font-size: 2rem;
      display: flex;
      align-items: flex-end;
      padding-left: 30px;
    }

    .footer_title {
      padding-left: 30px;
      height: 40%;
      font-size: 1.2rem;
    }

    .footer_desc {
      height: 30%;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* footer end */
  </style>
  <script>
    window.onload = function () {
      function readImage(input) {
        if (input.files && input.files[0]) {
          const reader = new FileReader()

          reader.onload = e => {
            const previewImage = document.getElementById("preview_img");
            previewImage.src = e.target.result
          }
          reader.readAsDataURL(input.files[0])
        }
      }
      const inputImage = document.getElementById("input_ex_img");
      inputImage.addEventListener("change", e => {
        readImage(e.target)
      });

      document.getElementById("find_addr").onclick = function () {
        new daum.Postcode({
          oncomplete: function (data) {
            document.getElementById("ex_location").value = data.roadAddress;
          }
        }).open();
      };

      let nav_items = document.querySelectorAll(".nav_items");
      let nav_icon = document.querySelectorAll(".nav_icon");
      let nav_title = document.querySelectorAll(".nav_title");

      for(let i = 0; nav_items.length; i++){
        nav_items[i].onmouseover = function(){
          this.style.color = "#998ab4";
          this.style.cursor = "pointer";
        }

        nav_items[i].onmouseleave = function(){
          this.style.color = "#ffffff";
        }
      }
    }

  </script>
</head>

<body>
  <div class="container">

    <div class="header">
      <div class="admin_logo">
        <i class="fab fa-artstation"> Artex Vision Admin Page</i>
      </div>
      <div class="userDetail">
        <i class="fas fa-user-circle"> ADMIN 님 환영합니다.</i>
        <i class="fas fa-sign-out-alt"> LOGOUT</i>
      </div>
    </div>

    <div class="nav">
      <a href="/input_ex_dashboard.admin">
      <div class="nav_items">
        <div class="nav_icon"><i class="fas fa-chart-line"></i></div>
        <div class="nav_title">DASHBOARD</div>
      </div>
      </a>
      <a href="/member_list.admin">
      <div class="nav_items">
        <div class="nav_icon"><i class="fas fa-address-card"></i></div>
        <div class="nav_title">MEMBERS</div>
      </div>
      </a>
      <div class="nav_items">
        <div class="nav_icon"><i class="far fa-clipboard"></i></div>
        <div class="nav_title">BOARD</div>
      </div>
      <div class="nav_items">
        <div class="nav_icon"><i class="fas fa-crown"></i></div>
        <div class="nav_title">GRADE</div>
      </div>
      <a href="/input_ex_form.admin">
      <div class="nav_items">
        <div class="nav_icon"><i class="fas fa-pen-square"></i></div>
        <div class="nav_title">EXHIBITION</div>
      </div>
      </a>
    </div>
    
    <form action="/add_ex.admin" method="post" enctype="multipart/form-data">
    <div class="contents">
      <div class="input_ex_wrap">
        <div class="ex_img_show_wrap">
          <div class="ex_img_show">
            <img src="" alt="NO IMAGE" id="preview_img">
          </div>
        </div>
        <div class="input_ex_contents_wrap">
          <div class="input_ex_title_wrap">
            <div class="input_ex_title">전시회 아이디</div>
            <div class="input_ex_title">전시 제목</div>
            <div class="input_ex_title">전시 설명</div>
            <div class="input_ex_title">전시 입장료</div>
            <div class="input_ex_title">전시 장소</div>
            <div class="input_ex_title">시작일</div>
            <div class="input_ex_title">종료일</div>
            <div class="input_ex_title">전시회 이미지</div>
          </div>
          <div class="input_ex_form_wrap">
            <div class="input_ex_form">
              <input type="text" name="ex_id" placeholder="전시회 아이디를 입력하세요">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_title" placeholder="전시회 제목을 입력하세요">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_desc" placeholder="전시회 설명을 입력하세요">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_price" placeholder="전시회 입장료를 입력하세요">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_location" placeholder="전시회 장소를 입력하세요" id="ex_location">
              <input type="button" value="주소찾기" id="find_addr">
            </div>
            <div class="input_ex_form">
              <input type="date" name="ex_start_date" id="ex_start_date">
            </div>
            <div class="input_ex_form">
              <input type="date" name="ex_end_date" id="ex_end_date">
            </div>
            <div class="input_ex_form">
              <input type="file" name="ex_img" id="input_ex_img">
            </div>
            <div class="input_ex_btn">
              <input type="submit" value="전시회 생성">
            </div>
          </div>
        </div>
      </div>
    </div>
    </form>

    <div class="footer">
      <div class="footer_logo"><i class="fab fa-artstation"> Artex Vision Admin Page</i></div>
      <div class="footer_title">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odit, distinctio asperiores
        reiciendis quod corrupti praesentium nihil dolorum dignissimos saepe quasi veniam pariatur vel corporis
        necessitatibus ipsam itaque nostrum similique placeat?</div>
      <div class="footer_desc">Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi doloremque, fuga nihil
        neque</div>
    </div>
  </div>
</body>
<script>

</script>

</html>