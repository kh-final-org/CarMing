package com.finalPJ.carming;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@RequestMapping(value="/pay.do")
	public String cart(Model model) {
		logger.info("[PAY]");
		return "campingrent/pay";
	}
}
