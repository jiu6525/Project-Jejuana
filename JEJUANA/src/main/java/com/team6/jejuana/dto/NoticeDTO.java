package com.team6.jejuana.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
	private int notice_no;
	private String notice_subject;
	private String notice_content;
	private int notice_hit;
	private String id;
	private String notice_date;
	private String ip;
	private int gonggi;
	private String nickname;
	
	//비밀글
	private boolean secretKey;
	
	private int ref; //원글번호
	private int lvl; //들여쓰기
	private String orgId; //원글작성자
	
	private int member_type;
}
