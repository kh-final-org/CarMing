package com.finalPJ.carming;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalPJ.carming.model.biz.CartBiz;
import com.finalPJ.carming.model.biz.PayBiz;
import com.finalPJ.carming.model.biz.boardBiz;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.PayDto;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	
	@Autowired
	private CartBiz cBiz;
	
	@Autowired
	private PayBiz pBiz;
	
	@Autowired
	private boardBiz bbiz;
	
	@RequestMapping(value = "/ordernpay.do")
	public String ordernpay(Model model, 
							@RequestParam(value="page", required=false, defaultValue="1")int page, 
							@RequestParam(value="search", required=false, defaultValue="")String search,
							@RequestParam(value="cpage", required=false, defaultValue="1")int cpage) {
		System.out.println("page: "+page+"/"+"search: "+search+"cpage");
		
		List<CartListDto> orderList = cBiz.orderList(search, cpage);
		List<PayDto> payList = pBiz.selectPay(search, page);
		
		model.addAttribute("cartList", orderList);
		model.addAttribute("payList", payList);
		model.addAttribute("oCount", cBiz.getOrderCnt(search));
		model.addAttribute("pCount", pBiz.getPayCnt(search));
		return "my/ordernpay";
	}
	
	@RequestMapping(value = "/mypage.do")
	public String mypage(Model model, int memno, String page, String search) {
		logger.info("[MY PAGE]");
		
		String searchDefault = ""; // 검색이 없는 경우 기본값
		if(search != null && !search.equals("")) { // 검색어가 있는 경우
			searchDefault = search;
		}
		
		int pageDefault = 1; // 페이지 선택이 없는 경우 기본값
		if(page != null && !page.equals("")) { // 페이지를 선택한 경우
			pageDefault = Integer.parseInt(page);
		}
		model.addAttribute("list", bbiz.MypageList(searchDefault,pageDefault,memno));
		model.addAttribute("count",bbiz.MypageListCnt(searchDefault,memno));
		
		return "my/mypage";
	}
}
