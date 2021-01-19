package com.finalPJ.carming;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	
	@RequestMapping(value = "/ordernpay.do")
	public String ordernpay(Model model) {
		return "my/ordernpay";
	}
	
	@RequestMapping(value = "/mypage.do")
	public String mypage(Model model) {
		return "my/mypage";
	}
}
