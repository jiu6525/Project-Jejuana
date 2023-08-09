package com.team6.jejuana.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.ReviewBmDTO;
import com.team6.jejuana.service.ReviewBmService;

@RestController
public class ReviewBmController {
	@Autowired
	ReviewBmService service;
	
	//북마크
	@GetMapping("/review/reviewBm")
	public ModelAndView reviewBm(int target_no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
	
		ReviewBmDTO dto = new ReviewBmDTO();
		dto.setId((String)request.getSession().getAttribute("logId"));
		dto.setTarget_no(target_no);
		
		int cnt = service.reviewBmSelect(dto);
		
		if(cnt<1) {
			String book_name = service.reviewInfoSelect(target_no).getBook_name();
			dto.setBook_name(book_name);
			System.out.println(dto.toString());
			try {
				service.reviewBmInsert(dto);
				mav.addObject("msg", "북마크에 저장되었습니다.");
			}catch(Exception e) {
				e.printStackTrace();
				mav.addObject("msg", "북마크 저장에 실패하였습니다.");
			}
		}else {
			mav.addObject("msg", "이미 등록된 북마크입니다.");
		}
		mav.setViewName("review/result");
		
		return mav;
		}

}
