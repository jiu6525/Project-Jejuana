
package com.team6.jejuana.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team6.jejuana.dto.ReviewComDTO;
import com.team6.jejuana.service.ReviewComService;

@RestController
public class ReviewComController {
   @Autowired
   ReviewComService service;
   
   //´ñ±Û µî·Ï
   @PostMapping("/commentSend")
   public String commentSend(ReviewComDTO dto, HttpServletRequest request) {
      dto.setIp(request.getRemoteAddr());
      dto.setId((String)request.getSession().getAttribute("loginId"));
      
      int result = service.commentInsert(dto);
      System.out.println(dto.toString());
      return result+"";
   }
   
   //´ñ±Û ¸ñ·Ï
   @GetMapping("/commentList")
   public List<ReviewComDTO> commentList(int target_no) {
      List<ReviewComDTO> list = service.commentListSelect(target_no);
      return list;
   }
   
   //´ñ±Û ¼öÁ¤
   @PostMapping("/commentEdit")
   public String commentEdit(ReviewComDTO dto, HttpSession session) {
      dto.setId((String)session.getAttribute("loginId"));
      int result = service.commentUpdate(dto);
      return String.valueOf(result);
   }
   
   //´ñ±Û »èÁ¦
   @GetMapping("/commentDelete")
   public String commentDelete(int comment_no, HttpSession session) {
      String id = (String)session.getAttribute("loginId");
      return String.valueOf(service.commentDelete(comment_no, id));
   
   }
}