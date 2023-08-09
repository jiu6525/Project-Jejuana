package com.team6.jejuana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	
	
	@GetMapping("/map_list")
	public ModelAndView map_list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("list/map_list");
		return mav;
	}
	

	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/home");
		return mav;
	}
	
	@GetMapping("/policy")
	public ModelAndView test123() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/policy");
		return mav;
	}
}
