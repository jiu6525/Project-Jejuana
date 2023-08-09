package com.team6.jejuana.dao;

import java.util.List;

import com.team6.jejuana.dto.PagingTwoVO;
import com.team6.jejuana.dto.PagingVO;
import com.team6.jejuana.dto.PlaceDTO;
import com.team6.jejuana.dto.PlanDTO;
import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.BookMarkDTO;
import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.Paging3VO;

public interface MypageDAO {
	public int totalRecord(PagingVO vo);
	public List<PlanDTO> planAllSelect(PagingVO vo);
	public List<LoginDTO> profileSelect(String userid);
	public int mypagePlanMultiDel(List<Integer> noPList);
	public int totalRecordReview(PagingTwoVO vo);
	public List<ReviewDTO> reviewAllSelect(PagingTwoVO vo);
	public int mypageReviewMultiDel(List<Integer> noRList);
	public String pwdSelect(String userid);
	public LoginDTO userEdit(String userid); 
	public int userEditOk(LoginDTO dto);
	public int userDelete(String userid);
	public int reviewCount(int plan_no);
	public List<ReviewDTO> reviewSelect();
	public ReviewDTO reviewEditSelect(int plan_no);
	public List<ReviewDTO> tagSelect();
	public int reviewUpdate(ReviewDTO dto);
	public List<ReviewDTO> bookmarkCourse(Paging3VO vo);
	public int totalRecordCourse(Paging3VO vo);
	public int totalRecordPlace(Paging3VO vo);
	public List<BookMarkDTO> bookmarkPlace(Paging3VO vo);
	public int mypageBookmarkMultiDel(List<Integer> noCList);
}
