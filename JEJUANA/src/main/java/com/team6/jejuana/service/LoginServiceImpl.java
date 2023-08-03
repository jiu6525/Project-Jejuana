package com.team6.jejuana.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.LoginDAO;
import com.team6.jejuana.dto.LoginDTO;

@Service
public class LoginServiceImpl implements  LoginService {
	
	@Inject
	LoginDAO dao;
	
	//�α���
	@Override
	public LoginDTO loginOk(String id, String password) {
		return dao.loginOk(id, password);
	}
	
	//���̵� �ߺ�üũ
	@Override
	public int idCheckCount(String id) {
		return dao.idCheckCount(id);
	}

	@Override
	public int loginInsert(LoginDTO dto) {
		return dao.loginInsert(dto);
	}
}
