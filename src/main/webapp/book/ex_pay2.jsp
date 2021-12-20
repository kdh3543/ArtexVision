<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


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

    html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,
    blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,
    em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,
    b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,
    table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,
    details,embed,figure,figcaption,footer,header,hgroup,menu,nav,
    output,ruby,section,summary,time,mark,audio,video {
      margin: 0;
      padding: 0;
    }

        * {
            box-sizing: border-box;
        }

        /*
    div {
       border: 1px solid black; 
    }
    */

        /* 전체 설정 css end */

        /* container start */
        .container {
            width: 1200px;
            margin: auto;
        }

        /* container end */


        /* header start */
        .header {
            height: 40px;
            background-color: var(--color3);
            color: var(--color2);
        }

        .header_list {
            display: flex;
            justify-content: flex-end;
            line-height: 40px;
        }

        .header_list li {
            list-style-type: none;
            padding-right: 20px;
            font-size: 0.9rem;
        }

        .header_list li a {
            text-decoration: none;
            color: var(--color2);
        }

        .search_wrap {
            padding: 5px;
            border-radius: 10px;
            background-color: var(--color4);
            color: var(--text-color);
        }

        .search_text {
            background-color: transparent;
            color: var(--text-color);
            border: 0;
            border-bottom: 1px solid var(--color2);
        }

        .search_text::placeholder {
            color: var(--text-color);
        }

        .search_text:focus {
            outline: none;
        }

        .user_detail {
            color: silver;
            padding-right: 10px;
        }

        #user_grade {
            background-color: var(--color2);
            border-radius: 5px;
            padding: 1px 3px 1px 3px;
        }

        /* header end */

        /* nav start */
        .nav {
            display: flex;
            height: 60px;
        }

        .nav_logo {
            text-align: center;
            line-height: 60px;
            width: 20%;
            height: 100%;
            font-size: 2rem;
        }

        .nav_side {
            align-items: right;
            width: 75%;
            height: 100%;
        }

        .nav_menu_list {
            display: flex;
            justify-content: space-around;
            line-height: 55px;
            padding-right: 20px;

        }

        .nav_menu_list li {
            border: 0px;
            list-style-type: none;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .nav_menu_list li:hover {
            border-bottom: solid var(--color11);
        }

        .nav_menu_list a {
            text-decoration: none;
            color: var(--color3);
        }

        .nav_menu_list a:hover {
            text-decoration: none;
            color: var(--color7);
        }

        /* nav end */


        .carousel_timeline {
            display: flex;
        }

        .main {
            height: 800px;
            margin-top: 15px;
            overflow: auto;
        }

        .sidebar {
            width: 15%;
            height: 100%;
            background-color: var(--color2);
            float:left;
        }

        .exhibition_pay2_area{
            margin-top: 30px;
            margin-left: 25px;
            width:70%;
            float:left;
        }

        .exhibition_pay2_client>div:first-child{
            width:15%;
        }
        .exhibition_pay2_birth>div:first-child{
            width:15%;
        }
        .exhibition_pay2_contact>div:first-child{
            width:15%;
        }
        .exhibition_pay2_email>div:first-child{
            width:15%;
        }

        .exhibition_pay2_title{
            font-weight: bold;
            font-size: x-large;
            margin-bottom: 10px;
        }

        .exhibition_pay2_receive_ticket{
            font-weight: bold;
            margin-bottom: 10px;
        }

        .exhibition_pay2_client>div{
            float:left;
        }

        .exhibition_pay2_confirmclient{
            font-weight: bold;
            margin-bottom: 10px;
        }

        .exhibition_pay2_ticket_inform{
            margin-top: 10px;
            font-size: small;
        }
        .exhibition_pay2_birth>div{
            float:left;
        }

        .exhibition_pay2_contact>div{
            float:left;
        }
        
        .exhibition_pay2_email>div{           
            float:left;
        }        
        .exhibition_pay2_methodchoice{            
            margin-top: 15px;
        }
        .exhibition_pay2_methodchoice>div:first-child{
            font-weight: bold;
            margin-bottom: 10px;
        }
        .exhibition_pay2_salemethod>div:first-child{
            margin-top:15px;
            margin-bottom:15px;
            font-weight: bold;
        }
    
        .list_title {
            color: var(--color2);
            padding-top: 20px;
            text-align: center;
        }

        .sidebar_item_list {
            padding-top: 20px;
            list-style-type: none;
            display: flex;
            flex-direction: column;
        }

        .sidebar_item {
            width: 100%;
            padding-top: 10px;
            padding-bottom: 10px;
            text-align: center;
        }

        .sidebar_item:hover {
            background-color: var(--color2);
        }

        .sidebar_item a {
            font-size: 1rem;
            text-decoration: none;
            color: var(--color2);
        }

        
        .contents {
            width: 80%;
        }

        .footer {
            height: 150px;
            background-color: var(--color1);
        }

        .exhibition_pay2_btnarea{
            text-align: center;
        }
        a{
         	text-align: center;
  			text-decoration: none; /* 링크의 밑줄 제거 */
 		 	color: inherit; /* 링크의 색상 제거 */
        }
            
        a:hover{
            color: black; /* 링크의 색상 제거 */
        }
    </style>
</head>
<body>
<div class="container">
        <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${dto.mem_grade}</li></span>
                <li id="welcome"> ${loginId } 님 환영합니다.</li>
                <li id="mypage"><a href="/modifyForm.mem">마이페이지</a></li>
                <li id="basket"><a href="/basket/basket.jsp" id="basket">장바구니</a></li>
                <li id=logout><a href="/logout.mem"  id="logout">로그아웃</a></li>
              </ul>
            </div>
          </c:when>
          <c:otherwise>
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li id=login><a href="/home.mem">로그인</a></li>
                <li id=signup><a href="/signup.mem">회원가입</a></li>
              </ul>
            </div>
          </c:otherwise>
     </c:choose>
    <div class="nav">
      <div class="nav_logo">
        <a href="/artexMain/mainpage.jsp"><i class="fab fa-artstation"> Artex Vision</i></a>
      </div>
      <div class="nav_side">
        <div class="nav_menu">
          <ul class="nav_menu_list">
            <li><a href="#" id="notice">NOTICE</a></li>
            <li><a href="/artexDesc/artex_desc.jsp">Artex Vision</a></li>
            <li><a href="/exhibition/main_ex/now_main_ex.jsp">전시</a></li>
            <li><a href="#" id="event">이벤트</a></li>
          </ul>
        </div>
      </div>
    </div>
		
        <div class="main">
            <div class="sidebar">
                <!-- 전시 start -->
                <h3 class="list_title"></h3>
                <ul class="sidebar_item_list">
                    <li class="sidebar_item"><a href=""></a></li>
                    <li class="sidebar_item"><a href=""></a></li>
                    <li class="sidebar_item"><a href=""></a></li>
                </ul>
                <!-- 전시 end -->                
            </div>
            <div class="exhibition_pay2_area">
                <div class="exhibition_pay2_title">결제</div>
                <div class="exhibition_pay2_receive_ticket">티켓 수령 방법</div>
                <input type="radio" name=pay_method>현장수령<br>
                <input type="radio" name=pay_method>모바일티켓<br>
                <input type="radio" name=pay_method>배송(2,500원)<br>
                <div class="exhibition_pay2_ticket_inform">티켓 현장 수령은 예매시 부여되는 "예매번호"로 당일 티켓을 수령하여 입장합니다.</div>
                <br>
                <div class="exhibition_pay2_confirmclient">예매자 확인</div>
                <div class="exhibition_pay2_client">
                    <div>이름</div>
                    <div>김**</div>
                </div><br>
                <div class="exhibition_pay2_birth">
                    <div>생년월일</div>
                    <div><input type=text style="width:150px; height:20px;"></div>
                    <div style="margin-left:10px;">예)991231(YYMMDD)</div>
                </div><br>
                <div class="exhibition_pay2_contact">
                    <div>연락처</div>
                    <div><input type=text style="width:50px; height:20px;"></div>
                    <div style="margin-left:10px;">-</div>
                    <div style="margin-left:10px;"><input type=text style="width:100px; height:20px;"></div>
                    <div style="margin-left:10px;">-</div>
                    <div style="margin-left:10px;"><input type=text style="width:100px; height:20px;"></div>
                </div><br>
                <div class="exhibition_pay2_email">
                    <div>이메일</div>
                    <div><input type=text style="width:300px; height:20px;"></div>
                </div><br>
                <div class="exhibition_pay2_methodchoice">
                    <div>결제방식 결제</div>
                    <div class="exhibition_pay2_paymethodchoice">
                        <input type="radio" name=pay_method_choice>신용카드<br>
                        <input type="radio" name=pay_method_choice>KB Pay<br>
                        <input type="radio" name=pay_method_choice>Kakao Pay<br>
                        <input type="radio" name=pay_method_choice>무통장 입금<br>
                        <input type="radio" name=pay_method_choice>휴대폰 결제<br>
                    </div>
                </div>
                <div class="exhibition_pay2_salemethod">
                    <div>할인방법 선택</div>
                    <div style="font-size: small;">포인트입력 (잔여포인트 : 4500원)</div>
                    <div ><input type=text></div><br>
                    <div style="font-size: small;">쿠폰선택</div>
                    <div><input type=text></div>
                </div><br>
                <div class="exhibition_pay2_btnarea">
                    <input type=button value="결제하기">
                </div>                
            </div>
            
        </div>
        <div class="footer"></div>
    </div>
    <script>
    $("#logout").on("click",function(){
		if(!confirm("로그아웃 하시겠습니까?")){
			return false;
		}
	})
	
	$("#basket").on("click",function(){
		alert("현재 기능은 구현중에 있습니다.");
		return false;
	})
	$("#notice").on("click",function(){
		alert("현재 기능은 구현중에 있습니다.");
		return false;
	})
	$("#event").on("click",function(){
		alert("현재 기능은 구현중에 있습니다.");
		return false;
	})
    </script>
</body>
</html>