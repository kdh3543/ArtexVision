<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
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

    html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,
    a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,
    s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,
    fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,
    article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,
    menu,nav,output,ruby,section,summary,time,mark,audio,video {
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

    /* selection start */
    .selection {
      display: flex;
      justify-content: left;
      height: 75px;
      background-color: var(--sub-color2);
    }

    .select_btn_form {
      line-height: 125px;
      padding-left: 10px;
      text-align: center;
    }

    .select_btn {
      background-color: transparent;
      border: none;
      border-radius: 5px;
      font-size: 0.8rem;
      height: 30px;
      cursor: pointer;
      color: white;
      background-color: var(--sub-color1);
    }

    /* selection end */

    
    .contents {
      height: 600px;
      background-color: var(--sub-color1);
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* dashboard start */

    .dashboard_wrap {
      margin: auto;
      display: flex;
      background-color: var(--text-color);
      width: 90%;
      height: 80%;
    }

    .dashboard_contents {
      width: 30%;
      overflow-y:auto; 
      overflow-x:hidden;
    }

    .dashboard_contents_item {
      display: flex;
      height: 7%;
      justify-content: center;
      padding: 5px;
      margin: 5px;
      align-items: center;
      text-align: center;

      /* border: 1px solid black; */
    }

    .dashboard_contents_item_title {
      font-size: 0.9rem;
      width: 80%;
      background-color: var(--sub-color3);
      color: var(--text-color);
    }

    .dashboard_contents_item_data {
      font-size: 0.9rem;
      background-color: var(--sub-color2);
      width: 80%;
    }

    .dashboard_graph {
      width: 80%;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* dashboard end */

    /* summary start */
    .summary {
      background-color: var(--footer-color);
      height: 250px;
      color: var(--text-color);
    }

    .summary_title {
      width: 100%;
      padding-left: 50px;
      height: 20%;
      line-height: 50px;
    }

    .summary_contents {
      width: 100%;
      height: 80%;
      display: flex;
    }
    .summary_contents_item {
      width: 20%;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-evenly;
      align-items: center;
    }

    .summary_contents_item_icon {
      font-size: 3rem;
    }

    .summary_contents_item_desc1 {
      font-size: 1.5rem;
    }

    .summary_contents_item_desc2 {
      font-size: 0.9rem;
    }
    /* summary end */

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
			
			<div class="nav_items" id="working1">
				<div class="nav_icon">
					<i class="far fa-clipboard"></i>
				</div>
				<div class="nav_title">BOARD</div>
			</div>
			
			<div class="nav_items" id="working2">
				<div class="nav_icon">
					<i class="fas fa-crown"></i>
				</div>
				<div class="nav_title">GRADE</div>
			</div>
			<a href="/input_ex_form.admin">
				<div class="nav_items">
					<div class="nav_icon">
						<i class="fas fa-pen-square"></i>
					</div>
					<div class="nav_title">EXHIBITION</div>
				</div>
			</a>
		</div>

		<div class="selection">
			<!-- <div class="select_date_form">
				<div class="from">
					FROM <input type="date" class="select_date">
				</div>
				<div class="to">
					TO <input type="date" class="select_date">
				</div>
			</div> -->
			<div class="select_btn_form">
				<button type="button" class="select_btn" id="daily_btn">일간 가입자 통계 보기</button>
				<button type="button" class="select_btn" id="monthly_btn">월간 가입자 통계 보기</button>
			</div>
		</div>

		<div class="contents">
			<div class="dashboard_wrap">
				<div class="dashboard_contents">
					<!-- <div class="dashboard_contents_item">
						<div class="dashboard_contents_item_title"></div>
						<div class="dashboard_contents_item_data"></div>
					</div> -->
				</div>
				<div class="dashboard_graph">
					<%-- <canvas id="myChart"></canvas> --%>
				</div>
			</div>
		</div>

		<!-- <div class="summary">
      <div class="summary_title"><h3>STATISTICS</h3></div>
      <div class="summary_contents">
        <div class="summary_contents_item">
          <div class="summary_contents_item_icon"><i class="fas fa-database"></i></div>
          <div class="summary_contents_item_desc1">DATABASE</div>
          <div class="summary_contents_item_desc2">DESCRIBE</div>
        </div>
        <div class="summary_contents_item">
          <div class="summary_contents_item_icon"><i class="fas fa-table"></i></div>
          <div class="summary_contents_item_desc1">TABLE</div>
          <div class="summary_contents_item_desc2">DESCRIBE</div>
        </div>
        <div class="summary_contents_item">
          <div class="summary_contents_item_icon"><i class="far fa-clock"></i></div>
          <div class="summary_contents_item_desc1">CLOCK</div>
          <div class="summary_contents_item_desc2">DESCRIBE</div>
        </div>
        <div class="summary_contents_item">
          <div class="summary_contents_item_icon"><i class="fas fa-calendar-week"></i></div>
          <div class="summary_contents_item_desc1">CALENDAR</div>
          <div class="summary_contents_item_desc2">DESCRIBE</div>
        </div>
        <div class="summary_contents_item">
          <div class="summary_contents_item_icon"><i class="far fa-bell"></i></div>
          <div class="summary_contents_item_desc1">ALERT</div>
          <div class="summary_contents_item_desc2">DESCRIBE</div>
        </div>
      </div>
    </div> -->

		<div class="footer">
			<div class="footer_logo">
				<i class="fab fa-artstation"> Artex Vision Admin Page</i>
			</div>
			<div class="footer_title">Lorem ipsum dolor sit, amet
				consectetur adipisicing elit. Odit, distinctio asperiores reiciendis
				quod corrupti praesentium nihil dolorum dignissimos saepe quasi
				veniam pariatur vel corporis necessitatibus ipsam itaque nostrum
				similique placeat?</div>
			<div class="footer_desc">Lorem ipsum dolor sit amet consectetur
				adipisicing elit. Animi doloremque, fuga nihil neque</div>
		</div>
	</div>
</body>
<script>
	let working1 = document.getElementById("working1");
	let working2 = document.getElementById("working2");
	
	working1.onclick = function() {
		alert("구현중입니다.");
	}
	
	working2.onclick = function() {
		alert("구현중입니다.");
	}

	let weekly_btn = document.getElementById("weekly_btn");
	let daily_btn = document.getElementById("daily_btn");
	const dashboard_contents = document.querySelector(".dashboard_contents");
	const dashboard_graph = document.querySelector(".dashboard_graph");
	daily_btn.onclick = function(){
		$(".dashboard_contents").empty();
		$(".dashboard_graph").empty();
		$.ajax({
			url: "/dailyData.admin"
		}).done(function(resp){
			let result = JSON.parse(resp);
			let dateArr = [];
			let cntArr = [];
			for(let i = 0; i < result.length; i++) {
				dateArr.push(result[i].mem_signup_date);
				cntArr.push(parseInt(result[i].cnt));
				
				let div1 = document.createElement("div");
				div1.classList.add("dashboard_contents_item");
				
				let div2 = document.createElement("div");
				div2.classList.add("dashboard_contents_item_title");
				div2.innerText = result[i].mem_signup_date;
				
				let div3 = document.createElement("div");
				div3.classList.add("dashboard_contents_item_data");
				div3.innerText = result[i].cnt;
				
				div1.appendChild(div2);
				div1.appendChild(div3);
				dashboard_contents.append(div1);
			}
			
			let canvas = document.createElement("canvas");
			canvas.id = "myChart";
			dashboard_graph.appendChild(canvas);
			
			drawChart(dateArr, cntArr);
	  });
	}
	
	monthly_btn.onclick = function(){
		$(".dashboard_contents").empty();
		$(".dashboard_graph").empty();
		$.ajax({
			url: "/monthlyData.admin"
		}).done(function(resp){
			let result = JSON.parse(resp);
			let dateArr = [];
			let cntArr = [];
			for(let i = 0; i < result.length; i++) {
				dateArr.push(result[i].mem_signup_date);
				cntArr.push(parseInt(result[i].cnt));
				
				let div1 = document.createElement("div");
				div1.classList.add("dashboard_contents_item");
				
				let div2 = document.createElement("div");
				div2.classList.add("dashboard_contents_item_title");
				div2.innerText = result[i].mem_signup_date;
				
				let div3 = document.createElement("div");
				div3.classList.add("dashboard_contents_item_data");
				div3.innerText = result[i].cnt;
				
				div1.appendChild(div2);
				div1.appendChild(div3);
				dashboard_contents.append(div1);
			}
			
			let canvas = document.createElement("canvas");
			canvas.id = "myChart";
			dashboard_graph.appendChild(canvas);
			
			drawChart(dateArr, cntArr);
	  });
	}
	
	function drawChart(dateArr, cntArr){
		let ctx = document.getElementById('myChart');
		let title_arr = dateArr;
		let contents_arr = cntArr;
		
		let myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: title_arr,
				datasets: [{
					label: '2021년',
					data: contents_arr,
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(54, 162, 235, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(255, 159, 64, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(54, 162, 235, 1)'
					],
					borderWidth: 1
				}]
			}
		});
	}
	
	
</script>

</html>