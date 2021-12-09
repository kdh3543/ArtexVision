package kh.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		try {
			if(cmd.equals("/idCheck.mem")) {
				String id = request.getParameter("id");

				try {
					boolean result = dao.isIdExist(id);
					response.getWriter().append(String.valueOf(result));
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(cmd.equals("/signup.mem")) {
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
				response.sendRedirect("/signup.jsp");
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
