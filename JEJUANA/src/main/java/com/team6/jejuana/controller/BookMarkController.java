package com.team6.jejuana.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpHeaders;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.BookMarkDTO;
import com.team6.jejuana.service.BookMarkService;

@Controller
public class BookMarkController {
	@Inject
	BookMarkService service;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@GetMapping("/bookmarkTest")
	public ResponseEntity<String> bookmarkTest(String book_name,String book_addr,int book_type, HttpSession session, HttpServletRequest request) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		BookMarkDTO dto = new BookMarkDTO();
		dto.setBook_name(book_name);
		dto.setBook_addr(book_addr);
		dto.setBook_type(book_type);
		
		//별점추기
		double rate = service.bookmarkRate(dto.getBook_name());
		dto.setRate(rate);
		
		dto.setId((String)session.getAttribute("loginId"));
		String htmlTag = "<script>";
		
		try {
			service.bookMarkInsert(dto);
			transactionManager.commit(status);
			htmlTag += "alert('북마크에 등록 완료하였습니다!');";
			htmlTag += "location.href='map_list'";
		//결과
		}catch(Exception e) {
			
			htmlTag += "alert('등록되지 않았습니다.');";
			htmlTag += "history.back();";
			e.printStackTrace();
			transactionManager.rollback(status);
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		headers.add("Content_Type", "text/html; charSet=UTF-8");
		
		//						   내용
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
		

	}
	
	//북마크목록
			@GetMapping("/blist")
			@ResponseBody
			public List<BookMarkDTO> list(HttpSession session) {

				List<BookMarkDTO> blist = service.bookListSelect((String)session.getAttribute("loginId"));		
				System.out.println(blist);
				return blist;
			}
//		
			
			
	//북마크 삭제
	@GetMapping("/list/bookDelete")
	public ModelAndView bookDelete(int no) {

		ModelAndView mav = new ModelAndView();
		service.dataDelete(no);
		mav.setViewName("list/map_list");

		return mav; 
	}		
		
}