package com.finalPJ.carming;



import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/memberlist.do")
	public String tipAndRecipeMain() {


		logger.info("[memberlist]");
		return "Admin/adminMemberList";
	}
	
	@RequestMapping(value = "/adminRentList.do")
	public String adminRentList() {


		logger.info("[adminRentList]");
		return "Admin/adminRentList";
	}
	
	@RequestMapping(value = "/adminRentDetail.do")
	public String adminRentDetail() {


		logger.info("[adminRentDetail]");
		return "Admin/adminRentDetail";
	}
	
	
		
	
	
	
	
}
