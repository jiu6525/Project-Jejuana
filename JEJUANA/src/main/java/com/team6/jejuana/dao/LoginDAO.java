package com.team6.jejuana.dao;

import com.team6.jejuana.dto.LoginDTO;

public interface LoginDAO {
	public LoginDTO loginOk(String id, String password);
	
	//���̵� �ߺ��˻�
	public int idCheckCount(String id);
	
	//ȸ������
	public int loginInsert(LoginDTO dto);
}
