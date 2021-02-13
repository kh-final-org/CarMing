package com.finalPJ.carming;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalPJ.carming.model.biz.CartBiz;
import com.finalPJ.carming.model.biz.PayBiz;
import com.finalPJ.carming.model.biz.ProductBiz;
import com.finalPJ.carming.model.dto.CartDto;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.PayDto;

@Controller
public class PayController {
	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	private CartBiz cBiz;
	@Autowired
	private PayBiz pBiz;
	@Autowired
	private ProductBiz prBiz;

	@RequestMapping(value="/payinfo.do")
	public String paydetail(Model model, CartListDto cdto) {
		logger.info("[PAY INFO]");
		
		
		List<CartListDto> cartList = cBiz.cartList();
		
		model.addAttribute("cartlist", cartList);
		
		model.addAttribute("cartListDto", cdto);
		
		return "campingrent/pay";
	}
	

	@RequestMapping(value="/kakao.do")
	public String kakao(Model model, CartListDto cdto, PayDto pDto, MemberDto mDto, int payNo, String[] cNoArr, String[] cAmountArr, String[] pNoArr) {
		logger.info("[KAKAO PAY]");
		
		//파라미터로 넘어온 결제번호 확인
		System.out.println("결제 번호: "+payNo);
		System.out.println("주문 번호:"+cNoArr[0]);
		System.out.println("주문 수량: "+cAmountArr);
		System.out.println("상품 번호: "+pNoArr);
		
		pDto.setPayNo(payNo);
		pDto.setCartNo(Integer.parseInt(cNoArr[0]));
		
		model.addAttribute("payDto", pBiz.selectOnePay(pDto));
		model.addAttribute("pName", cBiz.pName(pDto));
		System.out.println("대표 상품명: "+cBiz.pName(pDto));
		model.addAttribute("countproduct", cBiz.countProduct(payNo));
		model.addAttribute("cartListDto", cdto);
		model.addAttribute("cNoArr", cNoArr);
		model.addAttribute("cAmountArr", cAmountArr);
		model.addAttribute("pNoArr", pNoArr);
		
		return "campingrent/kakaopay";
	}
	
	@RequestMapping(value="/inicis.do")
	public String inicis(Model model, CartListDto cdto, PayDto pDto, int payNo, String[] cNoArr, String[] cAmountArr, String[] pNoArr) {
		logger.info("[INICIS PAY]");
		
		//파라미터로 넘어온 결제번호 확인
		//파라미터로 넘어온 결제번호 확인
		System.out.println("결제 번호: "+payNo);
		System.out.println("주문 번호:"+cNoArr[0]);
		System.out.println("주문 수량: "+cAmountArr);
		System.out.println("상품 번호: "+pNoArr);
		
		pDto.setPayNo(payNo);
		pDto.setCartNo(Integer.parseInt(cNoArr[0]));
		
		model.addAttribute("payDto", pBiz.selectOnePay(pDto));
		model.addAttribute("pName", cBiz.pName(pDto));
		System.out.println("대표 상품명: "+cBiz.pName(pDto));
		model.addAttribute("countproduct", cBiz.countProduct(payNo));
		model.addAttribute("cartListDto", cdto);
		model.addAttribute("cNoArr", cNoArr);
		model.addAttribute("cAmountArr", cAmountArr);
		model.addAttribute("pNoArr", pNoArr);
		
		return "campingrent/inicispay";
	}
	
	@RequestMapping(value="/kakaopay.do", method=RequestMethod.POST)
	public String kakopay(String pay_method, String addr, String[] cNoArr, int totalPrice,
			String[] cAmountArr, String[] pNoArr, HttpServletRequest request, RedirectAttributes rttr, PayDto pDto, CartDto cDto) {
		logger.info("[PAY INSERT]");
		
		//파라미터 값 확인(잘 넘어왔는지)
		System.out.println("pg="+request.getParameter("pay_method"));
		System.out.println("totalPrice="+request.getParameter("totalPrice"));
		System.out.println("addr="+request.getParameter("addr"));
		System.out.println("cNoArr"+request.getParameterValues("cartNo"));
		
		cNoArr = request.getParameterValues("cartNo");
		for(int i=0; i<cNoArr.length; i++) {
			System.out.println(cNoArr[i]);
		}
		int cartNo = 0;
		//결제 번호만 불러오는 쿼리문
		int seq = pBiz.selectPaySeq();  
		pDto.setPayNo(seq);
		System.out.println("seq: "+seq);
		//결제 번호는 고정 카트 번호는 여러 개
		for(String i : cNoArr) { 
			 cartNo = Integer.parseInt(i);
			 System.out.println("cartNo: "+cartNo);
			 pDto.setCartNo(cartNo); 
			 pDto.setMethod(pay_method);
			 pDto.setAddr(addr);
			 totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			 pDto.setTotalPrice(totalPrice);
			 pBiz.insertPay(pDto); 	 
		}
		
		//주문번호, 결제번호 데이터 넘겨주기
		rttr.addAttribute("payNo", pDto.getPayNo());
		rttr.addAttribute("cNoArr", cNoArr);
		rttr.addAttribute("cAmountArr", cAmountArr);
		rttr.addAttribute("pNoArr", pNoArr);
		
		return "redirect:/kakao.do";
	}
	
	@RequestMapping(value="/inicispay.do", method=RequestMethod.POST)
	public String inicispay(String pay_method, String addr, String[] cNoArr, int totalPrice,
			String[] cAmountArr, String[] pNoArr, HttpServletRequest request, RedirectAttributes rttr, Model model, PayDto pDto, CartDto cDto) {
		logger.info("[PAY INSERT]");
		
		//파라미터 값 확인(잘 넘어왔는지)
		System.out.println("pg="+request.getParameter("pay_method"));
		System.out.println("totalPrice="+request.getParameter("totalPrice"));
		System.out.println("addr="+request.getParameter("addr"));
		System.out.println("cNoArr"+request.getParameterValues("cartNo"));
		
		cNoArr = request.getParameterValues("cartNo");
		for(int i=0; i<cNoArr.length; i++) {
			System.out.println(cNoArr[i]);
		}
		int cartNo = 0;
		//결제 번호만 불러오는 쿼리문
		int seq = pBiz.selectPaySeq();  
		pDto.setPayNo(seq);
		System.out.println("seq: "+seq);
		//결제 번호는 고정 카트 번호는 여러 개
		for(String i : cNoArr) { 
			 cartNo = Integer.parseInt(i);
			 System.out.println("cartNo: "+cartNo);
			 pDto.setCartNo(cartNo); 
			 pDto.setMethod(pay_method);
			 pDto.setAddr(addr);
			 totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			 pDto.setTotalPrice(totalPrice);
			 pBiz.insertPay(pDto); 	 
		}
		
		//주문번호, 결제번호 데이터 넘겨주기
		rttr.addAttribute("payNo", pDto.getPayNo());
		rttr.addAttribute("cNoArr", cNoArr);
		rttr.addAttribute("cAmountArr", cAmountArr);
		rttr.addAttribute("pNoArr", pNoArr);
		return "redirect:/inicis.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/payresultform.do", method=RequestMethod.POST)
	public String payResultForm(@RequestParam(value="amount")String amount, @RequestParam(value="name")String name, @RequestParam(value="pg")String pay_method, @RequestParam(value="payNo")String payNo, @RequestParam(value="payDay")String payDay, Model model, RedirectAttributes rttr) {
		logger.info("[PAY RESULT]");
		
		//파라미터로 넘어온 값 확인
		System.out.println("가격"+amount);
		System.out.println("제품명: "+name);
		System.out.println("주문날짜: "+payDay);
		System.out.println("결제 수단: "+pay_method);
		System.out.println("주문 번호: "+payNo);
		
		rttr.addAttribute("totalPrice", amount);
		rttr.addAttribute("pName", name);
		rttr.addAttribute("pay_method", pay_method);
		rttr.addAttribute("payDay", payDay);
		rttr.addAttribute("payNo", payNo);
				
		return "redirect:/payresult.do";
	}
	
	@RequestMapping(value="/payresult.do")
	public String payResult(Model model, CartListDto cDto, int totalPrice, String pName, String pay_method, String payDay, int payNo, String[] cNoArr, String[] cAmountArr, String[] pNoArr) {
		logger.info("[PAY_RESULT PAGE]");
		System.out.println("가격"+totalPrice);
		System.out.println("주문날짜:"+payDay);
		System.out.println("주문번호: "+cNoArr[0]);
		System.out.println("주문 수량: "+cAmountArr);
		System.out.println("상품 고유번호: "+pNoArr);
		
		//렌트처리 상태
		for(String i: cNoArr) {
			int cartNo = Integer.parseInt(i);
			cBiz.updateCart(cartNo);
		}
		
		
		//결제완료 후 재고 갯수 감소
		for(String i : pNoArr) {
			for(String p : cAmountArr) {
				int pNos = Integer.parseInt(i);
				cDto.setpNo(pNos);
				int cAmounts = Integer.parseInt(p);
				cDto.setcAmount(cAmounts);
				prBiz.changeAmount(cDto);
			}
		}
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("pName", pName);
		model.addAttribute("pay_method", pay_method);
		model.addAttribute("payDay", payDay);
		model.addAttribute("payNo", payNo);
		
		return "campingrent/pay_result";
		}
}
