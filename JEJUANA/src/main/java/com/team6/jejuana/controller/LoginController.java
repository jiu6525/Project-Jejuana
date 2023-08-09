package com.team6.jejuana.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.team6.jejuana.dto.PagingDTO;
import com.team6.jejuana.dto.SmsResponseDTO;
import com.team6.jejuana.service.LoginService;
import com.team6.jejuana.service.ManagerService;
import com.team6.jejuana.service.SmsService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LoginController {
	
	@Autowired
	LoginService service;
	
	@Autowired
    ManagerService mservice;
	
	//로그인페이지 이동      
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/login");
		return mav;
	}
	
	//회원가입 페이지 이동        
	@GetMapping("/join")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/join");
		return mav;
	}
	
	@GetMapping("/findId")
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/findId");
		return mav;
	}
	
	@GetMapping("/findPwd")
	public ModelAndView findPwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/findPwd");
		return mav;
	}
	
	//                
	@GetMapping("/information")
	public ModelAndView information() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/information");
		return mav;
	}
	
	//로그인 (DB)
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String id, String password, HttpServletRequest request, HttpSession session,PagingDTO vo) {
		LoginDTO dto = service.loginOk(id, password);
		ModelAndView mav = new ModelAndView();
		
		if(dto!=null) {        
			session.setAttribute("loginId", dto.getId());
			session.setAttribute("loginPassword", dto.getPassword());
			session.setAttribute("loginStatus", "Y");
			session.setAttribute("nickname", dto.getNickname());
			
			//System.out.println(dto.toString());
			if(dto.getMember_type()==1) {
				//System.out.println("qwer");
				mav.setViewName("redirect:manager/commonmanager1");
				vo.setTotalRecord(mservice.commontotalRecord(vo));
				mav.addObject("list",mservice.commonpageSelect(vo));
				mav.addObject("nowpage",vo.getNowPage());
				mav.addObject("vo",vo);
				
			}else {
				mav.setViewName("login/loginOkResult");
			}
			
		}else {        
			mav.setViewName("redirect:login");
		}
		
		return mav;		
	}
	
	//로그아웃        
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//아이디 중복
	@GetMapping("/idCheck")
	public String idCheck(String id, Model model) {
		int result = service.idCheckCount(id);
		
		model.addAttribute("id", id);
		model.addAttribute("result", result);
		
		return "login/idCheck";
	}
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
	//==================================================================
	// 휴대폰 인증    
	private final SmsService smsService;
	@GetMapping("/sendSms")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/sendSms");
		
		return mav;
	}
	
	@PostMapping("/smssend")
	public ModelAndView sendSms(MessageDTO messageDto, Model model, HttpSession session) throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		SmsResponseDTO response = smsService.sendSms(messageDto);
		model.addAttribute("response", response);
		
		session.setAttribute("Anumber", messageDto.getContent());
		System.out.println(messageDto.getContent());
		mav.setViewName("login/sendSms");
		
		return mav;
	}
	

	//==================================================================
	
	//아이디 찾기 결과
	@PostMapping("/findIdResult")
	public ModelAndView findIdResult(String name, String phone_num) {
		ModelAndView mav = new ModelAndView();
			
		String userid = service.idSelect(name, phone_num);
		System.out.println(userid);
		
		if(userid == null || userid.equals("")) {
			mav.addObject("result", 0);
		}else {
			mav.addObject("result", 1);
			mav.addObject("userid", userid);
		}
		mav.setViewName("login/findIdResult");
		return mav;
	}
		
	//비밀번호 찾기 결과
	@PostMapping("/findPwdResult")
	public ModelAndView findPwdResult(String name, String id, String phone_num) {
		ModelAndView mav = new ModelAndView();
			
		try{
			LoginDTO dto = service.idCount(name, id, phone_num);
			String userid = dto.getId();
			
			mav.addObject("result", 1);
			mav.addObject("dto", dto);
		}catch(Exception e) {
			mav.addObject("result", 0);
		}
		mav.setViewName("login/findPwdResult");
		return mav;
	}
		
	//비밀번호 변경
	@PostMapping("/pwdEditOk")
	public ResponseEntity<String> pwdEditOk(LoginDTO dto){
		String htmlTag = "<script>";
		
		try {
			service.pwdUpdate(dto);
			htmlTag += "alert('비밀번호가 변경되었습니다');";
			htmlTag += "location.href='login/login';";
				
		}catch(Exception e) {
			e.printStackTrace();
			htmlTag += "alert('비밀번호 변경에 실패하였습니다');";
			htmlTag += "history.back();";
		}
		htmlTag += "</script>";
			
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
			
		//                                
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);

	}
}