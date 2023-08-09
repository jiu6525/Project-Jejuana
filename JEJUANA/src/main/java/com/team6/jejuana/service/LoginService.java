package com.team6.jejuana.service;

import com.team6.jejuana.dto.LoginDTO;

public interface LoginService{
	public LoginDTO loginOk(String id, String password);
	
	//아이디중복체크
	public int idCheckCount(String id);
	
	//회원가입
	public int loginInsert(LoginDTO dto);
	
	//아이디찾기
	public String idSelect(String name, String phone_num);
	
	//비밀번호찾기
	public LoginDTO idCount(String name, String id, String phone_num);
		
	//비밀번호 수정
	public int pwdUpdate(LoginDTO dto);
}