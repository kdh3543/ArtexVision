package kh.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kh.web.dto.Nb_BoardDTO;
import kh.web.dto.Qb_BoardDTO;
import kh.web.statics.paging_Statics;

public class Qb_BoardDAO {
	private static Qb_BoardDAO instance = null;

	public static Qb_BoardDAO getInstance() {
		if (instance == null) {
			instance = new Qb_BoardDAO();
		}
		return instance;
	}

	private Qb_BoardDAO() {
	}

	// JDNI
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	private int getRecordCount() throws Exception {
		String sql = "select count(*) from questionboard";
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
		if (recordTotalCount % paging_Statics.RECORD_COUNT_PER_PAGE == 0) {
			// 나눌 페이지 수가 총 페이지수랑 나눴을때 딱 나누어 떨어질때는 요기
			pageTotalCount = recordTotalCount / paging_Statics.RECORD_COUNT_PER_PAGE;
		} else {
			// 그 외에는 하나 더해줘야지!
			pageTotalCount = recordTotalCount / paging_Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		return pageTotalCount;
	}

	public String getPageNavi(int currentPage) throws Exception {
		// 총 몇개의 레코드(게시글)을 가지고 있어?
		int recordTotalCount = this.getRecordCount();

		// 총 몇개의 페이지가 만들어질까?
		int pageTotalCount = 0;
		if (recordTotalCount % paging_Statics.RECORD_COUNT_PER_PAGE == 0) {
			// 나눌 페이지 수가 총 페이지수랑 나눴을때 딱 나누어 떨어질때는 요기
			pageTotalCount = recordTotalCount / paging_Statics.RECORD_COUNT_PER_PAGE;
		} else {
			// 그 외에는 하나 더해줘야지!
			pageTotalCount = recordTotalCount / paging_Statics.RECORD_COUNT_PER_PAGE + 1;
		}
		
		// 현재 클라이언트가 있는 페이지의 위치야
		// int currentPage = 4;

		// 현재 클라이언트가 있는 페이지를 기준으로 시작 번호와 끝 번호를 지정해주는 코드야
		int startNavi = (currentPage - 1) / paging_Statics.NAVI_COUNT_PER_PAGE * paging_Statics.NAVI_COUNT_PER_PAGE + 1;
		int endNavi = startNavi + paging_Statics.NAVI_COUNT_PER_PAGE - 1;

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
			pageNavi += "<a href='/qb_list.board?cpage=" + (startNavi - 1) + "'>< </a>";
		}
		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi += "<a href='/qb_list.board?cpage=" + i + "'>" + i + "</a> ";
		}
		if (needNext) {
			pageNavi += "<a href='/qb_list.board?cpage=" + (endNavi + 1) + "'> ></a>";
		}
		return pageNavi;
	}
	
	public List<Qb_BoardDTO> selectAll() throws Exception {
		String sql = "select * from questionboard";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {

			List<Qb_BoardDTO> list = new ArrayList<>();			
			while (rs.next()) {
				Qb_BoardDTO questionboard_dto = new Qb_BoardDTO();
				
				questionboard_dto.setQb_seq(rs.getInt("qb_seq"));
				questionboard_dto.setQb_mem_id(rs.getString("qb_mem_id"));
				questionboard_dto.setQb_title(rs.getString("qb_title"));
				questionboard_dto.setQb_contents(rs.getString("qb_contents"));
				questionboard_dto.setQb_write_date(rs.getTimestamp("qb_write_date"));
				questionboard_dto.setQb_view_count(rs.getInt("qb_view_count"));
				
				list.add(questionboard_dto);
			}
			return list;
		}
	}
	
	public List<Qb_BoardDTO> selectByBound(int start, int end) throws Exception {
		String sql = "select * from (select q.*, row_number() over(order by q.qb_seq desc) rn from questionboard q join member m on(q.qb_mem_id=m.mem_id)) where rn between ? and ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try (ResultSet rs = pstat.executeQuery()) {
				List<Qb_BoardDTO> list = new ArrayList<>();
				while (rs.next()) {
					Qb_BoardDTO questionboard_dto = new Qb_BoardDTO();
					questionboard_dto.setQb_seq(rs.getInt("qb_seq"));
					questionboard_dto.setQb_title(rs.getString("qb_title"));
					questionboard_dto.setQb_contents(rs.getString("qb_contents"));
					questionboard_dto.setQb_mem_id(rs.getString("qb_mem_id"));
					questionboard_dto.setQb_write_date(rs.getTimestamp("qb_write_date"));
					questionboard_dto.setQb_view_count(rs.getInt("qb_view_count"));
					list.add(questionboard_dto);
				}
				return list;
			}
		}
	}
	
	public int addViewCount(int qb_seq) throws Exception {
		String sql = "update questionboard set qb_view_count = qb_view_count+1 where qb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, qb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int insert(Qb_BoardDTO questionboard_dto) throws Exception {

		String sql = "insert into questionboard values(qb_seq.nextval, ?,?,?,default,0)";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, questionboard_dto.getQb_title());
			pstat.setString(2, questionboard_dto.getQb_contents());				
			pstat.setString(3, questionboard_dto.getQb_mem_id());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public Qb_BoardDTO selectBySeq(int qb_seq) throws Exception {
		String sql = "select * from questionboard where qb_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, qb_seq);
			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
					Qb_BoardDTO questionboard_dto = new Qb_BoardDTO();
					questionboard_dto.setQb_seq(rs.getInt("qb_seq"));
					questionboard_dto.setQb_mem_id(rs.getString("qb_mem_id"));
					questionboard_dto.setQb_title(rs.getString("qb_title"));
					questionboard_dto.setQb_contents(rs.getString("qb_contents"));
					questionboard_dto.setQb_write_date(rs.getTimestamp("qb_write_date"));
					questionboard_dto.setQb_view_count(rs.getInt("qb_view_count"));
					return questionboard_dto;
				}
			}
			return null;
		}
	}
	
	public int modify(int qb_seq, String qb_title, String qb_contents) throws Exception {
		String sql = "update questionboard set qb_title = ?, qb_contents = ? where qb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, qb_title);
			pstat.setString(2, qb_contents);
			pstat.setInt(3, qb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete(int qb_seq) throws Exception {
		String sql = "delete from questionboard where qb_seq = ?";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, qb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}


