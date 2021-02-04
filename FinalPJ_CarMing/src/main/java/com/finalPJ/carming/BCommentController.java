package com.finalPJ.carming;


import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalPJ.carming.model.biz.bcommentBiz;
import com.finalPJ.carming.model.dto.bcommentDto;


@Controller
public class BCommentController {
	private static final Logger logger = LoggerFactory.getLogger(BCommentController.class);

	
	@Autowired
	private bcommentBiz cbiz;
	


	//댓글 작성 
	@RequestMapping(value = "/writebcomment.do")
	public String commentInsertRes(bcommentDto dto, RedirectAttributes redirect) {
		logger.info("[commentInsertRes]");
			
		
	int res = cbiz.insert(dto);
	  if(res>0){
		  redirect.addAttribute("brdno",dto.getBrdno());
		   return "redirect:boarddetailform.do";
	  }else {
		  redirect.addAttribute("brdno",dto.getBrdno());
		  return "redirect:boarddetailform.do";
	  }

    }
	
	@RequestMapping("/deletebcomment.do")
	public String deletecomment(int comno, int brdno, RedirectAttributes redirect) {

		int res = cbiz.delete(comno);
		  if(res>0){
			  redirect.addAttribute("brdno",brdno);
			   return "redirect:boarddetailform.do";
		  }else {
			  redirect.addAttribute("brdno",brdno);
			  return "redirect:boarddetailform.do";
		  }

	}
}
	
	
	
	
