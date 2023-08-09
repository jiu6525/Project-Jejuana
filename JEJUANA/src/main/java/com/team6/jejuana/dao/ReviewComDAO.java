package com.team6.jejuana.dao;

import java.util.List;

import com.team6.jejuana.dto.ReviewComDTO;

public interface ReviewComDAO {
	public int commentInsert(ReviewComDTO dto); //댓글 등록
	public List<ReviewComDTO> commentListSelect(int target_no); //댓글 목록
	public int commentUpdate(ReviewComDTO dto); //댓글 수정
	public int commentDelete(int c_no, String userid); //댓글 삭제
}