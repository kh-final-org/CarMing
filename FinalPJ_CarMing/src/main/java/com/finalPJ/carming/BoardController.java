package com.finalPJ.carming;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.BoardBiz;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardBiz biz;
	
	@RequestMapping(value = "/boardmainform.do")
	public String boardMain() {
	
	   logger.info("[boardmain]");
	   //model.addAttribute("list", biz.selectList());
	   
	   return "board/boardmain";
	}
	
	@RequestMapping(value = "/boardwriteform.do")
	public String boardWrite() {
	
	   logger.info("[boardwrite]");
	   return "board/boardwrite";
	}
	
	@RequestMapping(value = "/boarddetailform.do")
	public String boardDetail() {
		
		logger.info("[boarddetail]");
		return "board/boarddetail";
	}

	@RequestMapping(value = "/profileform.do")
	public String profilePage() {
		
		logger.info("[profilepage]");
		return "board/profilepage";
	}
	
	@RequestMapping(value = "/privateform.do")
	public String privateChat() {
		
		logger.info("[privatechat]");
		return "board/privatechat";
	}
	
	
	
	
	
	
}
