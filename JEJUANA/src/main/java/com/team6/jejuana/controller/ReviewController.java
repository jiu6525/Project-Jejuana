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
	
	//���
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
	
	//�۾���
	@GetMapping("/reviewWrite")
	public ModelAndView reviewWrite(int plan_no) {
		ReviewDTO dto = service.reviewWriteSelect(plan_no);
		List<ReviewDTO> place = service.reviewCourse(plan_no);
		
		//System.out.println(place.toString()); //placetest ������(��ȣ,�̸�,����,�����ػ����) �Ѿ
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
	
	//�������
	@GetMapping("/reviewStar")
	public ModelAndView reviewStar(int place_no) {		
		ReviewDTO onePlace = service.onePlaceSelect(place_no);
		//��ȣ, �̸�, ����, �����
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", onePlace);
		mav.setViewName("review/reviewStar");
		
		return mav;
	}
		
	//���� DB ���
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
				htmlTag += "alert('������ ���������� ��ϵǾ����ϴ�.');";
				htmlTag += "window.close();";
				
			}catch(Exception e) {
				e.printStackTrace();
				htmlTag += "alert('���� ��Ͽ� �����Ͽ����ϴ�. ');";
				htmlTag += "history.back();";
			}
		}else {
			htmlTag += "alert('�̹� ������ ��ϵ� �������Դϴ�.');";
			htmlTag += "window.close();";
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
	}
	
	//�Խñ� DB ���
	@PostMapping("/reviewWriteOk")
	public ResponseEntity<String> reviewWriteOk(ReviewDTO dto, String thumbnail, HttpServletRequest request){
		dto.setId((String)request.getSession().getAttribute("loginId"));
		dto.setIp(request.getRemoteAddr());
		dto.setThumbnail(thumbnail);
		
		String htmlTag = "<script>";
		//���ε� ���� �� ���� �߻�
		try {
			service.reviewInsert(dto);
			
			htmlTag += "location.href='reviewList';";
			
		}catch(Exception e) {
			e.printStackTrace();
			htmlTag += "alert('�� ��� ����');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		//                                ����
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);

	}
	
	//�� ����
	@GetMapping("/reviewView")
	public ModelAndView reviewView(int plan_no, HttpSession session) {
		ReviewDTO dto = service.reviewSelect(plan_no);
		String userid = (String)session.getAttribute("loginId");
		
		//��ȸ �� ����
		if(!dto.getId().equals(userid)) {
			service.reviewHitCount(plan_no);
		}
		
		List<ReviewDTO> list = service.reviewCourse(plan_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto); //���� ���ڵ�
		mav.addObject("list", list); //�ڽ� ����
		mav.setViewName("review/reviewView");
		return mav;
	}
	
	//�Խñ� ���� 
	@GetMapping("/reviewEdit")
	public ModelAndView reviewEdit(int plan_no) {
		ReviewDTO dto = service.reviewEditSelect(plan_no);
		// "" '' �ν�
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
		
	//�Խñ� ���� DB ���
	@PostMapping("/reviewEditOk")
	public ResponseEntity<String> reviewEditOk(ReviewDTO dto, HttpSession session) {
		//���ڵ� ��ȣ, �α��� ���̵� ���� �� ���� : dto�� id �� ��� �ֱ� ������ session���� �ҷ���
		dto.setId((String)session.getAttribute("loginId"));
		String bodyTag = "<script>";
		try {
			service.reviewUpdate(dto);
			System.out.println(dto.getPlan_no());
			bodyTag += "location.href='reviewView?plan_no="+dto.getPlan_no()+"'";
		}catch(Exception e) {
			e.printStackTrace();	
			bodyTag += "alert('�Խñ� ���� ����');";
			bodyTag += "history.back();";
		}
		bodyTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
			
		ResponseEntity<String> entity = new ResponseEntity<String>(bodyTag, headers, HttpStatus.OK);
			
		return entity;
	}
		
	//�Խñ� DB���� ����
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
