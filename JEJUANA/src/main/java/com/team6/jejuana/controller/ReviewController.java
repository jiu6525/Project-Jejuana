package com.team6.jejuana.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.ReviewDTO;
import com.team6.jejuana.dto.ReviewSearchVO;
import com.team6.jejuana.service.ReviewService;

@RestController
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	ReviewService service;
	
	//목록
	@GetMapping("/reviewList")
	public ModelAndView reviewList(ReviewSearchVO vo) {
		ModelAndView mav = new ModelAndView();
		
		List<ReviewDTO> best = service.reviewBestSelect();
		List<ReviewDTO> list = service.reviewAllSelect(vo);
		
		mav.addObject("best", best);
		mav.addObject("list", list);
		mav.addObject("vo", vo);
		mav.setViewName("/review/reviewList");
		return mav;
	}
	
	//글쓰기
	@GetMapping("/reviewWrite")
	public ModelAndView reviewWrite(int plan_no) {
		ReviewDTO dto = service.reviewWriteSelect(plan_no);
		List<ReviewDTO> place = service.reviewCourse(plan_no);
		
		//System.out.println(place.toString()); //placetest 데이터(번호,이름,별점,별점준사람수) 넘어감
		System.out.println(place.toString());
		List<ReviewDTO> tags = service.tagSelect();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto", dto);
		mav.addObject("place", place);
		mav.addObject("psize", place.size());
		mav.addObject("tags", tags);
		mav.addObject("tsize", tags.size());
		
		mav.setViewName("review/reviewWrite");
		return mav;
	}
	
	//별점등록
	@GetMapping("/reviewStar")
	public ModelAndView reviewStar(int place_no) {		
		ReviewDTO onePlace = service.onePlaceSelect(place_no);
		//번호, 이름, 별점, 사람수
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", onePlace);
		mav.setViewName("review/reviewStar");
		
		return mav;
	}
		
	//별점 DB 등록
	@PostMapping("/reviewStarOk")
	public ResponseEntity<String> reviewStarOk(int place_no, ReviewDTO dto, HttpServletRequest request) {
		dto.setId((String)request.getSession().getAttribute("loginId"));
		dto.toString();
		String htmlTag = "<script>";
		
		int result = service.starSelect(dto);
		if(result<1) {
			try {
				service.starInsert(dto);
				service.starUpdate(place_no, dto.getRate());
				htmlTag += "alert('별점이 정상적으로 등록되었습니다.');";
				htmlTag += "window.close();";
				
			}catch(Exception e) {
				e.printStackTrace();
				htmlTag += "alert('별점 등록에 실패하였습니다. ');";
				htmlTag += "history.back();";
			}
		}else {
			htmlTag += "alert('이미 별점이 등록된 여행지입니다.');";
			htmlTag += "window.close();";
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
	}
	
	//게시글 DB 등록
	@PostMapping("/reviewWriteOk")
	public ResponseEntity<String> reviewWriteOk(ReviewDTO dto, String thumbnail, HttpServletRequest request){
		dto.setId((String)request.getSession().getAttribute("loginId"));
		dto.setIp(request.getRemoteAddr());
		dto.setThumbnail(thumbnail);
		
		String htmlTag = "<script>";
		//업로드 실패 시 예외 발생
		try {
			service.reviewInsert(dto);
			
			htmlTag += "location.href='reviewList';";
			
		}catch(Exception e) {
			e.printStackTrace();
			htmlTag += "alert('글 등록 실패');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		//                                내용
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);

	}
	
	//글 보기
	@GetMapping("/reviewView")
	public ModelAndView reviewView(int plan_no, HttpSession session) {
		ReviewDTO dto = service.reviewSelect(plan_no);
		String userid = (String)session.getAttribute("loginId");
		
		//조회 수 증가
		if(!dto.getId().equals(userid)) {
			service.reviewHitCount(plan_no);
		}
		
		List<ReviewDTO> list = service.reviewCourse(plan_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto); //선택 레코드
		mav.addObject("list", list); //코스 정보
		mav.setViewName("review/reviewView");
		return mav;
	}
	
	//게시글 수정 
	@GetMapping("/reviewEdit")
	public ModelAndView reviewEdit(int plan_no) {
		ReviewDTO dto = service.reviewEditSelect(plan_no);
		// "" '' 인식
		String subject = dto.getReview_subject().replaceAll("\"", "&quot;");
		subject.replaceAll("'", "&#39;");
		dto.setReview_subject(subject);
					
		List<ReviewDTO> list = service.tagSelect();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.addObject("size", list.size());
		mav.setViewName("review/reviewEdit");
			
		return mav;
	}
		
	//게시글 수정 DB 등록
	@PostMapping("/reviewEditOk")
	public ResponseEntity<String> reviewEditOk(ReviewDTO dto, HttpSession session) {
		//레코드 번호, 로그인 아이디가 같은 때 수정 : dto에 id 안 담겨 있기 때문에 session에서 불러옴
		dto.setId((String)session.getAttribute("loginId"));
		String bodyTag = "<script>";
		try {
			service.reviewUpdate(dto);
			System.out.println(dto.getPlan_no());
			bodyTag += "location.href='reviewView?plan_no="+dto.getPlan_no()+"'";
		}catch(Exception e) {
			e.printStackTrace();	
			bodyTag += "alert('게시글 수정 실패');";
			bodyTag += "history.back();";
		}
		bodyTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
			
		ResponseEntity<String> entity = new ResponseEntity<String>(bodyTag, headers, HttpStatus.OK);
			
		return entity;
	}
		
	//게시글 DB에서 삭제
	@GetMapping("/reviewDel")
	public ModelAndView reviewDel(ReviewDTO dto, HttpSession session) {
		dto.setId((String)session.getAttribute("loginId"));
			
		int result = service.reviewDelete(dto);
			
		ModelAndView mav = new ModelAndView();
			
		if(result>0) {
			mav.setViewName("redirect:reviewList");
		}else {
			mav.addObject("plan_no", dto.getPlan_no());
			mav.setViewName("redirect:reviewView");
		}
		return mav;
	}

}
