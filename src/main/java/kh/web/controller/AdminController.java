package kh.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.web.dao.AdminDAO;
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

		try {
			if(cmd.equals("/admin_login.admin")) {
				String id = request.getParameter("id");
				String pw = EncryptionUtils.pwdEncrypt(request.getParameter("pw"));
				boolean result = dao.login(id, pw);
				System.out.println(result);
				if(result) {
					request.getSession().setAttribute("loginID", id);
					request.getRequestDispatcher("/admin/admin_index.jsp").forward(request, response);
				} else {
					response.sendRedirect("/loginFail.jsp");
				}
			} else if(cmd.equals("/logout.admin")) {
				request.getSession().removeAttribute("loginID");
				response.sendRedirect("/admin/admin_login.jsp");
			} else if(cmd.equals("/input_ex_form.admin")) {
				request.getRequestDispatcher("/admin/admin_input_ex.jsp").forward(request, response);
			} else if(cmd.equals("/input_ex_dashboard.admin")) {
				request.getRequestDispatcher("/admin/admin_index.jsp").forward(request, response);
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
