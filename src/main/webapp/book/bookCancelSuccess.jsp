<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginFail</title>
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

        div {
          /* border: 1px solid black; */
        }

        .cancel_book_box {
          margin: auto;    
          width: 450px;
          margin-top: 100px;
          padding-top: 50px;
          background-color: var(--color3);
          color: var(--color2);
          text-align: center;

        }

        input[type="button"] {
          background-color: var(--color7);
          color: var(--color2);
          border: none;
          width: 35%;
          height: 30px;
          cursor: pointer;
        }
        .btns{
          padding-top: 20px;
          padding-bottom: 20px;
        }
      </style>
</head>
<body>
	<div class="cancel_book_box">
		예매 취소가 완료되었습니다.<br> 
		다른 상품을 보시겠습니까?
		<div class="btns">
			<a href="/exhibition/main_ex/now_main_ex.jsp"><input type="button" value="전시페이지로 가기"></a> 
			<a href="/artexMain/mainpage.jsp"><input type="button" value="홈으로 돌아가기"></a>
		</div>
	</div>
</body>
</html>