package com.team6.jejuana.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team6.jejuana.dto.ReviewJoaDTO;
import com.team6.jejuana.service.ReviewJoaService;

@RestController
public class ReviewJoaController {
   @Autowired
   ReviewJoaService service;
   
   //좋아요
   @GetMapping("/review/reviewJoa")
   public ModelAndView reviewJoa(int plan_no, HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      
      ReviewJoaDTO dto = new ReviewJoaDTO();
      dto.setId((String)request.getSession().getAttribute("loginId"));
      dto.setPlan_no(plan_no);
      
      int cnt = service.reviewJoaSelect(dto);
      
      if(cnt<1) {
         try {
            service.reviewJoaClick(dto);
            service.reviewJoaUp(plan_no);
            mav.addObject("msg", "좋아요 반영되었습니다.");
         }catch(Exception e) {
            e.printStackTrace();
            mav.addObject("msg", "error");
         }
      }else {
         try {
            service.reviewJoaUnClick(dto);
            service.reviewJoaDown(plan_no);
            mav.addObject("msg", "좋아요 취소되었습니다.");
         }catch(Exception e) {
            e.printStackTrace();
            mav.addObject("msg", "error");
         }
      }
      mav.setViewName("review/result");
      
      return mav;
   }
   
}