package com.team6.jejuana.dto;

public class ReviewBmDTO {
	private int book_no; //북마크 번호
	private String book_name; //북마크 이름
	private String book_date; //저장한 날짜
	private int book_type; //게시판 타입, 여행기록: 2
	private String id; //아이디
	private int target_no; //글 번호
	
	@Override
	public String toString() {
		return "ReviewBmDTO [book_no=" + book_no + ", book_name=" + book_name + ", book_date=" + book_date
				+ ", book_type=" + book_type + ", id=" + id + ", target_no=" + target_no + "]";
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
	public int getTarget_no() {
		return target_no;
	}
	public void setTarget_no(int target_no) {
		this.target_no = target_no;
	}
}
