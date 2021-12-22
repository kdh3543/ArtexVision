package kh.web.dto;

public class ReviewDTO {
	private String rv_ex_content ;
	private String rv_mem_id;
	private int rv_score;
	
	public String getRv_ex_content() {
		return rv_ex_content;
	}
	public void setRv_ex_content(String rv_ex_content) {
		this.rv_ex_content = rv_ex_content;
	}
	public String getRv_mem_id() {
		return rv_mem_id;
	}
	public void setRv_mem_id(String rv_mem_id) {
		this.rv_mem_id = rv_mem_id;
	}
	public int getRv_score() {
		return rv_score;
	}
	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}
	public ReviewDTO(String rv_ex_content, String rv_mem_id, int rv_score) {
		super();
		this.rv_ex_content = rv_ex_content;
		this.rv_mem_id = rv_mem_id;
		this.rv_score = rv_score;
	}
	public ReviewDTO() {
	}
}
