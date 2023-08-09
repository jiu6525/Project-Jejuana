package com.team6.jejuana.service;

import com.team6.jejuana.dto.ReviewJoaDTO;

public interface ReviewJoaService {
	public int reviewJoaSelect(ReviewJoaDTO dto); //좋아요 여부 확인
	public int reviewJoaClick(ReviewJoaDTO dto); //좋아요 클릭
	public int reviewJoaUp(int plan_no); //좋아요 수 +1
	public int reviewJoaUnClick(ReviewJoaDTO dto); //좋아요 취소
	public int reviewJoaDown(int plan_no); //좋아요 수 -1
}
