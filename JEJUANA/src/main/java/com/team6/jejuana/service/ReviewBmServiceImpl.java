package com.team6.jejuana.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.ReviewBmDAO;
import com.team6.jejuana.dto.ReviewBmDTO;


@Service
public class ReviewBmServiceImpl implements ReviewBmService {
	@Inject
	ReviewBmDAO dao;

	@Override
	public int reviewBmSelect(ReviewBmDTO dto) {
		return dao.reviewBmSelect(dto);
	}
	@Override
	public ReviewBmDTO reviewInfoSelect(int target_no) {
		return dao.reviewInfoSelect(target_no);
	}
	@Override
	public int reviewBmInsert(ReviewBmDTO dto) {
		return dao.reviewBmInsert(dto);
	}
}
