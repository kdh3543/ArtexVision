package kh.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.Nb_BoardDAO;
import kh.web.dao.Qb_BoardDAO;
import kh.web.dto.Nb_BoardDTO;
import kh.web.dto.Qb_BoardDTO;
import kh.web.statics.paging_Statics;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf8");
		Nb_BoardDAO nb_dao = Nb_BoardDAO.getInstance();
		Qb_BoardDAO qb_dao = Qb_BoardDAO.getInstance();
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		try {
			if(cmd.equals("/nb_list.board")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int pageTotalCount = nb_dao.getPageTotalCount();
				if(currentPage < 1) {currentPage = 1;}
				if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
				
				int start = currentPage * paging_Statics.RECORD_COUNT_PER_PAGE - (paging_Statics.RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * paging_Statics.RECORD_COUNT_PER_PAGE;
				
				List<Nb_BoardDTO> list = nb_dao.selectByBound(start, end);
				String navi = nb_dao.getPageNavi(currentPage);
				request.setAttribute("nb_list", list);
				request.setAttribute("nb_navi", navi);
				request.getRequestDispatcher("/board/nb_index.jsp").forward(request, response); // forward
			
			}else if(cmd.equals("/nb_write.board")) {
				response.sendRedirect("/board/nb_write.jsp");
			
			}else if(cmd.equals("/nb_writeProc.board")) {
//				String writer = (String) request.getSession().getAttribute("loginID");
				String title = request.getParameter("nb_title");
				String contents = request.getParameter("nb_contents");
				nb_dao.insert(new Nb_BoardDTO(0, title, contents, "hosboy93", null, 0));
				response.sendRedirect("/nb_list.board?cpage=1");
			
			}else if(cmd.equals("/nb_detail.board")) {				
				int nb_seq = Integer.parseInt(request.getParameter("nb_seq"));
				Nb_BoardDTO noticeboard_dto = nb_dao.selectBySeq(nb_seq);
				int result = nb_dao.addViewCount(nb_seq);
				request.setAttribute("noticeboard_dto", noticeboard_dto);
				request.getRequestDispatcher("/board/nb_detail.jsp").forward(request, response);
			
			}else if(cmd.equals("/nb_modify.board")) {
				int nb_seq = Integer.parseInt(request.getParameter("nb_seq"));
				String nb_title = request.getParameter("nb_title");
				String nb_contents = request.getParameter("nb_contents");
				int result = nb_dao.modify(nb_seq, nb_title, nb_contents);
				response.sendRedirect("/nb_detail.board?nb_seq="+ nb_seq);
			
			}else if(cmd.equals("/nb_delete.board")) {
				int nb_seq = Integer.parseInt(request.getParameter("nb_seq"));
				int result = nb_dao.delete(nb_seq);
				response.sendRedirect("/nb_list.board?cpage=1");

			}else if(cmd.equals("/nb_search.board")) {
				String searchMethod = request.getParameter("searchOption");

				if(searchMethod.equals("제목")) {
					System.out.println("제목으로 찾는 중");
				}else if(searchMethod.equals("아이디")) {
					System.out.println("아이디로 찾는 중");
				}
			}
			
			else if(cmd.equals("/qb_list.board")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int pageTotalCount = qb_dao.getPageTotalCount();
				if(currentPage < 1) {currentPage = 1;}
				if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
				
				int start = currentPage * paging_Statics.RECORD_COUNT_PER_PAGE - (paging_Statics.RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * paging_Statics.RECORD_COUNT_PER_PAGE;
				
				List<Qb_BoardDTO> list = qb_dao.selectByBound(start, end);
				String navi = qb_dao.getPageNavi(currentPage);
				request.setAttribute("qb_list", list);
				request.setAttribute("qb_navi", navi);
				request.getRequestDispatcher("/board/qb.jsp").forward(request, response); // forward
			
			}else if(cmd.equals("/qb_write.board")) {
				response.sendRedirect("/board/qb_write.jsp");
			
			}else if(cmd.equals("/qb_writeProc.board")) {
//				String writer = (String) request.getSession().getAttribute("loginID");
				String title = request.getParameter("qb_title");
				String contents = request.getParameter("qb_contents");
				qb_dao.insert(new Qb_BoardDTO(0, title, contents, "hosboy93", null, 0));
				response.sendRedirect("/qb_list.board?cpage=1");
			
			}else if(cmd.equals("/qb_detail.board")) {				
				int qb_seq = Integer.parseInt(request.getParameter("qb_seq"));
				Qb_BoardDTO questionboard_dto = qb_dao.selectBySeq(qb_seq);
				int result = qb_dao.addViewCount(qb_seq);
				request.setAttribute("questionboard_dto", questionboard_dto);
				request.getRequestDispatcher("/board/qb_detail.jsp").forward(request, response);
			
			}else if(cmd.equals("/qb_modify.board")) {
				int qb_seq = Integer.parseInt(request.getParameter("qb_seq"));
				String qb_title = request.getParameter("qb_title");
				String qb_contents = request.getParameter("qb_contents");
				int result = qb_dao.modify(qb_seq, qb_title, qb_contents);
				response.sendRedirect("/qb_detail.board?qb_seq="+ qb_seq);
			
			}else if(cmd.equals("/qb_delete.board")) {
				int qb_seq = Integer.parseInt(request.getParameter("qb_seq"));
				int result = qb_dao.delete(qb_seq);
				response.sendRedirect("/qb_list.board?cpage=1");

			}else if(cmd.equals("/qb_search.board")) {
				String searchMethod = request.getParameter("searchOption");

				if(searchMethod.equals("제목")) {
					System.out.println("제목으로 찾는 중");
				}else if(searchMethod.equals("아이디")) {
					System.out.println("아이디로 찾는 중");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
