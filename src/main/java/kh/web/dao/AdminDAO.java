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

import kh.web.dto.DashboardDTO;
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
	
	// 관리자 로그인
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
	
	// 전시회 등록
	public int insertEx(ExhibitionDTO dto) throws Exception {
		String sql = "insert into exhibition values(ex_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, dto.getEx_title());
			pstmt.setString(2, dto.getEx_desc());
			pstmt.setInt(3, dto.getEx_price());
			pstmt.setString(4, dto.getEx_location());
			pstmt.setInt(5, dto.getEx_score());
			pstmt.setDate(6, dto.getEx_start_date());
			pstmt.setDate(7, dto.getEx_end_date());
			pstmt.setString(8, dto.getEx_oriname());
			pstmt.setString(9, dto.getEx_sysname());
			int result = pstmt.executeUpdate();
			conn.commit();
			return result;
		}
	}
	
	// 모든 회원 리스트 출력
	public List<MemberDTO> selectAllMember() throws Exception {
		String sql = "select * from member order by mem_signup_date";
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
	
	// 모든 전시회 리스트 출력
	public List<ExhibitionDTO> selectAllEx() throws Exception {
		String sql = "select * from exhibition order by to_number(ex_id)";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<ExhibitionDTO> list = new ArrayList<ExhibitionDTO>();
			ExhibitionDTO eDto = null;
			while(rs.next()) {
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
				eDto = new ExhibitionDTO(ex_id, ex_title, ex_desc, ex_price, ex_location, ex_score, ex_start_date, ex_end_date, ex_oriname, ex_sysname);
				list.add(eDto);
			}
			return list;
		}
	}
	
	public ExhibitionDTO selectByExId(String input_ex_id) throws Exception {
		String sql = "select ex_id, ex_title, ex_desc, ex_price, ex_location, ex_score, TO_CHAR(ex_start_date, 'YYYY-MM-DD') ex_start_date, TO_CHAR(ex_end_date, 'YYYY-MM-DD') ex_end_date, ex_oriname, ex_sysname from exhibition where ex_id = ? order by ex_id";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			pstmt.setString(1, input_ex_id);
			
			ResultSet rs = pstmt.executeQuery();
			
			ExhibitionDTO eDto = null;
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
				eDto = new ExhibitionDTO(ex_id, ex_title, ex_desc, ex_price, ex_location, ex_score, ex_start_date, ex_end_date, ex_oriname, ex_sysname);
			}
			return eDto;
		}
	}
	
	// 월간 가입자 통계
	public List<DashboardDTO> selectMonthlyData() throws Exception {
		String sql = "SELECT TO_CHAR(b.dt, 'YYYY-MM') AS mem_signup_date, NVL(SUM(a.cnt), 0) cnt FROM ( SELECT TO_CHAR(mem_signup_date, 'YYYY-MM-DD') AS mem_signup_date, COUNT(*) cnt FROM member WHERE mem_signup_date BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2021-12-31', 'YYYY-MM-DD') GROUP BY mem_signup_date) a, ( SELECT TO_DATE('2021-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt FROM dual CONNECT BY LEVEL <= (TO_DATE('2021-12-31','YYYY-MM-DD') - TO_DATE('2021-01-01','YYYY-MM-DD') + 1)) b WHERE b.dt = a.mem_signup_date(+) GROUP BY TO_CHAR(b.dt, 'YYYY-MM') ORDER BY TO_CHAR(b.dt, 'YYYY-MM')";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("mem_signup_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 일간 가입자 통계
	public List<DashboardDTO> selectDailyData() throws Exception {
		String sql = "select TO_CHAR(mem_signup_date, 'YYYY-MM-DD') as mem_signup_date, count(*) as cnt from member where mem_signup_date >='20210101' and mem_signup_date <= '20221231' GROUP BY to_char(mem_signup_date, 'YYYY-MM-DD') order by mem_signup_date";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("mem_signup_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 월간 방문자 통계
	public List<DashboardDTO> selectMonthlyVisitData() throws Exception {
		String sql = "SELECT TO_CHAR(b.dt, 'YYYY-MM') AS bk_ex_visit_date, NVL(SUM(a.cnt), 0) cnt FROM ( SELECT TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') AS bk_ex_visit_date, COUNT(*) cnt FROM book WHERE bk_ex_visit_date BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2021-12-31', 'YYYY-MM-DD') GROUP BY bk_ex_visit_date) a, ( SELECT TO_DATE('2021-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt FROM dual CONNECT BY LEVEL <= (TO_DATE('2021-12-31','YYYY-MM-DD') - TO_DATE('2021-01-01','YYYY-MM-DD') + 1)) b WHERE b.dt = a.bk_ex_visit_date(+) GROUP BY TO_CHAR(b.dt, 'YYYY-MM') ORDER BY TO_CHAR(b.dt, 'YYYY-MM')";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 일간 방문자 통계
	public List<DashboardDTO> selectDailyVisitData() throws Exception {
		String sql = "select TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') as bk_ex_visit_date, count(*) as cnt from book where bk_ex_visit_date >='20210101' and bk_ex_visit_date <= '20221231' GROUP BY to_char(bk_ex_visit_date, 'YYYY-MM-DD') order by bk_ex_visit_date";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 월간 QnA 게시물 수 통계
		public List<DashboardDTO> selectMonthlyQnAData() throws Exception {
			String sql = "SELECT TO_CHAR(b.dt, 'YYYY-MM') AS QB_WRITE_DATE, NVL(SUM(a.cnt), 0) cnt FROM ( SELECT TO_CHAR(QB_WRITE_DATE, 'YYYY-MM-DD') AS QB_WRITE_DATE, COUNT(*) cnt FROM questionboard WHERE QB_WRITE_DATE BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2021-12-31', 'YYYY-MM-DD') GROUP BY QB_WRITE_DATE) a, ( SELECT TO_DATE('2021-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt FROM dual CONNECT BY LEVEL <= (TO_DATE('2021-12-31','YYYY-MM-DD') - TO_DATE('2021-01-01','YYYY-MM-DD') + 1)) b WHERE b.dt = a.QB_WRITE_DATE(+) GROUP BY TO_CHAR(b.dt, 'YYYY-MM') ORDER BY TO_CHAR(b.dt, 'YYYY-MM')";
			try(Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);)
			{
				ResultSet rs = pstmt.executeQuery();
				
				List<DashboardDTO> list = new ArrayList<DashboardDTO>();
				DashboardDTO dDto = null;
				while(rs.next()) {
					String dashboardData = rs.getString("QB_WRITE_DATE");
					int cnt = rs.getInt("cnt");
					dDto = new DashboardDTO(dashboardData,  cnt);
					list.add(dDto);
				}
				return list;
			}
		}
		
		// 일간 QnA 게시물 수 통계
		public List<DashboardDTO> selectDailyQnAData() throws Exception {
			String sql = "select TO_CHAR(QB_WRITE_DATE, 'YYYY-MM-DD') as QB_WRITE_DATE, count(*) as cnt from questionboard where QB_WRITE_DATE >='20210101' and QB_WRITE_DATE <= '20221231' GROUP BY to_char(QB_WRITE_DATE, 'YYYY-MM-DD') order by QB_WRITE_DATE";
			try(Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);)
			{
				ResultSet rs = pstmt.executeQuery();
				
				List<DashboardDTO> list = new ArrayList<DashboardDTO>();
				DashboardDTO dDto = null;
				while(rs.next()) {
					String dashboardData = rs.getString("QB_WRITE_DATE");
					int cnt = rs.getInt("cnt");
					dDto = new DashboardDTO(dashboardData,  cnt);
					list.add(dDto);
				}
				return list;
			}
		}
	
	
	
	
	// 월간 수익 통계
	public List<DashboardDTO> selectMonthlyRevenueData() throws Exception {
		String sql = "SELECT TO_CHAR(b.dt, 'YYYY-MM') AS bk_ex_visit_date, NVL(SUM(a.sum), 0) sum FROM ( SELECT TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') AS bk_ex_visit_date, sum(bk_ex_price) as sum FROM book WHERE bk_ex_visit_date BETWEEN TO_DATE('2021-01-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD') GROUP BY bk_ex_visit_date) a, ( SELECT TO_DATE('2021-01-01','YYYY-MM-DD') + LEVEL - 1 AS dt FROM dual CONNECT BY LEVEL <= (TO_DATE('2022-12-31','YYYY-MM-DD') - TO_DATE('2021-01-01','YYYY-MM-DD') + 1)) b WHERE b.dt = a.bk_ex_visit_date(+) GROUP BY TO_CHAR(b.dt, 'YYYY-MM') ORDER BY TO_CHAR(b.dt, 'YYYY-MM')";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("sum");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 일간 수익 통계
	public List<DashboardDTO> selectDailyRevenueData() throws Exception {
		String sql = "select TO_CHAR(bk_ex_visit_date, 'YYYY-MM-DD') as bk_ex_visit_date, sum(bk_ex_price) as sum from book where bk_ex_visit_date >='20210101' and bk_ex_visit_date <= '20221231' GROUP BY to_char(bk_ex_visit_date, 'YYYY-MM-DD') order by bk_ex_visit_date";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("bk_ex_visit_date");
				int cnt = rs.getInt("sum");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 등급별 멤버 리스트
	public List<DashboardDTO> selectMemberGradeData() throws Exception {
		String sql = "select mem_grade, count(*) as cnt from member group by mem_grade";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("mem_grade");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 연령별 멤버 리스트 
	public List<DashboardDTO> selectMemberGenerationData() throws Exception {
		String sql = "select case when year < 10 then '0 - 9' when year >= 10 and year < 20 then '10 - 19' when year >= 20 and year < 30 then '20 - 29' when year >= 30 and year < 40 then '30 - 39' when year >= 40 and year < 50 then '40 - 49' when year >= 50 and year < 60 then '50 - 59' when year >= 60 then '60 -' end as gen, count(*) as cnt from (select 2021 - EXTRACT(YEAR FROM to_date(mem_birth, 'yyyy-MM-dd')) + 1 as year from member) age group by case when year < 10 then '0 - 9' when year >= 10 and year < 20 then '10 - 19' when year >= 20 and year < 30 then '20 - 29' when year >= 30 and year < 40 then '30 - 39' when year >= 40 and year < 50 then '40 - 49' when year >= 50 and year < 60 then '50 - 59' when year >= 60 then '60 -' end order by gen";
		try(Connection conn = this.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);)
		{
			ResultSet rs = pstmt.executeQuery();
			
			List<DashboardDTO> list = new ArrayList<DashboardDTO>();
			DashboardDTO dDto = null;
			while(rs.next()) {
				String dashboardData = rs.getString("gen");
				int cnt = rs.getInt("cnt");
				dDto = new DashboardDTO(dashboardData,  cnt);
				list.add(dDto);
			}
			return list;
		}
	}
	
	// 지역별 멤버 리스트 
		public List<DashboardDTO> selectMemberLocationData() throws Exception {
			String sql = "select substr(mem_addr1, 0, instr(mem_addr1, ' ', 1)) location, count(*) as cnt from member group by substr(mem_addr1, 0, instr(mem_addr1, ' ', 1)) order by location desc";
			try(Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);)
			{
				ResultSet rs = pstmt.executeQuery();
				
				List<DashboardDTO> list = new ArrayList<DashboardDTO>();
				DashboardDTO dDto = null;
				while(rs.next()) {
					String dashboardData = rs.getString("location");
					int cnt = rs.getInt("cnt");
					dDto = new DashboardDTO(dashboardData,  cnt);
					list.add(dDto);
				}
				return list;
			}
		}
}
