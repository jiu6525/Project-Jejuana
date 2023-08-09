package com.team6.jejuana.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.LoginDAO;
import com.team6.jejuana.dto.LoginDTO;

@Service
public class LoginServiceImpl implements  LoginService {
	
	@Inject
	LoginDAO dao;
	
	//·Î±×ÀÎ
	@Override
	public LoginDTO loginOk(String id, String password) {
		return dao.loginOk(id, password);
	}
	
	//¾ÆÀÌµð Áßº¹Ã¼Å©
	@Override
	public int idCheckCount(String id) {
		return dao.idCheckCount(id);
	}

	@Override
	public int loginInsert(LoginDTO dto) {
		return dao.loginInsert(dto);
	}

	@Override
	public String idSelect(String name, String phone_num) {
		return dao.idSelect(name, phone_num);
	}

	@Override
	public LoginDTO idCount(String name, String id, String phone_num) {
		return dao.idCount(name, id, phone_num);
	}

	@Override
	public int pwdUpdate(LoginDTO dto) {
		return dao.pwdUpdate(dto);
	}

}
