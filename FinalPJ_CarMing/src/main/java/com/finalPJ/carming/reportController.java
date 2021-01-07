package com.finalPJ.carming;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class reportController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/reportlist.do")
	public String tipAndRecipeMain() {


		logger.info("[reportlist]");
		return "report/reportlist";
	}
	
	@RequestMapping(value = "/writereportform.do")
	public String writeReportForm() {


		logger.info("[writereport]");
		return "report/writereport";
	}
	
	@RequestMapping(value = "/reportdetail.do")
	public String reportDetail() {


		logger.info("[writereport]");
		return "report/reportdetail";
	}
	
	
}
