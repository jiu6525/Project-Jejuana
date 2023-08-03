package com.team6.jejuana.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.LoginDAO;
import com.team6.jejuana.dto.LoginDTO;

@Service
public class LoginServiceImpl implements  LoginService {
	
	@Inject
	LoginDAO dao;
	
	//로그인
	@Override
	public LoginDTO loginOk(String id, String password) {
		return dao.loginOk(id, password);
	}
	
	//아이디 중복체크
	@Override
	public int idCheckCount(String id) {
		return dao.idCheckCount(id);
	}

	@Override
	public int loginInsert(LoginDTO dto) {
		return dao.loginInsert(dto);
	}
}
