package com.team6.jejuana.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommonDTO {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String phone_num;
	private String sign_date;
	
	private String email1;
	private String email2;
}
