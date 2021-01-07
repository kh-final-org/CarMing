package com.finalPJ.carming;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class rentAdminController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/rendAdminlist.do")
	public String list() {


		logger.info("[tipAndRecipeMain]");
		return "rentAdmin/rentAdminlist";
	}
	
	
	
}
