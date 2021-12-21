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

import kh.web.dto.BookDTO;

public class BookDAO {
	private static BookDAO instance = null;

	public static BookDAO getInstance(){
		if(instance == null) {
			instance = new BookDAO();
		}
		return instance;
	}

	private BookDAO() {}


	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public List<BookDTO> selectAll() throws Exception{
		String sql = "select * from book order by 1";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<BookDTO> list = new ArrayList<>();
			while(rs.next()) {
				int bk_id = rs.getInt("bk_id");
				int bk_person = rs.getInt("bk_person");
				String bk_cancel = rs.getString("bk_cancel");
				String bk_ex_id = rs.getString("bk_ex_id");
				String bk_ex_title = rs.getString("bk_ex_title");
				int bk_ex_price = rs.getInt("bk_ex_price");
				String bk_mem_id = rs.getString("bk_mem_id");
				String bk_mem_name = rs.getString("bk_mem_name");
				String bk_mem_email = rs.getString("bk_mem_email");
				String bk_mem_birth = rs.getString("bk_mem_birth");
				String bk_mem_phone = rs.getString("bk_mem_phone");
				String bk_mem_zipcode = rs.getString("bk_mem_zipcode");
				String bk_mem_addr1 = rs.getString("bk_mem_addr1");
				String bk_mem_addr2 = rs.getString("bk_mem_addr2");
				String bk_mem_grade = rs.getString("bk_mem_grade");
				String bk_mem_account = rs.getString("bk_mem_account");
				Date bk_ex_book_date = rs.getDate("bk_ex_book_date");
				Date bk_ex_visit_date = rs.getDate("bk_ex_visit_date");
				
				BookDTO dto = new BookDTO(bk_id,bk_person,bk_cancel,bk_ex_id,bk_ex_title,bk_ex_price,bk_mem_id,bk_mem_name,
						bk_mem_email,bk_mem_birth,bk_mem_phone,bk_mem_zipcode,bk_mem_addr1,bk_mem_addr2,bk_mem_grade,bk_mem_account
						,bk_ex_book_date, bk_ex_visit_date);
				list.add(dto);
			}
			return list;
		}
	}
	
	public List<BookDTO> selectById(String id) throws Exception{
		String sql = "select * from book where bk_mem_id=? order by 1";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery();){
				List<BookDTO> list = new ArrayList<>();
				while(rs.next()) {
					int bk_id = rs.getInt("bk_id");
					int bk_person = rs.getInt("bk_person");
					String bk_cancel = rs.getString("bk_cancel");
					String bk_ex_id = rs.getString("bk_ex_id");
					String bk_ex_title = rs.getString("bk_ex_title");
					int bk_ex_price = rs.getInt("bk_ex_price");
					String bk_mem_id = rs.getString("bk_mem_id");
					String bk_mem_name = rs.getString("bk_mem_name");
					String bk_mem_email = rs.getString("bk_mem_email");
					String bk_mem_birth = rs.getString("bk_mem_birth");
					String bk_mem_phone = rs.getString("bk_mem_phone");
					String bk_mem_zipcode = rs.getString("bk_mem_zipcode");
					String bk_mem_addr1 = rs.getString("bk_mem_addr1");
					String bk_mem_addr2 = rs.getString("bk_mem_addr2");
					String bk_mem_grade = rs.getString("bk_mem_grade");
					String bk_mem_account = rs.getString("bk_mem_account");
					Date bk_ex_book_date = rs.getDate("bk_ex_book_date");
					Date bk_ex_visit_date = rs.getDate("bk_ex_visit_date");
					
					BookDTO dto = new BookDTO(bk_id,bk_person,bk_cancel,bk_ex_id,bk_ex_title,bk_ex_price,bk_mem_id,bk_mem_name,
							bk_mem_email,bk_mem_birth,bk_mem_phone,bk_mem_zipcode,bk_mem_addr1,bk_mem_addr2,bk_mem_grade,bk_mem_account
							,bk_ex_book_date, bk_ex_visit_date);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	public int deleteById(int bk_Id) throws Exception{
		String sql = "delete from book where bk_id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, bk_Id);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int deleteByIdExTitle(String id, String exTitle, int exPrice, int exPerson) throws Exception{
		String sql = "delete from book where bk_mem_id=? and bk_ex_title =? and bk_ex_price=? and bk_person=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			pstat.setString(2, exTitle);
			pstat.setInt(3, exPrice);
			pstat.setInt(4, exPerson);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int insert(BookDTO dto) throws Exception{
		String sql = "insert into book values(bk_id_seq.nextval,?,'N',?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getBk_person());
			pstat.setString(2, dto.getBk_ex_id());
			pstat.setString(3, dto.getBk_ex_title());
			pstat.setInt(4, dto.getBk_ex_price());
			pstat.setString(5, dto.getBk_mem_id());
			pstat.setString(6, dto.getBk_mem_name());
			pstat.setString(7, dto.getBk_mem_email());
			pstat.setString(8, dto.getBk_mem_birth());
			pstat.setString(9, dto.getBk_mem_phone());
			pstat.setString(10, dto.getBk_mem_zipcode());
			pstat.setString(11, dto.getBk_mem_addr1());
			pstat.setString(12, dto.getBk_mem_addr2());
			pstat.setString(13, dto.getBk_mem_grade());
			pstat.setString(14, dto.getBk_mem_account());
			pstat.setDate(15, dto.getBk_ex_visit_date());
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
}
