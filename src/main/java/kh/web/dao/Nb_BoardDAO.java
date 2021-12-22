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

	public int getRecordCount(String searchOption, String searchText) throws Exception {

		String sql = null;

		if (searchText != null && !searchText.equals("")) {
			if (searchOption.equals("nb_mem_id")) {
				sql = "select count(*) from (select n.*, row_number() over(order by n.nb_seq desc) rn from noticeboard n join member m on(n.nb_mem_id=m.mem_id)) where (nb_mem_id like '%"
						+ searchText.trim() + "%') order by nb_seq desc ";
			} else {
				sql = "select count(*) from (select n.*, row_number() over(order by n.nb_seq desc) rn from noticeboard n join member m on(n.nb_mem_id=m.mem_id)) where (nb_title like '%"
						+ searchText.trim() + "%') order by nb_seq desc ";
			}
		} else {
			sql = "select count(*) from noticeboard";
		}

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			System.out.println("총 게시물의 수 : " + rs.getInt(1));
			return rs.getInt(1);
		}
	}

	public int getPageTotalCount(String searchOption, String searchText) throws Exception {

		// 총 몇개의 레코드(게시글)을 가지고 있어?
		int recordTotalCount = this.getRecordCount(searchOption, searchText);
		System.out.println("search 카운트 : " + recordTotalCount);

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

	public String getPageNavi(int currentPage, String searchOption, String searchText) throws Exception {
		// 총 몇개의 레코드(게시글)을 가지고 있어?
		
		int recordTotalCount = this.getRecordCount(searchOption, searchText);

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
		
		if(searchText != null && !searchText.equals("")) {
			if(searchOption.equals("nb_mem_id")||searchOption.equals("nb_title")) { 
				if (needPrev) {
//					fb_list.board?cpage=1&searchOption=fb_mem_id&searchText=hosboy93
					pageNavi += "<a href='/nb_list.board?cpage="+(startNavi-1)+"&searchOption="+searchOption+"&searchText="+searchText+ "'>< </a>";
					
				}
				for (int i = startNavi; i <= endNavi; i++) {
					pageNavi += "<a href='/nb_list.board?cpage=" + i + "&searchOption="+searchOption+"&searchText="+searchText+"'>" + i + "</a> ";
					
				}
				if (needNext) {
					pageNavi += "<a href='/nb_list.board?cpage="+(endNavi+1)+ "&searchOption="+searchOption+"&searchText="+searchText+"'> ></a>";
				
				}	
				System.out.println(pageNavi);
			}
		}else {
			if (needPrev) {
//				fb_list.board?cpage=3
				pageNavi += "<a href='/nb_list.board?cpage=" + (startNavi - 1) + "'>< </a>";
			}
			for (int i = startNavi; i <= endNavi; i++) {
				pageNavi += "<a href='/nb_list.board?cpage=" + i + "'>" + i + "</a> ";
			}
			if (needNext) {
				pageNavi += "<a href='/nb_list.board?cpage=" + (endNavi + 1) + "'> ></a>";
			}	
		}
		return pageNavi;
	}	

//	public List<Qb_BoardDTO> selectAll() throws Exception {
//		String sql = "select * from questionboard";
//		try (Connection con = this.getConnection();
//				PreparedStatement pstat = con.prepareStatement(sql);
//				ResultSet rs = pstat.executeQuery()) {
//
//			List<Qb_BoardDTO> list = new ArrayList<>();
//			while (rs.next()) {
//				Qb_BoardDTO questionboard_dto = new Qb_BoardDTO();
//
//				questionboard_dto.setQb_seq(rs.getInt("qb_seq"));
//				questionboard_dto.setQb_mem_id(rs.getString("qb_mem_id"));
//				questionboard_dto.setQb_title(rs.getString("qb_title"));
//				questionboard_dto.setQb_contents(rs.getString("qb_contents"));
//				questionboard_dto.setQb_write_date(rs.getTimestamp("qb_write_date"));
//				questionboard_dto.setQb_view_count(rs.getInt("qb_view_count"));
//
//				list.add(questionboard_dto);
//			}
//			return list;
//		}
//	}

	public List<Nb_BoardDTO> nbSelectByBound(int start, int end, String searchOption, String searchText) throws Exception {

		String sql = null;
		
		if(searchText != null && !searchText.equals("")) { 
			if(searchOption.equals("nb_mem_id") ) {
				sql = "select * from (select n.*, row_number() over(order by n.nb_seq desc) rn from noticeboard n join member m on(n.nb_mem_id=m.mem_id)) where (rn between ? and ?) and (nb_mem_id like '%"+searchText+"%') order by nb_seq desc ";
				// where (rn between ? and ?) and
				System.out.println("selectByBound 1의 : : " + sql);
				System.out.println(sql);
			}else if(searchOption.equals("nb_title")) {
				sql = "select * from (select n.*, row_number() over(order by n.nb_seq desc) rn from noticeboard n join member m on(n.nb_mem_id=m.mem_id)) where (rn between ? and ?) and (nb_title like '%"+searchText+"%') order by nb_seq desc ";
				System.out.println("selectByBound 2의 : : " + sql);
			}
		}else {
			sql = "select * from (select n.*, row_number() over(order by n.nb_seq desc) rn from noticeboard n join member m on(n.nb_mem_id=m.mem_id)) where rn between ? and ?";
			System.out.println("selectByBound 3의 : : " + sql);
		}
		
		try (Connection con = this.getConnection(); 
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try (ResultSet rs = pstat.executeQuery()) {
				List<Nb_BoardDTO> list = new ArrayList<>();
				while (rs.next()) {
					Nb_BoardDTO noticeboard_dto = new Nb_BoardDTO();
					noticeboard_dto.setNb_seq(rs.getInt("nb_seq"));
					noticeboard_dto.setNb_title(rs.getString("nb_title"));
					noticeboard_dto.setNb_contents(rs.getString("nb_contents"));
					noticeboard_dto.setNb_mem_id(rs.getString("nb_mem_id"));
					noticeboard_dto.setNb_write_date(rs.getTimestamp("nb_write_date"));
					noticeboard_dto.setNb_view_count(rs.getInt("nb_view_count"));
					list.add(noticeboard_dto);
				}
				return list;
			}
		}
	}

	public int addViewCount(int nb_seq) throws Exception {
		String sql = "update noticeboard set nb_view_count = nb_view_count+1 where nb_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, nb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int insert(Nb_BoardDTO noticeboard_dto) throws Exception {

		String sql = "insert into noticeboard values(nb_seq.nextval, ?,?,?,default,0)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
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
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
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
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, nb_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
