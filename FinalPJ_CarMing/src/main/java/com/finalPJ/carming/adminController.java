package com.finalPJ.carming;


import java.io.Console;

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
	public String adminRentList(Model model) {
		
		model.addAttribute("list",biz.RentList());
		logger.info("[adminRentList]");
		return "Admin/adminRentList";
	}
	
	@RequestMapping(value = "/adminRentDetail.do")
	public String adminRentDetail(Model model, int cartNo) {
		logger.info("[admRentDetail]");
		model.addAttribute("list", biz.selectOneRent(cartNo));
		return "Admin/adminRentDetail";
	}
	
	@RequestMapping(value = "/returnRent.do")
	public String returnRent(Model model, int cartNo) {
		
		logger.info("[admRentDetail]");
		int res = biz.returnRent(cartNo);
		System.out.println(cartNo);
		if(res>0) {
			return "redirect: adminRentList.do";
		}else {
			return "redirect: adminRentDetail.do";
		}
		
	}
	
	@RequestMapping(value = "/memberlist.do")
	public String memberlist(Model model, String page, String search) {
		logger.info("[memberList]");
		
		String searchDefault = ""; // 검색이 없는 경우 기본값
		if(search != null && !search.equals("")) { // 검색어가 있는 경우
			searchDefault = search;
		}
		
		int pageDefault = 1; // 페이지 선택이 없는 경우 기본값
		if(page != null && !page.equals("")) {	// 페이지를 선택한 경우
			pageDefault = Integer.parseInt(page);
		}
		
		model.addAttribute("list", biz.getMemList(searchDefault, pageDefault));
		model.addAttribute("count", biz.getMemCount(searchDefault));

		return "Admin/adminMemberList";
	}
}
	
	
	
	

