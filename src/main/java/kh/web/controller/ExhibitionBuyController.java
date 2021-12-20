package kh.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dto.ExhibitionDTO;

@WebServlet("*.exbuy")
public class ExhibitionBuyController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		  request.setCharacterEncoding("utf8");
		  
		  String requestURI = request.getRequestURI(); 
		  String ctxPath = request.getContextPath();
		  
		  String cmd = requestURI.substring(ctxPath.length());
		  
		  try { 
			  if(cmd.equals("/toPay.exbuy")) { 
//				 결제 데이터 전달해야함. 일단 임시로 창이동만 구현할게요!
		  response.sendRedirect("/book/ex_pay2.jsp"); } 
			  }catch(Exception e){ e.printStackTrace(); }
		 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
