package kh.web.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.BookDAO;
import kh.web.dao.ExhibitionDAO;
import kh.web.dao.MemberDAO;
import kh.web.dto.BookDTO;
import kh.web.dto.ExhibitionDTO;
import kh.web.dto.MemberDTO;
import kh.web.utils.DateUtils;

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
			}else if(cmd.equals("/bookRefund.book")) {
				List<BookDTO> list = dao.selectAll();
				
				System.out.println(list.size());
				
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("mypage/refund.jsp").forward(request, response);
			
			}else if(cmd.equals("/cancelBook.book")) {
				String bookVal = request.getParameter("bookVal");
				System.out.println(bookVal);
//				int result = dao.deleteById(bookVal);
//				response.getWriter().append(bookVal);

			
			}else if(cmd.equals("/bookExhibition.book")) {
				String id = (String)request.getSession().getAttribute("loginId");
				String exhibitionName = request.getParameter("exhibitionName");
				int person = Integer.parseInt(request.getParameter("person"));
				int payMoney = Integer.parseInt(request.getParameter("payMoney"));
				String bookDate = request.getParameter("bookDate");
				bookDate = "2021-11-21";
				
				Date date= DateUtils.changeDate(bookDate);
				
				MemberDAO mdao = MemberDAO.getInstance();
				MemberDTO mdto = mdao.selectById(id);
				ExhibitionDAO edao = ExhibitionDAO.getInstance();
				ExhibitionDTO edto = edao.selectByExName(exhibitionName);
				
				BookDTO dto = new BookDTO(0,person,true,edto.getEx_id(),edto.getEx_title(),edto.getEx_price(),
						mdto.getMem_id(),mdto.getMem_name(),mdto.getMem_email(),mdto.getMem_birth(),mdto.getMem_phone(),
						mdto.getMem_zipcode(),mdto.getMem_addr1(),mdto.getMem_addr2(),mdto.getMem_grade(),mdto.getMem_account(),
						null,date);
						
				dao.insert(dto);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/book/ex_pay.jsp").forward(request, response);

			}else if(cmd.equals("/priceToss.book")) {
				
				String exhibitionName = request.getParameter("ex_title");
				String payMoney = request.getParameter("realprice");
				String person = request.getParameter("person");
				String bookDate = request.getParameter("bookDate");
				request.setAttribute("exhibitionName", exhibitionName);
				request.setAttribute("payMoney", payMoney);
				request.setAttribute("person", person);
				request.setAttribute("bookDate", bookDate);
				System.out.println(bookDate);
				request.getRequestDispatcher("/book/ex_pay2.jsp").forward(request, response);

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
