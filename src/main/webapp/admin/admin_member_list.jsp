<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 리스트 보기</title>
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

    /* member_list start */

    .member_list_wrap {
      margin: auto;
      background-color: var(--text-color);
      width: 100%;
      height: 80%;
      overflow-y: auto;
      overflow-x: hidden;
    }

    h3 {
      padding-top: 20px;
      padding-left: 30px;
    }

	.total_count {
		text-align: left;
		font-size: 0.8rem;
		padding-left: 30px;
	}

    .member_list_title {
      width: 95%;
    }

    .member_list_table {
      margin: auto;
      max-width: 1150px;
      min-width: 1150px;
      text-align: center;
      font-size: 0.9rem;
    }

    tr,
    th,
    td {
      border: 1px solid var(--footer-color);
    }

    /* member_list end */


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
        <a href="/logout.admin" id="logout_btn"><i class="fas fa-sign-out-alt"> LOGOUT</i></a>
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
    <div class="contents">
      <div class="member_list_wrap">
        <h3>전체 회원 List</h3>
        <hr class="member_list_title">
        <span class="total_count"> 총 회원 수 : ${fn:length(list) } </span>
        <table class="member_list_table">
          <tr>
            <th>No.</th>
            <th class="id_title">아이디</th>
            <th class="name_title">이름</th>
            <th class="birth_title">생년월일</th>
            <th class="email_title">이메일</th>
            <th class="phone_title">전화번호</th>
            <th class="addr_title">주소</th>
            <th class="grade_title">등급</th>
            <th class="signup_date_title">가입일</th>
            
          </tr>
          <c:forEach items="${list }" var="list" varStatus="s">
          	<tr>
          		<td>${s.count }</td>
          		<td>${list.mem_id }</td>
          		<td>${list.mem_name }</td>
          		<td>${list.mem_birth }</td>
          		<td>${list.mem_email }</td>
          		<td>${list.mem_phone }</td>
          		<td>${list.mem_addr1 } ${mem_list.addr2 }</td>
          		<td>${list.mem_grade }</td>
          		<td>${list.mem_signup_date }</td>
          	</tr>
          </c:forEach>
        </table>
      </div>
    </div>

    <div class="footer">
      <div class="footer_logo"><i class="fab fa-artstation"> Artex Vision Admin Page</i></div>
      <div class="footer_title">ArtexVision Admin페이지 입니다.</div>
      <div class="footer_desc">Copyright 2021. 11hertz All rights reserved.</div>
    </div>
  </div>
</body>

</html>