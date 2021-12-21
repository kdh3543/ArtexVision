<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
      /* border: 1px solid black; */
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

    .nav_icon {
      font-size: 1.5rem;
    }

    .nav_title {
      font-size: 0.9rem;
    }

    .nav_items:hover {
      color: var(--sub-color1);
      cursor: pointer;
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

    .ex_list_wrap {
      margin: auto;
      display: flex;
      background-color: var(--text-color);
      width: 90%;
      height: 80%;
    }

    .ex_list_contents_wrap {
      width: 40%;
      display: flex;
      justify-content: center;
      border: 1px solid black;
    }

    .ex_list_contents {
      width: 90%;
      overflow-x: hidden;
      overflow-y: auto;
    }

	.ex_list_contents::-webkit-scrollbar {
    	display: none; 
	}

    .ex_list_contents_item {
      display: flex;
      height: 7%;
      justify-content: center;
      padding: 5px;
      margin: 5px;
      align-items: center;
      text-align: center;
    }
	
	.ex_list_detail_contents_item {
	  display: flex;
      height: 12%;
      justify-content: center;
      align-items: center;
      text-align: center;
	}

    .ex_list_contents_item_title {
      font-size: 0.9rem;
      width: 10%;
      border: 1px solid black;
      background-color: var(--sub-color3);
      color: var(--text-color);
    }
    
    .ex_list_contents_item_data {
      font-size: 0.9rem;
      width: 80%;
      border: 1px solid black;
    }
    

    .ex_list_detail_wrap {
      width: 60%;
      display: flex;
      justify-content: center;
    }

	.notice {
	  text-align: center;
	  
	}
	
    .ex_list_detail_contents_wrap {
      display: flex;
      flex-direction: column;
      justify-content: center;
      width: 60%;
    }


    .ex_list_detail_contents_item_title {
      font-size: 0.9rem;
      width: 30%;
      border: 1px solid black;
      background-color: var(--sub-color3);
      color: var(--text-color);
    }
    
    .ex_list_detail_contents_item_data {
      font-size: 0.9rem;
      width: 65%;
      border: 1px solid black;
    }
    
    .ex_list_show_img_wrap {
      width: 35%;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .ex_list_show_img_contents_wrap {
      width: 90%;
      height: 60%;
      border: 1px solid black;
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
        <i class="fas fa-sign-out-alt"> LOGOUT</i>
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
			
			<div class="nav_items" id="working1">
				<div class="nav_icon">
					<i class="far fa-clipboard"></i>
				</div>
				<div class="nav_title">BOARD</div>
			</div>
			
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
  
    <div class="contents">
      <div class="ex_list_wrap">
        <div class="ex_list_contents_wrap">
          <div class="ex_list_contents">
          	<c:forEach items="${list }" var="list" varStatus="s">
            <div class="ex_list_contents_item" id="${list.ex_id }">
              <div class="ex_list_contents_item_title">${list.ex_id }</div>
              <div class="ex_list_contents_item_data">${list.ex_title }</div>
            </div>
			</c:forEach>
          </div>
        </div>
        <div class="ex_list_detail_wrap">
          <div class="ex_list_show_img_wrap">
            <div class="ex_list_show_img_contents_wrap">

            </div>
          </div> 
          <div class="ex_list_detail_contents_wrap">
          	<div class="notice"> 리스트를 클릭하시면 <br> 상세 정보를 보실 수 있습니다. </div>
            <!-- <div class="ex_list_detail_contents_item">
              <div class="ex_list_detail_contents_item_title">전시회 ID</div>
              <div class="ex_list_detail_contents_item_data">ID</div>
            </div>  -->
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
	working1.onclick = function() {
		  alert("구현중입니다.");
	}

    const ex_list_detail_contents_wrap = document.querySelector(".ex_list_detail_contents_wrap");
	let ex_list_contents_item = document.querySelectorAll(".ex_list_contents_item");
	let data = '';
	for(let i = 0; i < ex_list_contents_item.length; i++) {
		ex_list_contents_item[i].onclick = function() {
			$(".ex_list_show_img_contents_wrap").empty();
			$(".ex_list_detail_contents_wrap").empty();
			data = ex_list_contents_item[i].getAttribute("id");
			$.ajax({
				url: "/getExListDesc.admin",
				type: "post",
				data: {
					ex_id: data
				}
			}).done(function(resp){
				let result = JSON.parse(resp);
				
				const titleArr = ["전시회 ID", "전시회 제목", "전시회 가격", "전시회 장소", "전시회 평점", "전시 시작일", "전시 종료일"];
				const resultArr = [result.ex_id, result.ex_title, result.ex_price, result.ex_location, result.ex_score, result.ex_start_date, result.ex_end_date];
				
				for(let i = 0; i < titleArr.length; i++) {
				
				let div1 = document.createElement("div");
				div1.classList.add("ex_list_detail_contents_item");
						
				let div2 = document.createElement("div");
				div2.classList.add("ex_list_detail_contents_item_title");
				div2.innerText = titleArr[i];
						
				let div3 = document.createElement("div");
				div3.classList.add("ex_list_detail_contents_item_data");
				div3.innerText = resultArr[i];
						
				div1.appendChild(div2);
				div1.appendChild(div3);
				
				ex_list_detail_contents_wrap.append(div1);
				}
			});
		}
	}
	
</script>

</html>
</body>
</html>