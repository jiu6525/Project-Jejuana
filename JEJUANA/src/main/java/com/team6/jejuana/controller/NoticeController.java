package com.team6.jejuana.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.NoticeDTO;
import com.team6.jejuana.dto.PagingTwoVO;
import com.team6.jejuana.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	NoticeService service;
	
	//문의게시판 리스트보기
	@GetMapping("/noticeList")
	public ModelAndView notice(PagingTwoVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.totalRecord(vo));
		
		int m_type = 0;
		String loginId = null;
		
		//공지사항리스트
		mav.addObject("gList", service.gonggiSelect());
		
		//문의사항리스트
		mav.addObject("vo", vo);
		mav.addObject("list", service.noticeAllSelect(vo));
		
		String loginStatus = (String)session.getAttribute("loginStatus");
		
		if(loginStatus=="Y") {
			loginId = (String)session.getAttribute("loginId");
			m_type = service.memberTypeSelect(loginId);
		}else {
			m_type = 2;
			loginId = "null";
		}
		mav.addObject("m_type", m_type);
		mav.addObject("loginId", loginId);
		mav.addObject("loginStatus", loginStatus);
		
		mav.setViewName("/notice/noticeList");
		return mav;
	}
	
	//문의글작성하기
	@GetMapping("/noticeWrite")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/noticeWrite");
		return mav;
	}
	
	//문의글등록하기(DB)
	@PostMapping("noticeWriteOk")
	public ModelAndView noticeWriteOk(NoticeDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());
		dto.setId((String)request.getSession().getAttribute("loginId"));
		
		ModelAndView mav = new ModelAndView();
		
		try {
			int cnt = service.noticeInsert(dto);
			
			if(cnt>0) {
				mav.addObject("msg", "글이 등록되었습니다.");
				mav.addObject("url", "/jejuana/notice/noticeList");
				mav.setViewName("/notice/editOk");
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			
			mav.addObject("msg", "글 등록에 실패했습니다.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//글내용보기
	@GetMapping("/noticeView")
	public ModelAndView noticeView(int notice_no, HttpSession session, PagingTwoVO vo) {
		ModelAndView mav = new ModelAndView();
		String loginId = null;
		int m_type = 0;
		String loginStatus = (String)session.getAttribute("loginStatus");
				
		NoticeDTO dto = service.noticeSelect(notice_no);

		
		if(loginStatus=="Y") {
			loginId = (String)session.getAttribute("loginId");
			m_type = service.memberTypeSelect(loginId);
		}else {
			m_type = 2;
			loginId = "null";
		}
		
		//조회수 증가
		service.hitCount(notice_no, loginId);
		
		mav.addObject("m_type", m_type);
		mav.addObject("loginId", loginId);
		
		mav.addObject("vo", vo);
		mav.addObject("dto", dto);
		mav.setViewName("notice/noticeView");
		
		return mav;
	}
	
	//글내용수정하기
	@GetMapping("/noticeEdit")
	public ModelAndView noticeEdit(int notice_no, PagingTwoVO vo) {
		ModelAndView mav = new ModelAndView();
		
		NoticeDTO dto = service.noticeSelect(notice_no);
		
		mav.addObject("dto", dto);
		mav.addObject("vo", vo);
		mav.setViewName("notice/noticeEdit");
		
		return mav;
	}
	
	//글내용수정하기(DB)
	@PostMapping("/noticeEditOk")
	public ModelAndView noticeEditOk(NoticeDTO dto, PagingTwoVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		dto.setId((String)session.getAttribute("loginId"));
		
		try {
			int result = service.noticeUpdate(dto);
			
			if(result>0) {
				mav.addObject("msg", "글이 수정되었습니다.");
				if(vo.getSearchWord()!=null) {
					mav.addObject("url", "/jejuana/notice/noticeView?notice_no="+dto.getNotice_no()+"&nowPage="+vo.getNowPage()+"&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord());
				}else {
					mav.addObject("url", "/jejuana/notice/noticeView?notice_no="+dto.getNotice_no()+"&nowPage="+vo.getNowPage());
				}
				mav.setViewName("/notice/editOk");
			}else {
				throw new Exception();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			mav.addObject("msg", "글 수정에 실패했습니다.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//글내용삭제하기
	@GetMapping("/noticeDelete")
	public ModelAndView noticeDelete(NoticeDTO dto, PagingTwoVO vo) {
		int result = service.noticeDelete(dto);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.addObject("msg", "글이 삭제되었습니다.");
			if(vo.getSearchWord()!=null) {
				mav.addObject("url", "/jejuana/notice/noticeList?nowPage="+vo.getNowPage()+"&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord());
			}else {
				mav.addObject("url", "/jejuana/notice/noticeList?&nowPage="+vo.getNowPage());
			}
			mav.setViewName("/notice/editOk");
		}else {
			mav.addObject("msg", "글 삭제에 실패했습니다.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//답변삭제하기
	@GetMapping("/applyDelete")
	public ModelAndView applyDelete(NoticeDTO dto, PagingTwoVO vo) {
		
		int result = 0;
		
		if(dto.getLvl()==0) {
			result = service.noticeDelete(dto);
		}else {
			result = service.applyDelete(dto);
		}
			
		ModelAndView mav = new ModelAndView();
			
		if(result>0) {
			mav.addObject("msg", "글이 삭제되었습니다.");
			if(vo.getSearchWord()!=null) {
				mav.addObject("url", "/jejuana/notice/noticeList?nowPage="+vo.getNowPage()+"&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord());
			}else {
				mav.addObject("url", "/jejuana/notice/noticeList?&nowPage="+vo.getNowPage());
			}
			mav.setViewName("/notice/editOk");
		}else {
			mav.addObject("msg", "글 삭제에 실패했습니다.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//공지작성하기
	@GetMapping("/managerWrite")
	public ModelAndView managerWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/managerWrite");
		return mav;
	}
	
	//공지등록하기(DB)
	@PostMapping("managerWriteOk")
	public ModelAndView managerWriteOk(NoticeDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());
		dto.setId((String)request.getSession().getAttribute("loginId"));
			
		ModelAndView mav = new ModelAndView();
		
		try {
			int cnt = service.managerInsert(dto);
				
			if(cnt>0) {
				mav.addObject("msg", "글이 등록되었습니다.");
				mav.addObject("url", "/jejuana/notice/noticeList");
				mav.setViewName("/notice/editOk");
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
				
			mav.addObject("msg", "글 등록에 실패했습니다.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//답변작성하기
	@GetMapping("/noticeReply/{notice_no}/{secretKey}")
	public ModelAndView noticeReply(@PathVariable("notice_no") int notice_no, @PathVariable("secretKey") boolean secretKey) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("notice_no", notice_no);
		mav.addObject("secretKey", secretKey);
		mav.setViewName("/notice/noticeReply");
		
		return mav;
	}
	
	//답변등록하기(DB)
	@PostMapping("/noticeReplyOk")
	public ModelAndView noticeReplyOk(NoticeDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		dto.setId((String)request.getSession().getAttribute("loginId"));
		dto.setIp(request.getRemoteAddr());
		
		try {
			//원글의 ref, id를 선택한다.
			NoticeDTO orgDataDTO = service.replyDataSelect(dto.getNotice_no());
			
			dto.setRef(orgDataDTO.getRef());
			dto.setOrgId(orgDataDTO.getId());
			
			int result = service.replyWrite(dto);
			
			if(result>0) {
				mav.addObject("msg", "답변이 등록되었습니다.");
				mav.addObject("url", "/jejuana/notice/noticeList");
				mav.setViewName("/notice/editOk");
			}else {
				throw new Exception();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
			mav.addObject("msg", "답변 등록에 실패했습니다.");
			mav.setViewName("/notice/noticeFail");
		}
		
		return mav;
	}
}