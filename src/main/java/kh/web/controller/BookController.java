package kh.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.BookDAO;
import kh.web.dto.BookDTO;

@WebServlet("*.book")
public class BookController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		BookDAO dao = BookDAO.getInstance();
		System.out.println(cmd);

		try {
			if(cmd.equals("/ex_desc1.book")) {
				request.getRequestDispatcher("/book/ex_desc01.jsp").forward(request, response);
			}else if(cmd.equals("/bookTest.book")) {
				List<BookDTO> list = dao.selectAll();
				
				System.out.println(list.size());
				
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("mypage/refund.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
