package kh.web.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.ExhibitionDTO;

public class ExhibitionDAO {
	private static ExhibitionDAO instance = null;

	public static ExhibitionDAO getInstance(){
		if(instance == null) {
			instance = new ExhibitionDAO();
		}
		return instance;
	}

	private ExhibitionDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public ExhibitionDTO selectByExName(String exhibitionName) throws Exception{
		String sql = "select * from exhibition where ex_title = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, exhibitionName);
			try(ResultSet rs = pstat.executeQuery();){
				ExhibitionDTO dto = null;
				if(rs.next()) {
					String ex_id = rs.getString("ex_id");
					String ex_title = rs.getString("ex_title");
					String ex_desc = rs.getString("ex_desc");
					int ex_price = rs.getInt("ex_price");
					String ex_location = rs.getString("ex_location");
					int ex_score = rs.getInt("ex_score");
					Date ex_start_date = rs.getDate("ex_start_date");
					Date ex_end_date = rs.getDate("ex_end_date");
					String ex_oriname = rs.getString("ex_oriname");
					String ex_sysname = rs.getString("ex_sysname");
					dto = new ExhibitionDTO(ex_id, ex_title, ex_desc, ex_price, ex_location, ex_score, ex_start_date, ex_end_date, ex_oriname, ex_sysname);
				}
				return dto;
			}
		}
	}
}
