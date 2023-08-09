package com.team6.jejuana.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.ReviewDAO;
import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.ReviewSearchVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	ReviewDAO dao;

	@Override
	public List<ReviewDTO> reviewBestSelect() {
		return dao.reviewBestSelect();
	}
	@Override
	public List<ReviewDTO> reviewAllSelect(ReviewSearchVO vo) {
		return dao.reviewAllSelect(vo);
	}
	@Override
	public List<ReviewDTO> planSelect(int plan_no) {
		return dao.planSelect(plan_no);
	}
	@Override
	public ReviewDTO onePlaceSelect(int place_no) {
		return dao.onePlaceSelect(place_no);
	}
	@Override
	public int starSelect(ReviewDTO dto) {
		return dao.starSelect(dto);
	}
	@Override
	public int starInsert(ReviewDTO dto) {
		return dao.starInsert(dto);
	}
	@Override
	public int starUpdate(int place_no, int rate) {
		return dao.starUpdate(place_no, rate);
	}
	@Override
	public int reviewInsert(ReviewDTO dto) {
		return dao.reviewInsert(dto);
	}
	@Override
	public List<ReviewDTO> tagSelect() {
		return dao.tagSelect();
	}
	@Override
	public ReviewDTO reviewSelect(int plan_no) {
		return dao.reviewSelect(plan_no);
	}
	@Override
	public void reviewHitCount(int plan_no) {
		dao.reviewHitCount(plan_no);
	}
	@Override
	public List<ReviewDTO> reviewCourse(int plan_no) {
		return dao.reviewCourse(plan_no);
	}
	@Override
	public ReviewDTO reviewEditSelect(int plan_no) {
		return dao.reviewEditSelect(plan_no);
	}
	@Override
	public int reviewUpdate(ReviewDTO dto) {
		return dao.reviewUpdate(dto);
	}
	@Override
	public int reviewDelete(ReviewDTO dto) {
		return dao.reviewDelete(dto);
	}
	@Override
	public ReviewDTO reviewWriteSelect(int plan_no) {
		return dao.reviewWriteSelect(plan_no);
	}
}
