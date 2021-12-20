package kh.web.dto;

import java.sql.Date;

public class MemberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_birth;
	private String mem_email;
	private String mem_phone;
	private String mem_zipcode;
	private String mem_addr1;
	private String mem_addr2;
	private Date mem_signup_date;
	private String mem_grade;
	private String mem_account;
	
	public MemberDTO() {}

	public MemberDTO(String mem_id, String mem_pw, String mem_name, String mem_birth, String mem_email,
			String mem_phone, String mem_zipcode, String mem_addr1, String mem_addr2, Date mem_signup_date,
			String mem_grade, String mem_account) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_birth = mem_birth;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_addr1 = mem_addr1;
		this.mem_addr2 = mem_addr2;
		this.mem_signup_date = mem_signup_date;
		this.mem_grade = mem_grade;
		this.mem_account = mem_account;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_addr1() {
		return mem_addr1;
	}

	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}

	public String getMem_addr2() {
		return mem_addr2;
	}

	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}

	public Date getMem_signup_date() {
		return mem_signup_date;
	}

	public void setMem_signup_date(Date mem_signup_date) {
		this.mem_signup_date = mem_signup_date;
	}

	public String getMem_grade() {
		return mem_grade;
	}

	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}

	public String getMem_account() {
		return mem_account;
	}

	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}

	
}


