package kh.web.dto;

import java.sql.Date;

public class BookDTO {
	private int bk_id;
	private int bk_person;
	private boolean bk_cancel;
	private String bk_ex_id;
	private String bk_ex_title;
	private int bk_ex_price;
	private String bk_mem_id;
	private String bk_mem_name;
	private String bk_mem_email;
	private String bk_mem_birth;
	private String bk_mem_phone;
	private String bk_mem_zipcode;
	private String bk_mem_addr1;
	private String bk_mem_addr2;
	private String bk_mem_grade;
	private String bk_mem_account;
	private Date bk_ex_book_date;
	private Date bk_ex_visit_date;
	
	public BookDTO() {}

	public BookDTO(int bk_id, int bk_person, boolean bk_cancel, String bk_ex_id, String bk_ex_title, int bk_ex_price,
			String bk_mem_id, String bk_mem_name, String bk_mem_email, String bk_mem_birth, String bk_mem_phone,
			String bk_mem_zipcode, String bk_mem_addr1, String bk_mem_addr2, String bk_mem_grade, String bk_mem_account,
			Date bk_ex_book_date, Date bk_ex_visit_date) {
		super();
		this.bk_id = bk_id;
		this.bk_person = bk_person;
		this.bk_cancel = bk_cancel;
		this.bk_ex_id = bk_ex_id;
		this.bk_ex_title = bk_ex_title;
		this.bk_ex_price = bk_ex_price;
		this.bk_mem_id = bk_mem_id;
		this.bk_mem_name = bk_mem_name;
		this.bk_mem_email = bk_mem_email;
		this.bk_mem_birth = bk_mem_birth;
		this.bk_mem_phone = bk_mem_phone;
		this.bk_mem_zipcode = bk_mem_zipcode;
		this.bk_mem_addr1 = bk_mem_addr1;
		this.bk_mem_addr2 = bk_mem_addr2;
		this.bk_mem_grade = bk_mem_grade;
		this.bk_mem_account = bk_mem_account;
		this.bk_ex_book_date = bk_ex_book_date;
		this.bk_ex_visit_date = bk_ex_visit_date;
	}

	public int getBk_id() {
		return bk_id;
	}

	public void setBk_id(int bk_id) {
		this.bk_id = bk_id;
	}

	public int getBk_person() {
		return bk_person;
	}

	public void setBk_person(int bk_person) {
		this.bk_person = bk_person;
	}

	public boolean isBk_cancel() {
		return bk_cancel;
	}

	public void setBk_cancel(boolean bk_cancel) {
		this.bk_cancel = bk_cancel;
	}

	public String getBk_ex_id() {
		return bk_ex_id;
	}

	public void setBk_ex_id(String bk_ex_id) {
		this.bk_ex_id = bk_ex_id;
	}

	public String getBk_ex_title() {
		return bk_ex_title;
	}

	public void setBk_ex_title(String bk_ex_title) {
		this.bk_ex_title = bk_ex_title;
	}

	public int getBk_ex_price() {
		return bk_ex_price;
	}

	public void setBk_ex_price(int bk_ex_price) {
		this.bk_ex_price = bk_ex_price;
	}

	public String getBk_mem_id() {
		return bk_mem_id;
	}

	public void setBk_mem_id(String bk_mem_id) {
		this.bk_mem_id = bk_mem_id;
	}

	public String getBk_mem_name() {
		return bk_mem_name;
	}

	public void setBk_mem_name(String bk_mem_name) {
		this.bk_mem_name = bk_mem_name;
	}

	public String getBk_mem_email() {
		return bk_mem_email;
	}

	public void setBk_mem_email(String bk_mem_email) {
		this.bk_mem_email = bk_mem_email;
	}

	public String getBk_mem_birth() {
		return bk_mem_birth;
	}

	public void setBk_mem_birth(String bk_mem_birth) {
		this.bk_mem_birth = bk_mem_birth;
	}

	public String getBk_mem_phone() {
		return bk_mem_phone;
	}

	public void setBk_mem_phone(String bk_mem_phone) {
		this.bk_mem_phone = bk_mem_phone;
	}

	public String getBk_mem_zipcode() {
		return bk_mem_zipcode;
	}

	public void setBk_mem_zipcode(String bk_mem_zipcode) {
		this.bk_mem_zipcode = bk_mem_zipcode;
	}

	public String getBk_mem_addr1() {
		return bk_mem_addr1;
	}

	public void setBk_mem_addr1(String bk_mem_addr1) {
		this.bk_mem_addr1 = bk_mem_addr1;
	}

	public String getBk_mem_addr2() {
		return bk_mem_addr2;
	}

	public void setBk_mem_addr2(String bk_mem_addr2) {
		this.bk_mem_addr2 = bk_mem_addr2;
	}

	public String getBk_mem_grade() {
		return bk_mem_grade;
	}

	public void setBk_mem_grade(String bk_mem_grade) {
		this.bk_mem_grade = bk_mem_grade;
	}

	public String getBk_mem_account() {
		return bk_mem_account;
	}

	public void setBk_mem_account(String bk_mem_account) {
		this.bk_mem_account = bk_mem_account;
	}

	public Date getBk_ex_book_date() {
		return bk_ex_book_date;
	}

	public void setBk_ex_book_date(Date bk_ex_book_date) {
		this.bk_ex_book_date = bk_ex_book_date;
	}

	public Date getBk_ex_visit_date() {
		return bk_ex_visit_date;
	}

	public void setBk_ex_visit_date(Date bk_ex_visit_date) {
		this.bk_ex_visit_date = bk_ex_visit_date;
	}

	
	
	
}
