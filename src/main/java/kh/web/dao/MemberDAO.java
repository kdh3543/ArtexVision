package kh.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.MemberDTO;

public class MemberDAO {
	private static MemberDAO instance = null;

	public static MemberDAO getInstance(){
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	private MemberDAO() {}


	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insert(MemberDTO dto) throws Exception{
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,sysdate,default,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getMem_id());
			pstat.setString(2, dto.getMem_pw());
			pstat.setString(3, dto.getMem_name());
			pstat.setString(4, dto.getMem_birth());
			pstat.setString(5, dto.getMem_email());
			pstat.setString(6, dto.getMem_phone());
			pstat.setString(7, dto.getMem_zipcode());
			pstat.setString(8, dto.getMem_addr1());
			pstat.setString(9, dto.getMem_addr2());
			pstat.setString(10, dto.getMem_account());
			
			int result = pstat.executeUpdate();
			
			return result;
		}
	}
	
	public boolean isIdExist(String id) throws Exception{
		String sql = "select * from member where mem_id =?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	public boolean isPhoneExist(String phone) throws Exception{
		String sql = "select * from member where mem_phone=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, phone);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	public MemberDTO selectById(String id) throws Exception{
		String sql = "select * from member where mem_id =?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				MemberDTO dto = null;
				if(rs.next()) {
					String gId = rs.getString("mem_id");
					String pw = rs.getString("mem_pw");
					String name = rs.getString("mem_name");
					String birth = rs.getString("mem_birth");
					String email = rs.getString("mem_email");
					String phone = rs.getString("mem_phone");
					String zipcode = rs.getString("mem_zipcode");
					String addr1 = rs.getString("mem_addr1");
					String addr2 = rs.getString("mem_addr2");
					Date signup_date = rs.getDate("mem_signup_date");
					String grade = rs.getString("mem_grade");
					String account = rs.getString("mem_account");
					
					dto = new MemberDTO(gId,pw,name,birth,email,phone,zipcode,addr1,addr2,signup_date,grade,account);
				}
				return dto;
			}
		}
	}
	
	public boolean login(String id, String pw) throws Exception{
		String sql = "select * from member where mem_id=? and mem_pw=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try(ResultSet rs =pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	public String searchId(String name, String birth, String phone) throws Exception{
		String sql = "select mem_id from member where mem_name = ? and mem_birth = ? and mem_phone = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, name);
			pstat.setString(2, birth);
			pstat.setString(3, phone);
			try(ResultSet rs = pstat.executeQuery();){
				String id = null;
				if(rs.next()) {
					id = rs.getString("mem_id");
				}
				return id;
			}
			
		}
	}
	
	public String checkInfor(String id, String name, String email, String phone) throws Exception{
		String sql = "select mem_id from member where mem_id=? and mem_name=? and mem_email=? and mem_phone=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.setString(2, name);
			pstat.setString(3, email);
			pstat.setString(4, phone);
			
			try(ResultSet rs = pstat.executeQuery();){
				String getId = null;
				if(rs.next()) {
					getId=rs.getString("mem_id");
				}
				return getId;
			}
		}
	}
	
	public int updatePw(String id, String pw) throws Exception{
		String sql = "update member set mem_pw=? where mem_id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1,pw);
			pstat.setString(2, id);
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int deleteMember(String id, String pw) throws Exception{
		String sql = "delete member where mem_id = ? and mem_pw = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.setString(2, pw);
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int updateInfor(String id, String pw, String email, String phone, String zipcode, String addr1, String addr2) throws Exception{
		String sql = "update member set mem_pw=?, mem_email=?, mem_phone=?, mem_zipcode=?,mem_addr1=?,mem_addr2=? where mem_id = ?" ;
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, pw);
			pstat.setString(2, email);
			pstat.setString(3, phone);
			pstat.setString(4, zipcode);
			pstat.setString(5, addr1);
			pstat.setString(6, addr2);
			pstat.setString(7, id);
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
}
