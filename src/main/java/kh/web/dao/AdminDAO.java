package kh.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.ExhibitionDTO;
import kh.web.dto.MemberDTO;

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
	
	public List<MemberDTO> selectAllMember() throws Exception {
		String sql = "select * from member";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<MemberDTO> list = new ArrayList<MemberDTO>();
			MemberDTO mDto = null;
			while(rs.next()) {
				String mem_id = rs.getString("mem_id");
				String mem_pw = rs.getString("mem_pw");
				String mem_name = rs.getString("mem_name");
				String mem_birth = rs.getString("mem_birth");
				String mem_email = rs.getString("mem_email");
				String mem_phone = rs.getString("mem_phone");
				String mem_zipcode = rs.getString("mem_zipcode");
				String mem_addr1 = rs.getString("mem_addr1");
				String mem_addr2 = rs.getString("mem_addr2");
				Date mem_signup_date = rs.getDate("mem_signup_date");
				String mem_grade = rs.getString("mem_grade");
				String mem_account = rs.getString("mem_account");
				
				mDto = new MemberDTO(mem_id, mem_pw, mem_name, mem_birth, mem_email, mem_phone, mem_zipcode, mem_addr1, mem_addr2, mem_signup_date, mem_grade, mem_account);
				list.add(mDto);
			}
			return list;
		}
	}
}
