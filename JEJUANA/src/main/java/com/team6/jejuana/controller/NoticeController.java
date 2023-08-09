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
	
	//���ǰԽ��� ����Ʈ����
	@GetMapping("/noticeList")
	public ModelAndView notice(PagingTwoVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		vo.setTotalRecord(service.totalRecord(vo));
		
		int m_type = 0;
		String loginId = null;
		
		//�������׸���Ʈ
		mav.addObject("gList", service.gonggiSelect());
		
		//���ǻ��׸���Ʈ
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
	
	//���Ǳ��ۼ��ϱ�
	@GetMapping("/noticeWrite")
	public ModelAndView noticeWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/noticeWrite");
		return mav;
	}
	
	//���Ǳ۵���ϱ�(DB)
	@PostMapping("noticeWriteOk")
	public ModelAndView noticeWriteOk(NoticeDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());
		dto.setId((String)request.getSession().getAttribute("loginId"));
		
		ModelAndView mav = new ModelAndView();
		
		try {
			int cnt = service.noticeInsert(dto);
			
			if(cnt>0) {
				mav.addObject("msg", "���� ��ϵǾ����ϴ�.");
				mav.addObject("url", "/jejuana/notice/noticeList");
				mav.setViewName("/notice/editOk");
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			
			mav.addObject("msg", "�� ��Ͽ� �����߽��ϴ�.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//�۳��뺸��
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
		
		//��ȸ�� ����
		service.hitCount(notice_no, loginId);
		
		mav.addObject("m_type", m_type);
		mav.addObject("loginId", loginId);
		
		mav.addObject("vo", vo);
		mav.addObject("dto", dto);
		mav.setViewName("notice/noticeView");
		
		return mav;
	}
	
	//�۳�������ϱ�
	@GetMapping("/noticeEdit")
	public ModelAndView noticeEdit(int notice_no, PagingTwoVO vo) {
		ModelAndView mav = new ModelAndView();
		
		NoticeDTO dto = service.noticeSelect(notice_no);
		
		mav.addObject("dto", dto);
		mav.addObject("vo", vo);
		mav.setViewName("notice/noticeEdit");
		
		return mav;
	}
	
	//�۳�������ϱ�(DB)
	@PostMapping("/noticeEditOk")
	public ModelAndView noticeEditOk(NoticeDTO dto, PagingTwoVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		dto.setId((String)session.getAttribute("loginId"));
		
		try {
			int result = service.noticeUpdate(dto);
			
			if(result>0) {
				mav.addObject("msg", "���� �����Ǿ����ϴ�.");
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
			mav.addObject("msg", "�� ������ �����߽��ϴ�.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//�۳�������ϱ�
	@GetMapping("/noticeDelete")
	public ModelAndView noticeDelete(NoticeDTO dto, PagingTwoVO vo) {
		int result = service.noticeDelete(dto);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.addObject("msg", "���� �����Ǿ����ϴ�.");
			if(vo.getSearchWord()!=null) {
				mav.addObject("url", "/jejuana/notice/noticeList?nowPage="+vo.getNowPage()+"&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord());
			}else {
				mav.addObject("url", "/jejuana/notice/noticeList?&nowPage="+vo.getNowPage());
			}
			mav.setViewName("/notice/editOk");
		}else {
			mav.addObject("msg", "�� ������ �����߽��ϴ�.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//�亯�����ϱ�
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
			mav.addObject("msg", "���� �����Ǿ����ϴ�.");
			if(vo.getSearchWord()!=null) {
				mav.addObject("url", "/jejuana/notice/noticeList?nowPage="+vo.getNowPage()+"&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord());
			}else {
				mav.addObject("url", "/jejuana/notice/noticeList?&nowPage="+vo.getNowPage());
			}
			mav.setViewName("/notice/editOk");
		}else {
			mav.addObject("msg", "�� ������ �����߽��ϴ�.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//�����ۼ��ϱ�
	@GetMapping("/managerWrite")
	public ModelAndView managerWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/notice/managerWrite");
		return mav;
	}
	
	//��������ϱ�(DB)
	@PostMapping("managerWriteOk")
	public ModelAndView managerWriteOk(NoticeDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());
		dto.setId((String)request.getSession().getAttribute("loginId"));
			
		ModelAndView mav = new ModelAndView();
		
		try {
			int cnt = service.managerInsert(dto);
				
			if(cnt>0) {
				mav.addObject("msg", "���� ��ϵǾ����ϴ�.");
				mav.addObject("url", "/jejuana/notice/noticeList");
				mav.setViewName("/notice/editOk");
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
				
			mav.addObject("msg", "�� ��Ͽ� �����߽��ϴ�.");
			mav.setViewName("/notice/noticeFail");
		}
		return mav;
	}
	
	//�亯�ۼ��ϱ�
	@GetMapping("/noticeReply/{notice_no}/{secretKey}")
	public ModelAndView noticeReply(@PathVariable("notice_no") int notice_no, @PathVariable("secretKey") boolean secretKey) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("notice_no", notice_no);
		mav.addObject("secretKey", secretKey);
		mav.setViewName("/notice/noticeReply");
		
		return mav;
	}
	
	//�亯����ϱ�(DB)
	@PostMapping("/noticeReplyOk")
	public ModelAndView noticeReplyOk(NoticeDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		dto.setId((String)request.getSession().getAttribute("loginId"));
		dto.setIp(request.getRemoteAddr());
		
		try {
			//������ ref, id�� �����Ѵ�.
			NoticeDTO orgDataDTO = service.replyDataSelect(dto.getNotice_no());
			
			dto.setRef(orgDataDTO.getRef());
			dto.setOrgId(orgDataDTO.getId());
			
			int result = service.replyWrite(dto);
			
			if(result>0) {
				mav.addObject("msg", "�亯�� ��ϵǾ����ϴ�.");
				mav.addObject("url", "/jejuana/notice/noticeList");
				mav.setViewName("/notice/editOk");
			}else {
				throw new Exception();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
			mav.addObject("msg", "�亯 ��Ͽ� �����߽��ϴ�.");
			mav.setViewName("/notice/noticeFail");
		}
		
		return mav;
	}
}