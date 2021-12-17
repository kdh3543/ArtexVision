<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
 
<!-- 캘린더 -->    
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7262ac3337a597a3bb0dd8dc4b881cd1"></script>

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

    div {
      /* border: 1px solid black; */
    }
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

    #user_grade{
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
      width: 25%;
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
      height: 1200px;
    }

    .sidebar {
      width: 20%;
      height: 100%;
      background-color: var(--color3);
      float: left;
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
      background-color: var(--color5);
    }

    .sidebar_item a {
      font-size: 1rem;
      text-decoration: none;
      color: var(--color2);
    }

    /* 전시 내용 */
    .contents {
      width: 80%;
      height: 100%;
      float: left; 
      padding-top: 100px;
    }

    .contents_wrap1{
      width: 50%;
      height: 60%;
      float: left;
    }

    .contents_wrap2{
      width: 50%;
      height: 60%;
      float: left;
    }

    .contents_wrap2>div{
      width: 100%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      font-size: large;
      margin-bottom: 10px;
    }

  .contents_wrap2>div>div{
      width: 50%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      float : left;
      padding: 2px ;
    }

    .contents_wrap2>div>div:nth-child(1){
      width: 50%;
      height: 40px;
      line-height: 40px;
      /* text-align: center; */
      float : left;
      text-align: right;
      padding-right: 50px;
      font-weight: 550;
    }

    .contents_sub1{
      width: 100%;
      height: 50%;
      text-align: center;
      padding-top: 40px;
      padding-left:50px;
    }

    .contents_sub2{
      width: 100%;
      height: 50%;
      padding-left: 70px;
    }

    #title{
      width: 100%;
      height: 15%;
      text-align: center;
      font-size: large;
      font-weight: bolder;
      padding-top: 5px;
      
    }

    #map{
      width: 100%;
      height:85%;
      text-align: center;

    }

    #buy_btn:hover{
      cursor: pointer;
    }

    .contents_wrap3{
      width: 100%;
      height: 40%;
      padding-left: 80px;
      padding-right: 80px;
      padding-top: 40px;
      float: left;
    }

    .menu_top{
      width: 100%;
      height: 13%;
    }

    .menu_top>div{
      float: left;
      font-size:larger;
      width: 20%;
      text-align: center;
      height: 50px;
      line-height: 50px;
    }

    .menu_top>div:hover{
      cursor: pointer;
      border-bottom: solid var(--color11);
    }

    .menu_content1{
      padding: 20px;
    }
    .menu_content2{
      padding: 20px;
      display : none;
    }
    .menu_content3{
      padding: 20px;
      display : none;
    }

    .footer {
      height: 150px;
      background-color: var(--color1);
    }

    .carousel img {
      width: 100%;
      height: 100%;
    }

    #buy_btn{
      border: 0;
      outline: 0;
      width: 200px; height: 40px; font-size: large; padding: 5px; background-color: black; color: white;
    }

    #buy_btn:hover{
      background-color: #9d2622;;
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
    <div class="header">
      <ul class="header_list">
        <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> SILVER</li></span>
        <li> USER001 님 환영합니다.</li>
        <li><a href="#">마이페이지</a></li>
        <li><a href="#">장바구니</a></li>
        <!-- <li><a href="#">로그인</a></li> -->
        <li><a href="#">로그아웃</a></li>
        <!-- <li><a href="#">회원가입</a></li> -->
        <li>
          <span class="search_wrap">
            <input type="text" id="search_text" name="search_text" class="search_text" placeholder="INPUT SEARCH ITEM"
              maxlength="25">
            <a href=""><i class="fas fa-search"></i></a>
          </span>
        </li>
      </ul>
    </div>
    <div class="nav">
      <div class="nav_logo">
        <a href="../../artexMain/mainpage.jsp" ><i class="fab fa-artstation"> Artex Vision</i></a>
      </div>
      <div class="nav_side">
        <div class="nav_menu">
          <ul class="nav_menu_list">
            <li><a href="#">NOTICE</a></li>
            <li><a href="../../artexDesc/artex_desc.jsp">Artex Vision</a></li>
            <li><a href="#">전시</a></li>
            <li><a href="#">이벤트</a></li>
            <li><a href="#">커뮤니티</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="carousel_timeline">
      <div class="carousel">
        <img src="img/sample_carousel.png" class="carousel_img">
      </div>
    </div>
    <div class="main">
      <div class="sidebar">
        <h2 class="list_title">전시</h2>
        <ul class="sidebar_item_list">
          <li class="sidebar_item"><a href="">현재 전시</a></li>
          <li class="sidebar_item"><a href="">예정된 전시</a></li>
          <li class="sidebar_item"><a href="">마감된 전시</a></li>
        </ul>
      </div>

      <div class="contents">
        <div class="contents_wrap1">
          <div class="contents_sub1">
            <img src="../img/countdown.png" width="200px" height="240px">
          </div>
          <div class="contents_sub2">
            <div id="title">오시는 길</div>
            <div id="map"></div>
          </div>
        </div>
        <div class="contents_wrap2">
          <div class="ex_title" style="font-weight: bolder; font-size: x-large; margin-bottom: 20px; padding-left: 90px;">중견작가전 COUNTDOWN</div>
          <hr style="background-color: #9d2622; width: 400px; margin-top: 30px; margin-bottom: 30px; ">
          <div class="ex_name">
            <div>장소 </div>
            <div>세종 문화 회관</div>
          </div>
          <div class="ex_date">
           	<div>전시 기간</div>
            <div>2021-12-03 ~ 2021-12-26</div>
          </div>
          <div class="ex_price">
            <div>가격</div>
            <div>4,000원</div>
          </div>
          <div class="ex_person" >
            <div>인원</div>
            <div>
            <select name="person" style="width:120px; height:40px;">
              <option >인원 선택</option>
              <option >1</option>
              <option >2</option>
              <option >3</option>
              <option >4</option>
              <option >5</option>
              <option >6</option>
            </select></div>
          </div>
          <div class="ex_date">
	          <div>날짜 선택</div>
              <div><input type="text" id="choiceDate"></div>
          </div>
          <div class="ex_buy">
            <div>결제가격</div>
            <div>000,000원</div>
          </div>
          <div class="buy" style="height: 30%; text-align: center;  padding-top: 30px; padding-left: 30px;">
            <button id="buy_btn">예매하기</button>
          </div>
        </div>
        <div class="contents_wrap3">
          <div class="menu_top">
            <div id="desc">상세정보</div>
            <div id="review">이용후기</div>
            <div id="qna">Q&A</div>
          </div>
          <hr>
          <div class="menu_content1">
            &nbsp&nbsp 중견작가전은 한국 미술계에서 중추적 역할을 담당하는 중견작가들을 집중 조명하고자 마련된 
            세종문화회관의 기획전시 시리즈이다. 미술계 내 각종 지원 프로그램의 대상이 주로 신진 작가 층에 치중된 데 비해, 
            그들이 10년 이상 작품 활동을 이어가며 성장할 수 있도록 돕는 제도적 후원은 다소 부족한 실정이다. 
            이에 세종문화회관은 오랜 기간 묵묵히 작업 세계를 성숙시켜 온 중견 작가들을 발굴하기 위해 
            2019년부터 매년 중견작가전을 기획해왔다.그 세 번째 전시인 올해 《COUNTDOWN 2021》은 
            특별히 서울특별시미술관협의회의 추천을 거쳐 최종 선정된 중견작가 8인을 소개한다. 
            김범수, 김홍식, 류준화, 송윤주, 이상현, 이세경, 전윤정, 홍장오 작가는 20년 이상의 
            활동 기간 동안 저마다의 매체와 기법 실험을 거듭하며 8인 8색의 예술 세계를 구축해 왔다. 
            그런 만큼 이번 전시에서 소개되는 100여 점의 작품들은 주제, 소재, 재료, 기법 등 모든 면에서 
            다채로운 독창성을 자랑한다. 전시는 작가별로 한 섹션씩 총 8개 섹션과 한 개의 아카이브 룸으로 구성되어 있다.
          </div>
          <div class="menu_content2">
            리뷰입니다.
          </div>
          <div class="menu_content3">
             qna입니다.
          </div>
        </div>
      </div>
    </div>

    <div class="footer"> </div>
  </div>
  
  <!-- 상세설명, 리뷰, q&a 클릭에 따른 div 보여주기 코드  -->
  <script type="text/javascript">
  /*  상세 정보 클릭 시  */
  $("#desc").on("click", function(){

		$(".menu_content2").css("display", "none");
		$(".menu_content3").css("display", "none");
		$(".menu_content1").css("display", "inline");
		
	})
	
	/*  리뷰 클릭 시  */
  $("#review").on("click", function(){

		$(".menu_content2").css("display", "inline");
		$(".menu_content3").css("display", "none");
		$(".menu_content1").css("display", "none");
		
	})
	
	/*  qna 클릭 시  */
  $("#qna").on("click", function(){

		$(".menu_content2").css("display", "none");
		$(".menu_content3").css("display", "inline");
		$(".menu_content1").css("display", "none");
		
	})
	
	
  </script>
  
  
  <!--  날짜 api  -->
  <script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#choiceDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 /*onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    */
            });
             
    });
	</script>


	<!--  지도 api -->
	<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.572032050690076, 126.97607755414865), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.572032050690076, 126.97607755414865); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
    	position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	</script>
</body>

</html>