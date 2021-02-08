package com.finalPJ.carming;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.CartBiz;
import com.finalPJ.carming.model.biz.PayBiz;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.PayDto;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	
	@Autowired
	private CartBiz cBiz;
	
	@Autowired
	private PayBiz pBiz;
	
	@RequestMapping(value = "/ordernpay.do")
	public String ordernpay(Model model) {
		
		List<CartListDto> orderList = cBiz.orderList();
		List<PayDto> payList = pBiz.selectPay();
		
		model.addAttribute("cartList", orderList);
		model.addAttribute("payList", payList);
		
		return "my/ordernpay";
	}
	
	@RequestMapping(value = "/mypage.do")
	public String mypage(Model model) {
		
		return "my/mypage";
	}
}
