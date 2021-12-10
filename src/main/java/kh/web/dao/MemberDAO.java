package kh.web.dao;

import java.sql.Connection;
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
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getBirth());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getPhone());
			pstat.setString(7, dto.getZipcode());
			pstat.setString(8, dto.getAddr1());
			pstat.setString(9, dto.getAddr2());
			pstat.setString(10, dto.getAccount());
			
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
}
