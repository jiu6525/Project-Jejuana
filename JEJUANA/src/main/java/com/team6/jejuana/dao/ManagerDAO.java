package com.team6.jejuana.dao;

import java.util.List;

import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.PagingDTO;
import com.team6.jejuana.dto.ReviewDTO;

public interface ManagerDAO {
	
	
	//관리자 - 유저
	public int commontotalRecord(PagingDTO dto);
	
	public List<ReviewDTO> commonpageSelect(PagingDTO dto);
	
	public int commonMultiUpdate(List<Integer> noList);
		
	public LoginDTO commonSelect(int no);
	
	public int commonEditOk(LoginDTO dto);
	
	
	//관리자 - 게시글
	public int reviewtotalRecord(PagingDTO dto);
	
	public List<ReviewDTO> reviewpageSelect(PagingDTO dto);

	public int reviewMultiUpdate(List<Integer> noList);
	
	
}