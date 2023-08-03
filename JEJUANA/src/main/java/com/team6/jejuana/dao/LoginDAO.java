package com.team6.jejuana.dao;

import com.team6.jejuana.dto.LoginDTO;

public interface LoginDAO {
	public LoginDTO loginOk(String id, String password);
	
	//아이디 중복검사
	public int idCheckCount(String id);
	
	//회원가입
	public int loginInsert(LoginDTO dto);
}
