package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.BookMarkDTO;
import com.team6.jejuana.dto.PlaceDTO;

public interface BookMarkService {
	public int bookMarkInsert(BookMarkDTO dto);
	public List<BookMarkDTO> bookListSelect(String id);
	public int dataDelete(int no);
	//별점추가
	public double bookmarkRate(String book_name);
}