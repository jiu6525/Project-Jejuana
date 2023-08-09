package com.team6.jejuana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team6.jejuana.dao.NoticeDAO;
import com.team6.jejuana.dto.NoticeDTO;
import com.team6.jejuana.dto.PagingTwoVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO dao;
	
	@Override
	public List<NoticeDTO> gonggiSelect() {
		return dao.gonggiSelect();
	}

	@Override
	public List<NoticeDTO> noticeAllSelect(PagingTwoVO vo) {
		return dao.noticeAllSelect(vo);
	}

	@Override
	public int totalRecord(PagingTwoVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public int noticeInsert(NoticeDTO dto) {
		return dao.noticeInsert(dto);
	}

	@Override
	public int hitCount(int no, String loginId) {
		return dao.hitCount(no, loginId);
	}

	@Override
	public NoticeDTO noticeSelect(int notice_no) {
		return dao.noticeSelect(notice_no);
	}

	@Override
	public int memberTypeSelect(String loginId) {
		return dao.memberTypeSelect(loginId);
	}

	@Override
	public int noticeUpdate(NoticeDTO dto) {
		return dao.noticeUpdate(dto);
	}

	@Override
	public int noticeDelete(NoticeDTO dto) {
		return dao.noticeDelete(dto);
	}

	@Override
	public int managerInsert(NoticeDTO dto) {
		return dao.managerInsert(dto);
	}

	@Override
	public NoticeDTO replyDataSelect(int notice_no) {
		return dao.replyDataSelect(notice_no);
	}

	@Override
	public int replyWrite(NoticeDTO dto) {
		return dao.replyWrite(dto);
	}

	@Override
	public int applyDelete(NoticeDTO dto) {
		return dao.applyDelete(dto);
	}

}
