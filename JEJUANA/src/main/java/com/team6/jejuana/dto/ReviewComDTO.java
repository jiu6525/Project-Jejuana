package com.team6.jejuana.dto;

public class ReviewComDTO {
	private int comment_no; //댓글 번호
	private String comment_content; //댓글 내용
	private String id; //아이디
	private String writedate; //작성일
	private int target_no; //글 번호
	private int type; //게시판 타입, 여행기록: 2
	private String ip; //아이피
	
	@Override
	public String toString() {
		return "CommentDTO [comment_no=" + comment_no + ", comment_content=" + comment_content + ", id=" + id
				+ ", writedate=" + writedate + ", target_no=" + target_no + ", type=" + type + ", ip=" + ip + "]";
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getTarget_no() {
		return target_no;
	}
	public void setTarget_no(int target_no) {
		this.target_no = target_no;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
