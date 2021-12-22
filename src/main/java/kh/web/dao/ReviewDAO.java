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
import kh.web.dto.ReviewDTO;
import kh.web.statics.paging_Statics;

public class ReviewDAO {
	private static ReviewDAO instance = null;

	public static ReviewDAO getInstance() {
		if (instance == null) {
			instance = new ReviewDAO();
		}
		return instance;
	}

	private ReviewDAO() {
	}

	// JDNI
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	private int getRecordCount() throws Exception {
		String sql = "select count(*) from REVIEW";
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
	
	public List<ReviewDTO> selectAll() throws Exception {
		String sql = "select * from review";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {

			List<ReviewDTO> list = new ArrayList<>();			
			while (rs.next()) {
				ReviewDTO Review_dto = new ReviewDTO();
				
				Review_dto.setRv_ex_content(rs.getString("rv_ex_content"));
				Review_dto.setRv_mem_id(rs.getString("rv_mem_id"));
				Review_dto.setRv_score(rs.getInt("rv_score"));
				
				list.add(Review_dto);
			}
			return list;
		}
	}
	
	
	public int insert(ReviewDTO review_dto) throws Exception {

		String sql = "insert into review values(?,?,?)";
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, review_dto.getRv_ex_content());
			pstat.setString(2, review_dto.getRv_mem_id());				
			pstat.setInt(3, review_dto.getRv_score());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
