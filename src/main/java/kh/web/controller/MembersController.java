package kh.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.web.dao.MemberDAO;
import kh.web.dto.MemberDTO;
import kh.web.utils.EncryptionUtils;

@WebServlet("*.mem")
public class MembersController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		request.setCharacterEncoding("UTF-8");
		MemberDAO dao = MemberDAO.getInstance();
		System.out.println(cmd);
		try {
			if(cmd.equals("/idCheck.mem")) { //id 중복 체크
				String id = request.getParameter("id");

				try {
					boolean result = dao.isIdExist(id);
					response.getWriter().append(String.valueOf(result));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(cmd.equals("/insert.mem")) { // 회원가입 폼에서 회원가입 버튼 눌렀을 때
				String id = request.getParameter("id");
				String pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw1"));
				String name = request.getParameter("name");
				String birth = request.getParameter("birth");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone")+request.getParameter("phone1")+request.getParameter("phone2");
				String zipcode = request.getParameter("zipcode");
				String addr1 = request.getParameter("addr1");
				String addr2 = request.getParameter("addr2");
				String account = request.getParameter("account");

				MemberDTO dto = new MemberDTO(id,pw,name,birth,email,phone,zipcode,addr1,addr2,null,null,account);
				dao.insert(dto);
				response.sendRedirect("/login.jsp");
			}else if(cmd.equals("/signup.mem")) { // 로그인 화면에서 회원가입 버튼을 눌렀을 때 회원가입 화면으로 이동
				response.sendRedirect("member/signup.jsp");
			}else if(cmd.equals("/login.mem")) { // 로그인 화면에서 로그인 버튼을 눌렀을 때
				String id = request.getParameter("id");
				String pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw"));

				boolean result = dao.login(id, pw);
				
				if(result) { 
					HttpSession session = request.getSession(); 
					session.setAttribute("loginId", id); 
				}
				response.sendRedirect("/login.jsp");
			}else if(cmd.equals("/findId.mem")) { // 로그인 화면에서 아이디 찾기 버튼을 눌렀을 때
				response.sendRedirect("member/findId.jsp");
			}else if(cmd.equals("/confirmInfor.mem")) {// 로그인 화면에서 비밀번호 찾기 버튼을 눌렀을 때
				response.sendRedirect("member/confirmInfor.jsp");
			}else if(cmd.equals("/confirmId.mem")) {
				String name = request.getParameter("name");
				String birth = request.getParameter("birth");
				String phone = request.getParameter("phone")+request.getParameter("phone1")+request.getParameter("phone2");
				
				String id = dao.searchId(name,birth,phone);
				System.out.println(id);
				request.setAttribute("id", id);
				request.getRequestDispatcher("/member/confirmId.jsp").forward(request, response);
			}else if(cmd.equals("/login.mem")) {
				response.sendRedirect("/login.jsp");
			}
		}catch(Exception e) { // 에러 났을 때 에러페이지로 이동
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
