package com.team6.jejuana.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.ManagerDAO;
import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.PagingDTO;
import com.team6.jejuana.dto.ReviewDTO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Inject
	ManagerDAO dao;

	//관리자 - 유저
	@Override
	public int commontotalRecord(PagingDTO dto) {
		return dao.commontotalRecord(dto);
	}

	@Override
	public List<ReviewDTO> commonpageSelect(PagingDTO dto) {
		return dao.commonpageSelect(dto);
	}

	@Override
	public int commonMultiUpdate(List<Integer> noList) {
		return dao.commonMultiUpdate(noList);
	}
	
	
	//관리자 - 게시글	
	@Override
	public int reviewtotalRecord(PagingDTO dto) {
		return dao.reviewtotalRecord(dto);
	}

	@Override
	public List<ReviewDTO> reviewpageSelect(PagingDTO dto) {
		return dao.reviewpageSelect(dto);
	}

	@Override
	public int reviewMultiUpdate(List<Integer> noList) {
		return dao.reviewMultiUpdate(noList);
	}

	@Override
	public LoginDTO commonSelect(int no) {
		return dao.commonSelect(no);
	}

	@Override
	public int commonEditOk(LoginDTO dto) {
		return dao.commonEditOk(dto);
	}

	
}