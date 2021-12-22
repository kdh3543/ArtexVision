<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전시회 등록</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

	#logout_btn {
      text-decoration: none;
      color: var(--footer-color);
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

	.nav_items:hover {
      color: var(--sub-color1);
      cursor: pointer;
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
      padding-top: 30px;
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

	#ex_start_date, #ex_end_date {
		width: 30%;
	}

	input[type="submit"] {
	  background-color: var(--sub-color1);
      color: var(--text-color);
      width: 80%;
      height: 30px;
      border: var(--color1);
      cursor: pointer;
	}

	input[type="button"] {
	  background-color: var(--sub-color1);
      color: var(--text-color);
      height: 30px;
      border: var(--color1);
      cursor: pointer;
	}
	

    /* input_ex end */

    /* footer start */
    .footer {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      height: 200px;
      background-color: var(--footer-color);
      color: var(--text-color);
    }

    .footer_logo {
      height: 30%;
      font-size: 2rem;
      display: flex;
      align-items: flex-end;
      padding-bottom: 10px;
      padding-left: 30px;
    }

    .footer_title {
      padding-left: 30px;
      height: 40%;
      font-size: 0.9rem;
    }

    .footer_desc {
      height: 30%;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 0.8rem;
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

	  let ex_frm = document.getElementById("ex_frm");
	  
	  let ex_title = document.getElementById("ex_title");
	  let ex_desc = document.getElementById("ex_desc");
	  let ex_price = document.getElementById("ex_price");
	  let ex_location = document.getElementById("ex_location");
	  let ex_start_date = document.getElementById("ex_start_date");
	  let ex_end_date = document.getElementById("ex_end_date");
	  
	  ex_frm.onsubmit = function() {
			if(ex_title.value == "") {
				alert("전시회 제목을 입력해 주세요");
				return false;
			}
			
			if(ex_desc.value == "") {
				alert("전시회 세부 내용을 입력해 주세요");
				return false;
			}
			 
			if(ex_price.value == "") {
				alert("전시회 가격을 입력해 주세요");
				return false;
			}
			
			if(ex_location.value == "") {
				alert("전시회 장소를 입력해 주세요");
				return false;
			}
			
			if(ex_start_date.value == "") {
				alert("전시회 시작일을 입력해 주세요");
				return false;
			}
			
			if(ex_end_date.value == "") {
				alert("전시회 종료일을 입력해 주세요");
				return false;
			}
			
			if(input_ex_img.value == "") {
				alert("전시회 이미지를 등록해 주세요");
				return false;
			}
		  }
	  
      $('#ex_start_date').datepicker({                
          dateFormat: "yy-mm-dd",             
          changeMonth: true,                  
          minDate: 0,                       
          onClose: function(selectedDate) {    
              $("#ex_end_date").datepicker( "option", "minDate", selectedDate );
          }                
      });

      $('#ex_end_date').datepicker({
          dateFormat: "yy-mm-dd",
          changeMonth: true,
          minDate: 0,
          onClose: function(selectedDate) {
              $("#ex_start_date").datepicker( "option", "maxDate", selectedDate );
          }                
      });

    }

  </script>
</head>

<body>
  <c:if test="${empty loginID}">
    	<script>location.href="/admin/admin_login.jsp"</script>
  </c:if>
  <div class="container">

    <div class="header">
      <div class="admin_logo">
        <i class="fab fa-artstation"> Artex Vision Admin Page</i>
      </div>
      <div class="userDetail">
	    <i class="fas fa-user-circle"> ${loginID } 님 환영합니다.</i> 
		  <a href="/logout.admin" id="logout_btn">
		    <i class="fas fa-sign-out-alt"> LOGOUT</i>
		  </a>
	  </div>
    </div>

    <div class="nav">
			<a href="/input_ex_dashboard.admin">
				<div class="nav_items">
					<div class="nav_icon">
						<i class="fas fa-chart-line"></i>
					</div>
					<div class="nav_title">DASHBOARD</div>
				</div>
			</a> 
			<a href="/member_list.admin">
				<div class="nav_items">
					<div class="nav_icon">
						<i class="fas fa-address-card"></i>
					</div>
					<div class="nav_title">MEMBERS</div>
				</div>
			</a>
			
			<a href="/input_ex_form.admin">
				<div class="nav_items">
					<div class="nav_icon">
						<i class="fas fa-pen-square"></i>
					</div>
					<div class="nav_title">ADD EX</div>
				</div>
			</a>
			
			<a href="/show_ex_list.admin">
				<div class="nav_items">
					<div class="nav_icon">
						<i class="far fa-list-alt"></i>
					</div>
					<div class="nav_title">SHOW EX LIST</div>
				</div>
			</a>
		</div>
    
    <form action="/add_ex.admin" method="post" enctype="multipart/form-data" id = "ex_frm">
    <div class="contents">
      <div class="input_ex_wrap">
        <div class="ex_img_show_wrap">
          <div class="ex_img_show">
            <img src="" alt="이미지를 선택해 주세요" id="preview_img">
          </div>
        </div>
        <div class="input_ex_contents_wrap">
          <div class="input_ex_title_wrap">
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
              <input type="text" name="ex_title" id="ex_title" placeholder="전시회 제목을 입력하세요">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_desc" id="ex_desc" placeholder="전시회 설명을 입력하세요">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_price" id="ex_price" placeholder="전시회 입장료를 입력하세요">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_location" placeholder="전시회 장소를 입력하세요" id="ex_location">
              <input type="button" value="주소찾기" id="find_addr">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_start_date" id="ex_start_date">
            </div>
            <div class="input_ex_form">
              <input type="text" name="ex_end_date" id="ex_end_date">
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
      <div class="footer_title">ArtexVision Admin페이지 입니다.</div>
      <div class="footer_desc">Copyright 2021. 11hertz All rights reserved.</div>
    </div>
  </div>
</body>
</html>