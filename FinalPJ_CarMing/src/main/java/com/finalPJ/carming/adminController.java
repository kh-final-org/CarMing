package com.finalPJ.carming;


import java.io.Console;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.InquiryBiz;
import com.finalPJ.carming.model.biz.adminBiz;
import com.finalPJ.carming.model.dto.boardDto;

@Controller
public class adminController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
@Autowired
private adminBiz biz;

@Autowired
private InquiryBiz Ibiz;

	@RequestMapping("/adminPage.do")
	public String adminpage(Model model, String page, String search) {
		logger.info("[adminPage]");

		String searchDefault = ""; // 검색이 없는 경우 기본값
		if(search != null && !search.equals("")) { // 검색어가 있는 경우
			searchDefault = search;
		}
		
		int pageDefault = 1; // 페이지 선택이 없는 경우 기본값
		if(page != null && !page.equals("")) { // 페이지를 선택한 경우
			pageDefault = Integer.parseInt(page);
		}
		
		
		model.addAttribute("list",biz.RentList(searchDefault,pageDefault));
		model.addAttribute("count", biz.rentListCnt(searchDefault));
		
		logger.info("[inquirylist]");
		
		return "Admin/adminPage";
	}
	
	/*
	 * //게시글쓰기(사진) 페이지로 이동
	 * 
	 * @RequestMapping(value = "/boardinsertform.do") public String
	 * boardInsert(boardDto dto) { logger.info("[BOARD INSERT FORM]");
	 * 
	 * return "board/boardinsert"; }
	 */
	
	
	@RequestMapping("deletemem.do")
	public String memberDetail(int memNo) {
		int res = biz.delete(memNo);
		if(res>0) {
			return "redirect: memberlist.do";
		}else {
			return "redirect: memberlist.do";
		}
		
	}
	
	@RequestMapping("deleteProduct.do")
	public String deleteProduct(int pNo) {
		int res = biz.deleteProduct(pNo);
		if(res>0) {
			return "redirect: adminProductList.do";
		}else {
			return "redirect: adminProductList.do";
		}
		
	}
	
	
	@RequestMapping(value = "/adminRentList.do")
	public String adminRentList(Model model, String page, String search) {
		
		String searchDefault = "";
		if(search != null && !search.equals("")) {
			searchDefault = search;
		}
		
		int pageDefault = 1;
		if(page != null && !page.equals("")) {
			pageDefault = Integer.parseInt(page);
		}
		
		model.addAttribute("list",biz.RentList(searchDefault,pageDefault));
		model.addAttribute("count", biz.rentListCnt(searchDefault));
		System.out.println(model.toString());
		logger.info("[adminRentList]");
		return "Admin/adminRentList";
	}
	
	
	@RequestMapping(value = "/adminProductList.do")
	public String adminProductList(Model model, String page, String search) {
		
		String searchDefault = "";
		if(search != null && !search.equals("")) {
			searchDefault = search;
		}
		
		int pageDefault = 1;
		if(page != null && !page.equals("")) {
			pageDefault = Integer.parseInt(page);
		}
		
		model.addAttribute("list",biz.ProductList(searchDefault,pageDefault));
		model.addAttribute("count", biz.ProductCnt(searchDefault));
		System.out.println(model.toString());
		logger.info("[adminProductList]");
		return "Admin/adminProductList";
	}
	
	
	
	@RequestMapping(value = "/adminRentDetail.do")
	public String adminRentDetail(Model model, int cartNo) {
		logger.info("[admRentDetail]");
		model.addAttribute("list", biz.selectOneRent(cartNo));
		return "Admin/adminRentDetail";
	}
	
	
	@RequestMapping(value = "/sendRent.do")
	public String sendRent( int cartNo) {
		
		logger.info("[admRentDetail]");
		int res = biz.sendRent(cartNo);
		System.out.println(cartNo);
		if(res>0) {
			return "redirect: adminRentList.do";
		}else {
			return "redirect: adminRentDetail.do";
		}
		
	}
	
	@RequestMapping(value = "/returnRent.do")
	public String returnRent( int cartNo) {
		
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
	
	@RequestMapping("/deleteRent.do")
	public String deleteRent(int cartNo) {
		logger.info("[DeleteRent]");
		
		int res = biz.deleteRent(cartNo);
		System.out.println(cartNo);
		if(res>0) {
			return "redirect: adminPage.do";
		}else {
			return "redirect: adminPage.do";
		}
	}
}
	
	
