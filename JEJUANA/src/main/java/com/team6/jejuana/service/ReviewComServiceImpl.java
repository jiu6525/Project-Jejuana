package com.team6.jejuana.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.ReviewComDAO;
import com.team6.jejuana.dto.ReviewComDTO;

@Service
public class ReviewComServiceImpl implements ReviewComService {
	@Inject
	ReviewComDAO dao;

	@Override
	public int commentInsert(ReviewComDTO dto) {
		return dao.commentInsert(dto);
	}

	@Override
	public List<ReviewComDTO> commentListSelect(int target_no) {
		return dao.commentListSelect(target_no);
	}

	@Override
	public int commentUpdate(ReviewComDTO dto) {
		return dao.commentUpdate(dto);
	}

	@Override
	public int commentDelete(int c_no, String userid) {
		return dao.commentDelete(c_no, userid);
	}
}
