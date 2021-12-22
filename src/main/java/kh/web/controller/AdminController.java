package kh.web.controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.web.dao.AdminDAO;
import kh.web.dto.DashboardDTO;
import kh.web.dto.ExhibitionDTO;
import kh.web.dto.MemberDTO;
import kh.web.utils.EncryptionUtils;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		AdminDAO dao = AdminDAO.getInstance();
		System.out.println(cmd);
		
		Gson g = new Gson();
		g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		try {
			// 관리자 로그인
			if(cmd.equals("/admin_login.admin")) {
				String id = request.getParameter("id");
				String pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw"));
				boolean result = dao.login(id, pw);
				
				if(result) {
					request.getSession().setAttribute("loginID", id);
					request.getRequestDispatcher("/admin/admin_index.jsp").forward(request, response);
				} else {
					response.sendRedirect("/loginFail.jsp");
				}
			} else if(cmd.equals("/logout.admin")) { // 로그아웃
				request.getSession().removeAttribute("loginID");
				response.sendRedirect("/admin/admin_login.jsp");
			} else if(cmd.equals("/input_ex_form.admin")) { // 전시회 등록창
				request.getRequestDispatcher("/admin/admin_input_ex.jsp").forward(request, response);
			} else if(cmd.equals("/input_ex_dashboard.admin")) { // 대시보드
				request.getRequestDispatcher("/admin/admin_index.jsp").forward(request, response);
			} else if(cmd.equals("/add_ex.admin")) { // 전시회 등록
				
				int maxSize = 1024*1024*10; 

				String savePath = request.getServletContext().getRealPath("files");
				
				File filePath = new File(savePath);

				if(!filePath.exists()) {
					filePath.mkdir();
				}

				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				
//				String oriName = multi.getOriginalFileName("ex_img");
//				String sysName = multi.getFilesystemName("ex_img");
				
				String oriName = "noimage.png";
				String sysName = "noimage.png";
				
				String ex_title = multi.getParameter("ex_title");
				String ex_desc = multi.getParameter("ex_desc");
				int ex_price = Integer.parseInt(multi.getParameter("ex_price"));
				String ex_location = multi.getParameter("ex_location");
				int ex_score = 0;
				Date ex_start_date = Date.valueOf(multi.getParameter("ex_start_date"));
				Date ex_end_date = Date.valueOf(multi.getParameter("ex_end_date"));
				
				ExhibitionDTO eDto = new ExhibitionDTO(null, ex_title, ex_desc, ex_price, ex_location, ex_score, ex_start_date, ex_end_date, oriName, sysName);
				int result = dao.insertEx(eDto);
				if(result > 0) {
//					System.out.println("OK");
				}
				request.getRequestDispatcher("/admin/admin_input_ex.jsp").forward(request, response);
			} else if(cmd.equals("/member_list.admin")) { // 회원 리스트
				List<MemberDTO> list = dao.selectAllMember();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/admin_member_list.jsp").forward(request, response);
			} else if(cmd.equals("/show_ex_list.admin")) { // 전시회 리스트
				List<ExhibitionDTO> list = dao.selectAllEx();
				request.setAttribute("list", list);
				request.getRequestDispatcher("/admin/admin_ex_list.jsp").forward(request, response);
				
			} else if(cmd.equals("/monthlyData.admin")) { // 월간 가입자
				List<DashboardDTO> list = dao.selectMonthlyData();
				String result = g.toJson(list);
				response.getWriter().append(result);
				
			} else if(cmd.equals("/dailyData.admin")) { // 일간 가입자
				List<DashboardDTO> list = dao.selectDailyData();
				String result = g.toJson(list);
				response.getWriter().append(result);
				
			} else if(cmd.equals("/dailyVisitData.admin")) { // 일간 방문자
				List<DashboardDTO> list = dao.selectDailyVisitData();
				String result = g.toJson(list);
				response.getWriter().append(result);
				
			} else if(cmd.equals("/monthlyVisitData.admin")) { // 월간 방문자
				List<DashboardDTO> list = dao.selectMonthlyVisitData();
				String result = g.toJson(list);
				response.getWriter().append(result);
				
			} else if(cmd.equals("/dailyQnAData.admin")) { // 일간 Q&A 게시물 수
				List<DashboardDTO> list = dao.selectDailyQnAData();
				String result = g.toJson(list);
				response.getWriter().append(result);
				
			} else if(cmd.equals("/monthlyQnAData.admin")) { // 월간 Q&A 게시물 수
				List<DashboardDTO> list = dao.selectMonthlyQnAData();
				String result = g.toJson(list);
				response.getWriter().append(result);
				
			} else if(cmd.equals("/dailyRevenueData.admin")) { // 일간 수익
				List<DashboardDTO> list = dao.selectDailyRevenueData();
				String result = g.toJson(list);
				response.getWriter().append(result);
				
			} else if(cmd.equals("/monthlyRevenueData.admin")) { // 월간 수익
				List<DashboardDTO> list = dao.selectMonthlyRevenueData();
				String result = g.toJson(list);
				response.getWriter().append(result);
			} else if(cmd.equals("/memberGradeData.admin")) {	 // 회원 등급별
				List<DashboardDTO> list = dao.selectMemberGradeData();
				String result = g.toJson(list);
				response.getWriter().append(result);
			} else if(cmd.equals("/memberGenData.admin")) {	 // 회원 연령별
				List<DashboardDTO> list = dao.selectMemberGenerationData();
				String result = g.toJson(list);
				response.getWriter().append(result);
			} else if(cmd.equals("/memberLocationData.admin")) { // 회원 지역별
				List<DashboardDTO> list = dao.selectMemberLocationData();
				String result = g.toJson(list);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().append(result);
			} else if(cmd.equals("/getExListDesc.admin")) { // 전시 상세페이지
				String ex_id = request.getParameter("ex_id");
				ExhibitionDTO eDto = dao.selectByExId(ex_id);
				
				String result = g.toJson(eDto);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().append(result);
			}
		} catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
