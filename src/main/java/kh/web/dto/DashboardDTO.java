package kh.web.dto;

public class DashboardDTO {
	private String mem_signup_date;
	private int cnt;
	
	public DashboardDTO() {}

	public DashboardDTO(String mem_signup_date, int cnt) {
		this.mem_signup_date = mem_signup_date;
		this.cnt = cnt;
	}

	public String getMem_signup_date() {
		return mem_signup_date;
	}

	public void setMem_signup_date(String mem_signup_date) {
		this.mem_signup_date = mem_signup_date;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
