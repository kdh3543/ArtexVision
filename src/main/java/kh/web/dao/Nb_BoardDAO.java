package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.BoardDTO;
import kh.web.dto.MemberDTO;
import kh.web.statics.Statics;

public class Nb_BoardDAO {
	private static Nb_BoardDAO instance = null;

	public static Nb_BoardDAO getInstance() {
		if (instance == null) {
			instance = new Nb_BoardDAO();
		}
		return instance;
	}

	private Nb_BoardDAO() {
	}

	// JDNI
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	private int getRecordCount() throws Exception {
		String sql = "select count(*) from noticeboard";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	public int getPageTotalCount() throws Exception {
		// 총 몇개의 레코드(게시글)을 가지고 있어?
		int recordTotalCount = this.getRecordCount();

		// 총 몇개의 페이지가 만들어질까?
		int pageTotalCount = 0;
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			// 나눌 페이지 수가 총 페이지수랑 나눴을때 딱 나누어 떨어질때는 요기
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		} else {
			// 그 외에는 하나 더해줘야지!
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	public String getPageNavi(int currentPage) throws Exception {
		// 총 몇개의 레코드(게시글)을 가지고 있어?
		int recordTotalCount = this.getRecordCount();

		// 총 몇개의 페이지가 만들어질까?
		int pageTotalCount = 0;
		if (recordTotalCount % Statics.RECORD_COUNT_PER_PAGE == 0) {
			// 나눌 페이지 수가 총 페이지수랑 나눴을때 딱 나누어 떨어질때는 요기
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE;
		} else {
			// 그 외에는 하나 더해줘야지!
			pageTotalCount = recordTotalCount / Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		
		// 현재 클라이언트가 있는 페이지의 위치야
		// int currentPage = 4;

		// 현재 클라이언트가 있는 페이지를 기준으로 시작 번호와 끝 번호를 지정해주는 코드야
		int startNavi = (currentPage - 1) / Statics.NAVI_COUNT_PER_PAGE * Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + Statics.NAVI_COUNT_PER_PAGE - 1;

		// 유지보수
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		// 이전페이지랑 다음페이지를 나타내줄 화살표 < >
		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}

		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		String pageNavi = "";
		if (needPrev) {
			pageNavi += "<a href='/nb_list.board?cpage=" + (startNavi - 1) + "'>< </a>";
		}
		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/nb_list.board?cpage=" + i + "'>" + i + "</a> ";
		}
		if (needNext) {
			pageNavi += "<a href='/nb_list.board?cpage=" + (endNavi + 1) + "'> ></a>";
		}
		return pageNavi;
	}
	
	public List<Nb_BoardDTO> selectAll() throws Exception {
		String sql = "select * from noticeboard";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {

			List<Nb_BoardDTO> list = new ArrayList<>();			
			while (rs.next()) {
				Nb_BoardDTO noticeboard_dto = new Nb_BoardDTO();
				
				noticeboard_dto.setNb_seq(rs.getInt("nb_seq"));
				noticeboard_dto.setNb_mem_id(rs.getString("nb_mem_id"));
				noticeboard_dto.setNb_title(rs.getString("nb_title"));
				noticeboard_dto.setNb_contents(rs.getString("nb_contents"));
				noticeboard_dto.setNb_write_date(rs.getTimestamp("nb_write_date"));
				noticeboard_dto.setNb_view_count(rs.getInt("nb_view_count"));
				
				list.add(noticeboard_dto);
			}
			return list;
		}
	}
	
	public List<Nb_BoardDTO> selectByBound(int start, int end) throws Exception {
		String sql = "select * from (select n.*, row_number() over(order by n.nb_seq desc) rn from noticeboard n join member m on(n.nb_mem_id=m.mem_id)) where rn between ? and ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try (ResultSet rs = pstat.executeQuery()) {
				List<Nb_BoardDTO> list = new ArrayList<>();
				while (rs.next()) {
					Nb_BoardDTO noticeboard_dto = new Nb_BoardDTO();
					noticeboard_dto.setFb_seq(rs.getInt("nb_seq"));
					noticeboard_dto.setFb_title(rs.getString("nb_title"));
					noticeboard_dto.setFb_contents(rs.getString("nb_contents"));
					noticeboard_dto.setFb_mem_id(rs.getString("nb_mem_id"));
					noticeboard_dto.setFb_write_date(rs.getTimestamp("nb_write_date"));
					noticeboard_dto.setFb_view_count(rs.getInt("nb_view_count"));
					list.add(noticeboard_dto);
				}
				return list;
			}
		}
	}
	
	public int addViewCount(int nb_seq) throws Exception {
		String sql = "update noticeboard set nb_view_count = nb_view_count+1 where nb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, nb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int insert(Nb_BoardDTO noticeboard_dto) throws Exception {

		String sql = "insert into noticeboard values(nb_seq.nextval, ?,?,?,default,0)";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, noticeboard_dto.getNb_title());
			pstat.setString(2, noticeboard_dto.getNb_contents());				
			pstat.setString(3, noticeboard_dto.getNb_mem_id());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public Nb_BoardDTO selectBySeq(int nb_seq) throws Exception {
		String sql = "select * from noticeboard where nb_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, nb_seq);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					Nb_BoardDTO noticeboard_dto = new Nb_BoardDTO();
					noticeboard_dto.setNb_seq(rs.getInt("nb_seq"));
					noticeboard_dto.setNb_mem_id(rs.getString("nb_mem_id"));
					noticeboard_dto.setNb_title(rs.getString("nb_title"));
					noticeboard_dto.setNb_contents(rs.getString("nb_contents"));
					noticeboard_dto.setNb_write_date(rs.getTimestamp("nb_write_date"));
					noticeboard_dto.setNb_view_count(rs.getInt("nb_view_count"));
					return noticeboard_dto;
				}
			}
			return null;
		}
	}
	
	public int modify(int nb_seq, String nb_title, String nb_contents) throws Exception {
		String sql = "update noticeboard set nb_title = ?, nb_contents = ? where nb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, nb_title);
			pstat.setString(2, nb_contents);
			pstat.setInt(3, nb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete(int nb_seq) throws Exception {
		String sql = "delete from noticeboard where nb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, nb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}


