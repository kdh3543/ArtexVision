package kh.web.dto;

public class DashboardDTO {
	private String dashboardData;
	private int cnt;
	
	public DashboardDTO() {}

	public DashboardDTO(String dashboardData, int cnt) {
		this.dashboardData = dashboardData;
		this.cnt = cnt;
	}

	public String getDashboardData() {
		return dashboardData;
	}

	public void setDashboardData(String dashboardData) {
		this.dashboardData = dashboardData;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
