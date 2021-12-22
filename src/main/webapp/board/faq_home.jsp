<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Artex Vision</title>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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


    /* 전체 설정 css end */

    /* container start */
    .container {
      width: 1200px;
      margin: auto;
    }
    
    .container>div{
    	width: 1200px;
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

    .sidebar {
      width: 15%;
      height: 100%;
      background-color: var(--color3);
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

    .contents {
      width: 80%;
    }

    .footer {
      height: 150px;
      background-color: var(--color1);
    }

    .container2 {
      overflow: hidden;
      height: 800px;
    }

    .sidebar {
      float: left;
      width: 15%;
      height: 100%;
    }

    .notice_faq_content {
      float: left;
      width: 85%;
      padding: 15px;

    }

    .notice_faq_head {
      text-align: center;
      height: 30px;
      line-height: 30px;
    }

    .notice_faq_boardname {
      overflow: hidden;
    }

    .notice_faq_boardname>div {
      float: left;
    }

    .notice_faq_prevboard {
      margin-right: 5px;
      margin-left: 10px;
    }

    .notice_faq_prevboard:hover {
      cursor: pointer;
    }

    .notice_faq_presentboard {
      margin-left: 5px;
    }

    .notice_faq_presentboard:hover {
      cursor: pointer;
    }

    .notice_faq_firstfaq {
      padding-top: 50px;
    }

    .notice_faq_head>div {
      border-bottom: 1px solid black;
      padding: 10px;
      text-align: left;
    }

    .notice_faq_menu {
      width: 100%;
    }

    .notice_faq_menu:hover {
      cursor: pointer;
    }

    .notice_faq_menu>div {
      float: left;
      width: 25%;
      text-align: center;
    }

    .contents_wrap3 {
      width: 100%;
      height: 40%;
      padding-left: 40px;
      padding-right: 40px;
      padding-top: 40px;
      float: left;
    }

    .menu_top {
      width: 100%;
      height: 13%;
    }

    .menu_top>div {
      float: left;
      font-size: larger;
      width: 20%;
      text-align: center;
      height: 50px;
      line-height: 50px;
    }

    .menu_top>div:hover {
      cursor: pointer;
      border-bottom: solid var(--color11);
    }

    .menu_content1 {
      display: inline;
    }

    .menu_content2 {
      padding: 20px;
      display: none;
    }

    .menu_content3 {
      padding: 20px;
      display: none;
    }

    .menu_content4 {
      padding: 20px;
      display: none;
    }

    .contents_wrap3>div>div:hover {
      cursor: pointer;
    }
    
    .contents_wrap3>.menu_content1>div:nth-child(3n){
      display: none;
    }
    .contents_wrap3>.menu_content2>div:nth-child(3n+2){
      display: none;
    }
    .contents_wrap3>.menu_content3>div:nth-child(3n+2){
      display: none;
    }
    .contents_wrap3>.menu_content4>div:nth-child(3n+2){
      display: none;
    }
    a {
          text-align: center;
          text-decoration: none;
          /* 링크의 밑줄 제거 */
          color: inherit;
          /* 링크의 색상 제거 */
        }

        a:hover {
          color: black;
          /* 링크의 색상 제거 */
        }
  </style>
</head>

<body>
  <div class="container">
    <c:choose>
          <c:when test="${loginId!=null}">
            <div class="header" id="topTarget">
              <ul class="header_list">
                <li class="user_detail"><span id="user_grade"><i class="fas fa-crown"></i> ${loginGrade }</li></span>
                <li id="welcome"> ${loginId } 님 환영합니다.</li>
                <li id="mypage"><a href="/modifyForm.mem">마이페이지</a></li>
                <li id="basket"><a href="/basket/basket.jsp" id="basket">장바구니</a></li>
                <li id=logout><a href="/logout.mem" id="logout">로그아웃</a></li>
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
                <li><a href="/nb_list.board?cpage=1" id="notice">NOTICE</a></li>
                <li><a href="/artexDesc/artex_desc.jsp">Artex Vision</a></li>
                <li><a href="/exhibition/main_ex/now_main_ex.jsp">전시</a></li>
                <li><a href="/event/now_event/now_event.jsp" id="event">이벤트</a></li>
              </ul>
            </div>
          </div>
        </div>
	<div class="carousel_timeline">
          <div class="carousel">
            <img src="/exhibition/img/artex_main_img.png" class="carousel_img">
          </div>
    </div>
    <div class="container2">
      <div class="sidebar">
        <h2 class="list_title">NOTICE</h2>
        <ul class="sidebar_item_list">
          <li class="sidebar_item"><a href="/nb_list.board?cpage=1">공지사항</a></li>
          <li class="sidebar_item"><a href="/qb_list.board?cpage=1">Q&A</a></li>
          <li class="sidebar_item"><a href="/board/faq_home.jsp">FAQ</a></li>
        </ul>
      </div>
      <div class="notice_faq_content">
        <br>
        <div class="notice_faq_boardname">
          <div class="notice_faq_prevboard">NOTICE</div>
          <div>></div>
          <div class="notice_faq_presentboard">FAQ</div>
        </div>


        <div class="contents_wrap3">
          <div class="menu_top">
            <div id="desc">관람</div>
            <div id="review">홈페이지</div>
            <div id="qna">출판</div>
            <div id="etc">기타</div>
          </div>
          <br><br>
          <hr>
          <div class="menu_content1">
            <br>
            <div class="question1_1">Q. 전시회의 위치에 대해 알려주세요.</div>
            <div class="answer1_1"><br>A. 전시회의 위치에 전시회 상세정보에서 확인하실 수 있습니다.</div>
            <hr>
            <div class="question1_2">Q. 단체관람을 하고 싶습니다. 어떻게 해야 하나요?</div>
            <div class="answer1_2"><br>A.현재는 코로나로 인해 단체 예약을 받을 수 없습니다.</div>
            <hr>
            <div class="question1_3">Q. 전시실의 작품 촬영이 가능한가요?</div>
            <div class="answer1_3"><br>A.작품이 전시되어 있는 전시장 내부에서는 삼각대 및 플래시를 사용한 사진촬영이 불가능합니다. 단, 언론사의 보도 및 공공기관의 공익사업, 교유긱관의 학술적인 연구를 목적으로 한 촬영은 가능합니다.</div>
            <hr>
          </div>
          <div class="menu_content2">
            <div class="question2_1">Q. 홈페이지 가입을 했는데 인증메일이 안옵니다.</div>
            <div class="answer2_1"><br>A.대부분 스팸메일함을 보시면 인증메일이 있습니다. 스팸메일함에도 없는 경우 방화벽에 의해 오지 않는 경우도 있습니다.</div>
            <hr>
            <div class="question2_2">Q. 회원가입 화면이 갑자기 하얗게 뜨면서 진행이 안됩니다.</div>
            <div class="answer2_2"><br>A.와이파이 환경에서 회원가입을 할 경우 속도가 느려서 데이터를 받지 못해 생기는 경우입니다.</div>
            <hr>
            <div class="question2_3">Q. 홈페이지에 있는 소장품이나 전시관련 이미지를 사용해도 되나요?</div>
            <div class="answer2_3"><br>A.공공누리가 부착되지 않은 자료들을 사용하고자 할 경우 담당자와 사전에 협의한 이후에 사용하시기 바랍니다.</div>
            <hr>
          </div>
          <div class="menu_content3">
            <div class="question3_1">Q. 출판물의 종류는 무엇이 있나요?</div>            
            <div class="answer3_1"><br>A.전시 도록을 비롯해 미술관 레지던시 자료집, 정기간행물로 연구논문집, 미술 작품 보존을 위한 보존과학 연구지가 있습니다.</div>
            <hr>
            <div class="question3_2">Q. 전시 도록은 어디서 구입할 수 있나요?</div>
            <div class="answer3_2"><br>A.전시 개막일이나 전시 기간 중에 발간되므로 도록의 판매 여부를 아트존에 문의하신 후, 미술관에서 직접 구입하시면 됩니다.</div>
            <hr>
            <div class="question3_3">Q. 미술관 정기간행물을 인쇄물로 받아볼 수 있나요?</div>
            <div class="answer3_3"><br>A.정기간행물은 미술기관이나 공공 도서관 중심으로 배포되는 비매품입니다. 현재 간행물은 해당 페이지에서 PDF파일로 내려 받으실 수 있습니다.</div>
            <hr>
          </div>
          <div class="menu_content4">
            <div class="question4_1">Q. 미술관에서 소지품을 분실한 경우 어떻게 하면 될까요?</div>
            <div class="answer4_1"><br>A.고객지원실로 연락주시기 바랍니다.</div>
            <hr>
            <div class="question4_2">Q. 현재 개최 또는 앞으로 개최될 각종 행사 일정을 알고 싶습니다.</div>
            <div class="answer4_2"><br>A.전시 및 행사 등 각종 일정의 구체적인 내용은 미술관 홈페이지에서 확인할 수 있습니다.</div>
            <hr>            
          </div>
        </div>
      </div>
    </div>
    <div class="footer">

    </div>
  </div>
  <script type="text/javascript">
    // 상세 정보 클릭 시
    $("#desc").on("click", function () {
      $(".menu_content1").css("display", "inline");
      $(".menu_content2").css("display", "none");
      $(".menu_content3").css("display", "none");
      $(".menu_content4").css("display", "none");
    })

    //  리뷰 클릭 시
    $("#review").on("click", function () {
      $(".menu_content1").css("display", "none");
      $(".menu_content2").css("display", "inline");
      $(".menu_content3").css("display", "none");
      $(".menu_content4").css("display", "none");
    })

    //  qna 클릭 시  
    $("#qna").on("click", function () {
      $(".menu_content1").css("display", "none");
      $(".menu_content2").css("display", "none");
      $(".menu_content3").css("display", "inline");
      $(".menu_content4").css("display", "none");
    })

    $("#etc").on("click", function () {
      $(".menu_content1").css("display", "none");
      $(".menu_content2").css("display", "none");
      $(".menu_content3").css("display", "none");
      $(".menu_content4").css("display", "inline");
    })

    $(".question1_1").on("click", function () {
      $(".answer1_1").slideToggle("1000");
    })
    $(".question1_2").on("click", function () {
      $(".answer1_2").slideToggle("1000");
    })
    $(".question1_3").on("click", function () {
      $(".answer1_3").slideToggle("1000");
    })

    $(".question2_1").on("click", function () {
      $(".answer2_1").slideToggle("1000");
    })
    $(".question2_2").on("click", function () {
      $(".answer2_2").slideToggle("1000");
    })
    $(".question2_3").on("click", function () {
      $(".answer2_3").slideToggle("1000");
    })

    $(".question3_1").on("click", function () {
      $(".answer3_1").slideToggle("1000");
    })
    $(".question3_2").on("click", function () {
      $(".answer3_2").slideToggle("1000");
    })
    $(".question3_3").on("click", function () {
      $(".answer3_3").slideToggle("1000");
    })

    $(".question4_1").on("click", function () {
      $(".answer4_1").slideToggle("1000");
    })
    $(".question4_2").on("click", function () {
      $(".answer4_2").slideToggle("1000");
    })
    $("#logout").on("click", function () {
      if (!confirm("로그아웃 하시겠습니까?")) {
        return false;
      }
    })

    $("#basket").on("click", function () {
      alert("현재 기능은 구현중에 있습니다.");
      return false;
    })
   
  </script>
  <!-- 커뮤니티 end -->
</body>

</html>