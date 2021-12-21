package kh.web.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Nb_BoardDTO {
	private int nb_seq;
	private String nb_title;
	private String nb_contents;
	private String nb_mem_id;
	private Timestamp nb_write_date;
	private int nb_view_count;

	public Nb_BoardDTO() {
	}

	public Nb_BoardDTO(int nb_seq, String nb_title, String nb_contents, String nb_mem_id, Timestamp nb_write_date,
			int nb_view_count) {
		super();
		this.nb_seq = nb_seq;
		this.nb_title = nb_title;
		this.nb_contents = nb_contents;
		this.nb_mem_id = nb_mem_id;
		this.nb_write_date = nb_write_date;
		this.nb_view_count = nb_view_count;
	}

	public int getNb_seq() {
		return nb_seq;
	}

	public void setNb_seq(int nb_seq) {
		this.nb_seq = nb_seq;
	}

	public String getNb_title() {
		return nb_title;
	}

	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}

	public String getNb_contents() {
		return nb_contents;
	}

	public void setNb_contents(String nb_contents) {
		this.nb_contents = nb_contents;
	}

	public String getNb_mem_id() {
		return nb_mem_id;
	}

	public void setNb_mem_id(String nb_mem_id) {
		this.nb_mem_id = nb_mem_id;
	}

	public Timestamp getNb_write_date() {
		return nb_write_date;
	}

	public void setNb_write_date(Timestamp nb_write_date) {
		this.nb_write_date = nb_write_date;
	}

	public int getNb_view_count() {
		return nb_view_count;
	}

	public void setNb_view_count(int nb_view_count) {
		this.nb_view_count = nb_view_count;
	}

	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.nb_write_date.getTime());
	}
	
	public String getDetailDate() {

		long current_time = System.currentTimeMillis(); // 현재의 timestamp
		long write_time = this.nb_write_date.getTime(); // 글이 작성된 timestamp

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
