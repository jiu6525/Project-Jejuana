package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.ReviewComDTO;

public interface ReviewComService {
	public int commentInsert(ReviewComDTO dto);
	public List<ReviewComDTO> commentListSelect(int target_no);
	public int commentUpdate(ReviewComDTO dto);
	public int commentDelete(int c_no, String userid);
}
