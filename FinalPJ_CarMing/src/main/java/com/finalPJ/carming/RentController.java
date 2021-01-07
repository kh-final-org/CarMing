package com.finalPJ.carming;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RentController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentController.class);
	
	
	@RequestMapping(value = "/insertform.do")
	public String productInsert(Model model) {
		logger.info("[PRODUCT INSERT]");
		
		
		return "campingrent/insertform";
	}
	@RequestMapping(value = "/productdetail.do")
	public String productDetail(Model model) {
		logger.info("[PRODUCT DETAIL]");
		
		
		return "campingrent/productdetail";
	}
	
	@RequestMapping(value = "/category.do")
	public String category(Model model) {
		logger.info("[PRODUCT CATEGORY]");
		
		return "campingrent/category";
	}
}
