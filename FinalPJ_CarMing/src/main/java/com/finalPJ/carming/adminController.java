package com.finalPJ.carming;



import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.adminBiz;

@Controller
public class adminController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
@Autowired
private adminBiz biz;

	@RequestMapping(value = "/memberlist.do")
	public String memberList(Model model) {

		model.addAttribute("list",biz.list());
		logger.info("[memberlist]");
		return "Admin/adminMemberList";
	}
	
	@RequestMapping("deletemem.do")
	public String memberDetail(int memNo) {
		int res = biz.delete(memNo);
		if(res>0) {
			return "redirect: memberlist.do";
		}else {
			return "redirect: memberlist.do";
		}
		
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
