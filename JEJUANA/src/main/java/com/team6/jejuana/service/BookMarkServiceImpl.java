package  com.team6.jejuana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.BookMarkDAO;
import com.team6.jejuana.dto.BookMarkDTO;
import com.team6.jejuana.dto.PlaceDTO;

@Service
public class BookMarkServiceImpl implements BookMarkService {
	@Autowired
	BookMarkDAO dao;
	

	@Override
	public int bookMarkInsert(BookMarkDTO dto) {
		return dao.bookMarkInsert(dto);
	}


	@Override
	public List<BookMarkDTO> bookListSelect(String id) {
		return dao.bookListSelect(id);
	}


	@Override
	public int dataDelete(int no) {
		return dao.dataDelete(no);
	}


	@Override
	public double bookmarkRate(String book_name) {
		return dao.bookmarkRate(book_name);
	}

}