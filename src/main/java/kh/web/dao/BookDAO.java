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
		String sql = "select * from book";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List<BookDTO> list = new ArrayList<>();
			while(rs.next()) {
				String bk_id = rs.getString("bk_id");
				int bk_person = rs.getInt("bk_person");
				int generation = rs.getInt("bk_generation");
				boolean bk_cancel = rs.getBoolean("bk_cancel");
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
				Date bk_ex_start_date = rs.getDate("bk_ex_start_date");
				Date bk_ex_end_date = rs.getDate("bk_ex_start_date");
				
				BookDTO dto = new BookDTO(bk_id,bk_person,generation,bk_cancel,bk_ex_id,bk_ex_title,bk_ex_price,bk_mem_id,bk_mem_name,
						bk_mem_email,bk_mem_birth,bk_mem_phone,bk_mem_zipcode,bk_mem_addr1,bk_mem_addr2,bk_mem_grade,bk_mem_account
						,bk_ex_start_date, bk_ex_end_date);
				list.add(dto);
			}
			return list;
		}
	}
}
