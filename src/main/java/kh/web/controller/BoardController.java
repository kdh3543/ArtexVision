package kh.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.Nb_BoardDAO;
import kh.web.dto.Nb_BoardDTO;
import kh.web.statics.paging_Statics;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf8");
		Nb_BoardDAO dao = Nb_BoardDAO.getInstance();
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		try {
			if(cmd.equals("/nb_list.board")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int pageTotalCount = dao.getPageTotalCount();
				if(currentPage < 1) {currentPage = 1;}
				if(currentPage > pageTotalCount) {currentPage = pageTotalCount;}
				
				int start = currentPage * paging_Statics.RECORD_COUNT_PER_PAGE - (paging_Statics.RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * paging_Statics.RECORD_COUNT_PER_PAGE;
				
				List<Nb_BoardDTO> list = dao.selectByBound(start, end);
				String navi = dao.getPageNavi(currentPage);
				request.setAttribute("nb_list", list);
				request.setAttribute("nb_navi", navi);
				request.getRequestDispatcher("/board/nb_index.jsp").forward(request, response); // forward
			
			}else if(cmd.equals("/nb_write.board")) {
				response.sendRedirect("/board/nb_write.jsp");
			
			}else if(cmd.equals("/nb_writeProc.board")) {
//				String writer = (String) request.getSession().getAttribute("loginID");
				String title = request.getParameter("nb_title");
				String contents = request.getParameter("nb_contents");
				dao.insert(new Nb_BoardDTO(0, title, contents, "hosboy93", null, 0));
				response.sendRedirect("/nb_list.board?cpage=1");
			
			}else if(cmd.equals("/nb_detail.board")) {				
				int nb_seq = Integer.parseInt(request.getParameter("nb_seq"));
				Nb_BoardDTO noticeboard_dto = dao.selectBySeq(nb_seq);
				int result = dao.addViewCount(nb_seq);
				request.setAttribute("noticeboard_dto", noticeboard_dto);
				request.getRequestDispatcher("/board/nb_detail.jsp").forward(request, response);
			
			}else if(cmd.equals("/nb_modify.board")) {
				int nb_seq = Integer.parseInt(request.getParameter("nb_seq"));
				String nb_title = request.getParameter("nb_title");
				String nb_contents = request.getParameter("nb_contents");
				int result = dao.modify(nb_seq, nb_title, nb_contents);
				response.sendRedirect("/nb_detail.board?nb_seq="+ nb_seq);
			
			}else if(cmd.equals("/nb_delete.board")) {
				int nb_seq = Integer.parseInt(request.getParameter("nb_seq"));
				int result = dao.delete(nb_seq);
				response.sendRedirect("/nb_list.board?cpage=1");
			
			}else if(cmd.equals("/nb_search.board")) {
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
