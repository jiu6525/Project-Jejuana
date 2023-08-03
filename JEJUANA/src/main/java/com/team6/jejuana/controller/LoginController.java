package com.team6.jejuana.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.team6.jejuana.dto.LoginDTO;
import com.team6.jejuana.dto.MessageDTO;
import com.team6.jejuana.dto.SmsResponseDTO;
import com.team6.jejuana.service.LoginService;
import com.team6.jejuana.service.SmsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	@Autowired
	LoginService service;
	
	//로그인 폼
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/login");
		return mav;
	}
	
	//회원가입 폼
	@GetMapping("/join")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/join");
		return mav;
	}
	
	//개인정보 동의 폼
	@GetMapping("/information")
	public ModelAndView information() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/information");
		return mav;
	}
	
	//로그인(DB)
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String id, String password, HttpServletRequest request, HttpSession session) {
		LoginDTO dto = service.loginOk(id, password);
		ModelAndView mav = new ModelAndView();
		
		if(dto!=null) {//로그인 성공
			session.setAttribute("loginId", dto.getId());
			session.setAttribute("loginPassword", dto.getPassword());
			session.setAttribute("loginStatus", "Y");
			mav.setViewName("redirect:/");
		}else {//로그인 실패
			mav.setViewName("redirect:login");
		}
		return mav;		
	}
	
	// 로그아웃 - 세션제거
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//아이디 중복검사
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) {
		int result = service.idCheckCount(id);
		
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		
		return "login/idCheck";
	}
	//==================================================================
	//휴대폰인증
	private final SmsService smsService;
	@GetMapping("/sendSms")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/sendSms");
		
		return mav;
	}
	
	@PostMapping("/smssend")
	public ModelAndView sendSms(MessageDTO messageDto, Model model, HttpSession session) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
		System.out.println("거의 다됨");
		ModelAndView mav = new ModelAndView();
		SmsResponseDTO response = smsService.sendSms(messageDto);
		model.addAttribute("response", response);
		
		session.setAttribute("Anumber", messageDto.getContent());
		System.out.println(messageDto.getContent());
		mav.setViewName("login/sendSms");
		
		return mav;
	}
	

	//==================================================================
	
	//회원가입
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk(LoginDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int result = service.loginInsert(dto);
		
		if(result>0) {//회원가입 성공시 로그인페이지이동
			mav.addObject("msg","회원가입에 성공했습니다. 로그인 페이지로 이동합니다.");
			mav.setViewName("redirect:login");
		}else {//회원가입 실패 시 로그인 폼으로 이동+메세지
			mav.setViewName("login/join");
		}
		return mav;
	}
}