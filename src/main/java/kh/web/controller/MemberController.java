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
public class MemberController extends HttpServlet {

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
				boolean result = dao.isIdExist(id);
				response.getWriter().append(String.valueOf(result));
	
			}else if(cmd.equals("/phoneCheck.mem")) { // 전화번호 중복 체크
				String phone = request.getParameter("phone");
				boolean result = dao.isPhoneExist(phone);
				response.getWriter().append(String.valueOf(result));
			
			}else if(cmd.equals("/successSignup.mem")) {// 회원가입 폼에서 회원가입 버튼 눌렀을 때
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
				response.sendRedirect("/member/successSignup.jsp");
				
			}else if(cmd.equals("/insert.mem")) { // 회원가입 완료에서 로그인으로 넘어가기 버튼 눌렀을 때
				response.sendRedirect("/login.jsp");
				
			}else if(cmd.equals("/signup.mem")) { // 로그인 화면에서 회원가입 버튼을 눌렀을 때 회원가입 화면으로 이동
				response.sendRedirect("member/signup.jsp");
				
			}else if(cmd.equals("/login.mem")) { // 로그인 화면에서 로그인 버튼을 눌렀을 때
				String id = request.getParameter("id");
				String pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw"));
				
				MemberDTO dto = dao.selectById(id); 
				
				boolean result = dao.login(id, pw);
				if(result) { 
					HttpSession session = request.getSession(); 
					session.setAttribute("loginId", id);
					session.setAttribute("loginGrade", dto.getMem_grade());
					session.setAttribute("loginName", dto.getMem_name());
					session.setAttribute("loginPhone", dto.getMem_phone());
					session.setAttribute("loginEmail", dto.getMem_email());
					
					response.sendRedirect("/artexMain/mainpage.jsp");
				}else {
					response.sendRedirect("/loginFail.jsp");
				}
				
			}else if(cmd.equals("/findId.mem")) { // 로그인 화면에서 아이디 찾기 버튼을 눌렀을 때
				response.sendRedirect("member/findId.jsp");
				
			}else if(cmd.equals("/confirmInfor.mem")) {// 로그인 화면에서 비밀번호 찾기 버튼을 눌렀을 때
				response.sendRedirect("member/confirmInfor.jsp");
				
			}else if(cmd.equals("/confirmId.mem")) { // id 찾기 화면에서 개인정보 입력 후 id 찾기 버튼을 눌렀을 때
				String name = request.getParameter("name");
				String birth = request.getParameter("birth");
				String phone = request.getParameter("phone")+request.getParameter("phone1")+request.getParameter("phone2");
				String id = dao.searchId(name,birth,phone);

				request.setAttribute("id", id);
				request.getRequestDispatcher("/member/confirmId.jsp").forward(request, response);
				
			}else if(cmd.equals("/confirm.mem")) { // 로그인 화면에서 비밀번호 찾기 버튼을 누른 후 개인정보 입력 후에 비밀번호 재설정 버튼을 눌렀을 때
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone")+request.getParameter("phone1")+request.getParameter("phone2");
				String getId = dao.checkInfor(id,name,email,phone);
				
				request.setAttribute("id", getId);
				request.getRequestDispatcher("member/modifyPw.jsp").forward(request, response);
			
			}else if(cmd.equals("/home.mem")) { // 홈으로 버튼을 눌렀을 때 
				response.sendRedirect("/login.jsp");
			
			}else if(cmd.equals("/modifyPw.mem")) { // 패스워드 변경 버튼 눌렀을 시
				String id = request.getParameter("id");
				String pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw1"));
				
				int result = dao.updatePw(id,pw);
				request.setAttribute("result", result);
				request.getRequestDispatcher("member/confirmPw.jsp").forward(request, response);
			
			}else if(cmd.equals("/leave.mem")) { //회원탈퇴 버튼 눌렀을 시
				String pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw"));
				String id = (String)request.getSession().getAttribute("loginId");
				
				int result = dao.deleteMember(id,pw);
				request.getSession().invalidate();
				request.setAttribute("result", result);
				request.getRequestDispatcher("member/leaveSuccess.jsp").forward(request, response);
			
			}else if(cmd.equals("/modifyInfor.mem")) { //회원정보 수정에서 수정하기 버튼을 눌렀을 시
				String id = (String)request.getSession().getAttribute("loginId");
				String pw = request.getParameter("pw1");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone")+request.getParameter("phone1")+request.getParameter("phone2");
				String zipcode = request.getParameter("zipcode");
				String addr1 = request.getParameter("addr1");
				String addr2 = request.getParameter("addr2");

				MemberDTO dto = dao.selectById(id);
				if(pw.equals("")) {
					pw = dto.getMem_pw();
				}else {
					pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw1"));
				}
				
				if(email.equals("")) {
					email = dto.getMem_email();
				}
				if(request.getParameter("phone1").equals("")||request.getParameter("phone2").equals("")) {
					phone = dto.getMem_phone();
				}
				if(zipcode.equals("")) {
					zipcode = dto.getMem_zipcode();
				}
				if(addr1.equals("")) {
					addr1 = dto.getMem_addr1();
				}
				if(addr2.equals("")) {
					addr2 = dto.getMem_addr2();
				}
				
				dao.updateInfor(id,pw,email,phone,zipcode,addr1,addr2);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/mypage/modifyInfor.jsp").forward(request, response);
				
			}else if(cmd.equals("/memberGrade.mem")) { //회원정보 수정에서 회원 등급 버튼 눌렀을 시
				response.sendRedirect("mypage/memberRank.jsp");
				
			}else if(cmd.equals("/modifyForm.mem")) { // 마이페이지 버튼 누르거나 회원정보 수정 버튼 눌렀을 시
				String id = (String)request.getSession().getAttribute("loginId");
				MemberDTO dto = dao.selectById(id);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("mypage/modifyInfor.jsp").forward(request, response);
			
			}else if(cmd.equals("/myCommentForm.mem")) { //내가 쓴 글, 댓글 버튼 눌렀을 시
				response.sendRedirect("mypage/myComment.jsp");
				
			}else if(cmd.equals("/leaveForm.mem")) {// 회원탈퇴 버튼 눌렀을 시
				String id = (String)request.getSession().getAttribute("loginId");
				MemberDTO dto = dao.selectById(id);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("mypage/leaveMember.jsp").forward(request, response);
				
			}else if(cmd.equals("/logout.mem")) { // 로그아웃 버튼 눌렸을 시
				request.getSession().invalidate();
				response.sendRedirect("/artexMain/mainpage.jsp");
				
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
