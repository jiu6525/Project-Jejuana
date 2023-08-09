package com.team6.jejuana.dto;

import java.util.List;

public class BookMarkDTO {
	private int book_no;
	private String book_name;
	private String book_date;
	private int book_type;
	private String id;
	private int targer_no;
	private String book_addr;

	private List<Integer> noCList;
	private double rate;

	@Override
	public String toString() {
		return "BookMarkDTO [book_no=" + book_no + ", book_name=" + book_name + ", book_date=" + book_date
				+ ", book_type=" + book_type + ", id=" + id + ", targer_no=" + targer_no + ", book_addr=" + book_addr
				+ "]";
	}
	public String getBook_addr() {
		return book_addr;
	}
	public void setBook_addr(String book_addr) {
		this.book_addr = book_addr;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public int getBook_type() {
		return book_type;
	}
	public void setBook_type(int book_type) {
		this.book_type = book_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTarger_no() {
		return targer_no;
	}
	public void setTarger_no(int targer_no) {
		this.targer_no = targer_no;
	}
	public List<Integer> getNoCList() {
		return noCList;
	}
	public void setNoCList(List<Integer> noCList) {
		this.noCList = noCList;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	
	
	
}