package com.team6.jejuana.dto;

public class LoginDTO {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String email1;
	private String email2;
	private String sign_date;
	private int member_type;
	private String phone_num;
	private int common_no;
	
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", email=" + email + ", email1=" + email1 + ", email2=" + email2 + ", sign_date=" + sign_date
				+ ", member_type=" + member_type + ", phone_num=" + phone_num + ", common_no=" + common_no + "]";
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	//--------------------------------------------
	public String getEmail() {
		email = email1+"@"+email2;
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		
		String emailCut[] = email.split("@");
		email1 = emailCut[0];
		email2 = emailCut[1];
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	//--------------------------------------------
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getSign_date() {
		return sign_date;
	}
	public void setSign_date(String sign_date) {
		this.sign_date = sign_date;
	}
	public int getMember_type() {
		return member_type;
	}
	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}
	public int getCommon_no() {
		return common_no;
	}
	public void setCommon_no(int common_no) {
		this.common_no = common_no;
	}
	
}