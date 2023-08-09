package com.team6.jejuana.dto;

public class ReviewJoaDTO {
	int joayo_no; //좋아요 번호
	int plan_no; //글 번호
	String id; //아이디
	
	@Override
	public String toString() {
		return "ReviewJoaDTO [joayo_no=" + joayo_no + ", plan_no=" + plan_no + ", id=" + id + "]";
	}
	public int getJoayo_no() {
		return joayo_no;
	}
	public void setJoayo_no(int joayo_no) {
		this.joayo_no = joayo_no;
	}
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
