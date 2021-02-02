package com.finalPJ.carming;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CamLiveController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/camMeet.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "camLive/camMeet_main";
	}	
}
