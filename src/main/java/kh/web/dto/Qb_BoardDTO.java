package kh.web.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Qb_BoardDTO {
	private int qb_seq;
	private String qb_title;
	private String qb_contents;
	private String qb_mem_id;
	private Timestamp qb_write_date;
	private int qb_view_count;

	public Qb_BoardDTO() {
	}

	public Qb_BoardDTO(int qb_seq, String qb_title, String qb_contents, String qb_mem_id, Timestamp qb_write_date,
			int qb_view_count) {
		super();
		this.qb_seq = qb_seq;
		this.qb_title = qb_title;
		this.qb_contents = qb_contents;
		this.qb_mem_id = qb_mem_id;
		this.qb_write_date = qb_write_date;
		this.qb_view_count = qb_view_count;
	}

	public int getQb_seq() {
		return qb_seq;
	}

	public void setQb_seq(int qb_seq) {
		this.qb_seq = qb_seq;
	}

	public String getQb_title() {
		return qb_title;
	}

	public void setQb_title(String qb_title) {
		this.qb_title = qb_title;
	}

	public String getQb_contents() {
		return qb_contents;
	}

	public void setQb_contents(String qb_contents) {
		this.qb_contents = qb_contents;
	}

	public String getQb_mem_id() {
		return qb_mem_id;
	}

	public void setQb_mem_id(String qb_mem_id) {
		this.qb_mem_id = qb_mem_id;
	}

	public Timestamp getQb_write_date() {
		return qb_write_date;
	}

	public void setQb_write_date(Timestamp qb_write_date) {
		this.qb_write_date = qb_write_date;
	}

	public int getQb_view_count() {
		return qb_view_count;
	}

	public void setQb_view_count(int qb_view_count) {
		this.qb_view_count = qb_view_count;
	}

	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.qb_write_date.getTime());
	}
	
	public String getDetailDate() {

		long current_time = System.currentTimeMillis(); // 현재의 timestamp
		long write_time = this.qb_write_date.getTime(); // 글이 작성된 timestamp

		long time_gap = current_time - write_time;

		if (time_gap < 60000) {
			return "1분 이내";
		} else if (time_gap < 300000) {
			return "5분 이내";
		} else if (time_gap < 3600000) {
			return "1시간 이내";
		} else if (time_gap < 86400000) {
			return "오늘";
		} else {
			return getFormedDate();
		}
	}
}
