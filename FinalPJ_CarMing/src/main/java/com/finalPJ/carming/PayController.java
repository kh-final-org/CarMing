package com.finalPJ.carming;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalPJ.carming.model.biz.CartBiz;
import com.finalPJ.carming.model.dto.CartListDto;

@Controller
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private CartBiz cBiz;
	
	@RequestMapping(value="/payinfo.do")
	public String paydetail(Model model, CartListDto cdto) {
		logger.info("[PAY INFO]");
		
		model.addAttribute("cartlist", cdto);

		return "campingrent/pay";
	}
	
	@ResponseBody
	@RequestMapping(value="/pay.do")
	public String pay(@RequestParam(value="pg")String pg, HttpServletRequest request, Model model) {
		logger.info("[PAY INSERT]");
		
		pg = request.getParameter("pg");
		
		System.out.println("pg="+pg);
		
		model.addAttribute("pg", pg);
		
		return "campingrent/testpay";
	}
	
	@ResponseBody
	@RequestMapping(value="/payresult.do")
	public String payresult(@RequestParam(value="amount")int amount, Model model) {
		logger.info("[PAY RESULT]");
		
		System.out.println("가격"+amount);
		
		model.addAttribute("", amount);
		
		return "campingrent/pay_result";
	}
}
