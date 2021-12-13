package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	private static AdminDAO instance = null;

	public static AdminDAO getInstance(){
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	private AdminDAO() {}


	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public boolean login(String id, String pw) throws Exception {
		String sql = "select * from admin where admin_id = ? and admin_pw = ?";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
		
			return rs.next();
		}
	}
}
