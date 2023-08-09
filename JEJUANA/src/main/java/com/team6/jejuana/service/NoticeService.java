package com.team6.jejuana.service;

import java.util.List;

import com.team6.jejuana.dto.NoticeDTO;
import com.team6.jejuana.dto.PagingTwoVO;

public interface NoticeService {
	public List<NoticeDTO> gonggiSelect();
	public List<NoticeDTO> noticeAllSelect(PagingTwoVO vo);
	public int totalRecord(PagingTwoVO vo);
	public int noticeInsert(NoticeDTO dto);
	public int hitCount(int no, String loginId);
	public NoticeDTO noticeSelect(int notice_no);
	public int memberTypeSelect(String loginId);
	public int noticeUpdate(NoticeDTO dto);
	public int noticeDelete(NoticeDTO dto);
	public int managerInsert(NoticeDTO dto);
	public NoticeDTO replyDataSelect(int notice_no);
	public int replyWrite(NoticeDTO dto);
	public int applyDelete(NoticeDTO dto);
}