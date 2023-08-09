package com.team6.jejuana.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

	@AllArgsConstructor
	@NoArgsConstructor
	@Setter
	@Getter
public class MessageDTO {
    private String to;
    private String content=nan();
    
    
    public static String nan() {
    	String nansu = String.valueOf((int)(Math.random() * (99999 - 10000 + 1)) + 10000);
    	return nansu;
    }
}
