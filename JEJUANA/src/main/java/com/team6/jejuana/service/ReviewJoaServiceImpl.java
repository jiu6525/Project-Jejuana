package com.team6.jejuana.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.ReviewJoaDAO;
import com.team6.jejuana.dto.ReviewJoaDTO;

@Service
public class ReviewJoaServiceImpl implements ReviewJoaService {
	@Inject
	ReviewJoaDAO dao;

	@Override
	public int reviewJoaSelect(ReviewJoaDTO dto) {
		return dao.reviewJoaSelect(dto);
	}

	@Override
	public int reviewJoaClick(ReviewJoaDTO dto) {
		return dao.reviewJoaClick(dto);
	}

	@Override
	public int reviewJoaUp(int plan_no) {
		return dao.reviewJoaUp(plan_no);
	}

	@Override
	public int reviewJoaUnClick(ReviewJoaDTO dto) {
		return dao.reviewJoaUnClick(dto);
	}

	@Override
	public int reviewJoaDown(int plan_no) {
		return dao.reviewJoaDown(plan_no);
	}

	
	
}
