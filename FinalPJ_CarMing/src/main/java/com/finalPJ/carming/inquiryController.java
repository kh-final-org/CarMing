package com.finalPJ.carming;



import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class inquiryController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/inquirylist.do")
	public String tipAndRecipeMain() {


		logger.info("[inquirylist]");
		return "inquiry/inquirylist";
	}
	
	@RequestMapping(value = "/writeinquiryform.do")
	public String writeinquiry() {


		logger.info("[inquirylist]");
		return "inquiry/writeinquiry";
	}
	
	@RequestMapping(value = "/inquirydetail.do")
	public String inquirydetail() {


		logger.info("[inquirylist]");
		return "inquiry/inquirydetail";
	}
	
	
	
	
	
	
	
}
