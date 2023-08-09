package com.team6.jejuana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.MypageDAO;
import com.team6.jejuana.dto.PagingTwoVO;
import com.team6.jejuana.dto.PagingVO;
import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;
import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.BookMarkDTO;
import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.Paging3VO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO dao;

	@Override
	public int totalRecord(PagingVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public List<PlanDTO> planAllSelect(PagingVO vo) {
		return dao.planAllSelect(vo);
	}

	@Override
	public List<LoginDTO> profileSelect(String userid) {
		return dao.profileSelect(userid);
	}

	@Override
	public int mypagePlanMultiDel(List<Integer> noPList) {
		return dao.mypagePlanMultiDel(noPList);
	}

	@Override
	public int totalRecordReview(PagingTwoVO vo) {
		return dao.totalRecordReview(vo);
	}

	@Override
	public List<ReviewDTO> reviewAllSelect(PagingTwoVO vo) {
		return dao.reviewAllSelect(vo);
	}

	@Override
	public int mypageReviewMultiDel(List<Integer> noRList) {
		return dao.mypageReviewMultiDel(noRList);
	}

	@Override
	public String pwdSelect(String userid) {
		return dao.pwdSelect(userid);
	}

	@Override
	public LoginDTO userEdit(String userid) {
		return dao.userEdit(userid);
	}

	@Override
	public int userEditOk(LoginDTO dto) {
		return dao.userEditOk(dto);
	}

	@Override
	public int userDelete(String userid) {
		return dao.userDelete(userid);
	}

	@Override
	public List<ReviewDTO> reviewSelect() {
		return dao.reviewSelect();
	}

	@Override
	public ReviewDTO reviewEditSelect(int plan_no) {
		return dao.reviewEditSelect(plan_no);
	}

	@Override
	public List<ReviewDTO> tagSelect() {
		return dao.tagSelect();
	}

	@Override
	public int reviewUpdate(ReviewDTO dto) {
		return dao.reviewUpdate(dto);
	}

	@Override
	public List<ReviewDTO> bookmarkCourse(Paging3VO vo) {
		return dao.bookmarkCourse(vo);
	}

	@Override
	public int totalRecordCourse(Paging3VO vo) {
		return dao.totalRecordCourse(vo);
	}

	@Override
	public int totalRecordPlace(Paging3VO vo) {
		return dao.totalRecordPlace(vo);
	}

	@Override
	public List<BookMarkDTO> bookmarkPlace(Paging3VO vo) {
		return dao.bookmarkPlace(vo);
	}

	@Override
	public int mypageBookmarkMultiDel(List<Integer> noCList) {
		return dao.mypageBookmarkMultiDel(noCList);
	}

	
}
