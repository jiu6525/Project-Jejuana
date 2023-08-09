package com.team6.jejuana.service;

import com.team6.jejuana.dto.ReviewBmDTO;

public interface ReviewBmService {
	public int reviewBmSelect(ReviewBmDTO dto); //중복방지 확인
	public ReviewBmDTO reviewInfoSelect(int target_no); //게시글 제목 받아오기
	public int reviewBmInsert(ReviewBmDTO dto); //북마크 등록

}
