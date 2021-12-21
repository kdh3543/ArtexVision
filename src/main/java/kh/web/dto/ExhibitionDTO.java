package kh.web.dto;

import java.sql.Date;

public class ExhibitionDTO {
	private String ex_id;
	private String ex_title;
	private String ex_desc;
	private int ex_price;
	private String ex_location;
	private int ex_score;
	private Date ex_start_date;
	private Date ex_end_date;
	
	public ExhibitionDTO() {}

	public ExhibitionDTO(String ex_id, String ex_title, String ex_desc, int ex_price, String ex_location, int ex_score,
			Date ex_start_date, Date ex_end_date) {
		this.ex_id = ex_id;
		this.ex_title = ex_title;
		this.ex_desc = ex_desc;
		this.ex_price = ex_price;
		this.ex_location = ex_location;
		this.ex_score = ex_score;
		this.ex_start_date = ex_start_date;
		this.ex_end_date = ex_end_date;
	}

	public String getEx_id() {
		return ex_id;
	}

	public void setEx_id(String ex_id) {
		this.ex_id = ex_id;
	}

	public String getEx_title() {
		return ex_title;
	}

	public void setEx_title(String ex_title) {
		this.ex_title = ex_title;
	}

	public String getEx_desc() {
		return ex_desc;
	}

	public void setEx_desc(String ex_desc) {
		this.ex_desc = ex_desc;
	}

	public int getEx_price() {
		return ex_price;
	}

	public void setEx_price(int ex_price) {
		this.ex_price = ex_price;
	}

	public String getEx_location() {
		return ex_location;
	}

	public void setEx_location(String ex_location) {
		this.ex_location = ex_location;
	}

	public int getEx_score() {
		return ex_score;
	}

	public void setEx_score(int ex_score) {
		this.ex_score = ex_score;
	}

	public Date getEx_start_date() {
		return ex_start_date;
	}

	public void setEx_start_date(Date ex_start_date) {
		this.ex_start_date = ex_start_date;
	}

	public Date getEx_end_date() {
		return ex_end_date;
	}

	public void setEx_end_date(Date ex_end_date) {
		this.ex_end_date = ex_end_date;
	}

	public Date getEx_visit_date() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
