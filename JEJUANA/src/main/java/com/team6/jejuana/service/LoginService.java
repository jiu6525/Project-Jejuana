package com.team6.jejuana.service;

import com.team6.jejuana.dto.LoginDTO;

public interface LoginService{
	public LoginDTO loginOk(String id, String password);
	
	//���̵� �ߺ��˻�
	public int idCheckCount(String id);
	
	//ȸ������
	public int loginInsert(LoginDTO dto);
}
