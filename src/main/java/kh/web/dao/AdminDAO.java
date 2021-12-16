package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.ExhibitionDTO;

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
	
	public int insertEx(ExhibitionDTO dto) throws Exception {
		String sql = "insert into exhibition values(?, ?, ?, ?, ?, ?, ?, ?)";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, dto.getEx_id());
			pstmt.setString(2, dto.getEx_title());
			pstmt.setString(3, dto.getEx_desc());
			pstmt.setInt(4, dto.getEx_price());
			pstmt.setString(5, dto.getEx_location());
			pstmt.setInt(6, dto.getEx_score());
			pstmt.setDate(7, dto.getEx_start_date());
			pstmt.setDate(8, dto.getEx_end_date());
			int result = pstmt.executeUpdate();
			conn.commit();
			return result;
		}
	}
	
	public int insertExImg(int exi_seq, String exi_oriName, String exi_sysName, String exi_ex_id) throws Exception {
		String sql = "insert into exhibitionimg values(?, ?, ?, ?)";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setInt(1, exi_seq);
			pstmt.setString(2, exi_oriName);
			pstmt.setString(3, exi_sysName);
			pstmt.setString(4, exi_ex_id);
			int result = pstmt.executeUpdate();
			conn.commit();
			return result;
		}
	}
}
