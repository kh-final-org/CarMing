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

import com.finalPJ.carming.model.biz.CartBiz;
import com.finalPJ.carming.model.biz.PayBiz;
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

	@RequestMapping(value="/payinfo.do")
	public String paydetail(Model model, CartListDto cdto) {
		logger.info("[PAY INFO]");
		
		
		List<CartListDto> cartList = cBiz.cartList();
		
		model.addAttribute("cartlist", cartList);
		
		model.addAttribute("cartListDto", cdto);
		
		return "campingrent/pay";
	}
	

	@RequestMapping(value="/kakao.do")
	public String kakao(Model model, CartListDto cdto, PayDto pDto, MemberDto mDto) {
		logger.info("[KAKAO PAY]");
		
		List<PayDto> payList = pBiz.selectPay();

		List<CartListDto> cartList = cBiz.cartList();
		
		model.addAttribute("payDto", pDto);
		model.addAttribute("cartListDto", cdto);
		System.out.println(pDto.getAddr());
		return "forward:/toKakao.do";
	}
	
	@RequestMapping(value="/toKakao.do")
	public String toKakao(Model model, CartListDto cdto, PayDto pDto, MemberDto mDto) {
		System.out.println(pDto.getAddr());
		return "campingrent/kakaopay";
	}
	
	@RequestMapping(value="/inicis.do")
	public String inicis(Model model, CartListDto cdto, PayDto pDto) {
		logger.info("[INICIS PAY]");
		
		model.addAttribute("payDto", pDto);
		model.addAttribute("cartListDto", cdto);
		
		return "campingrent/inicispay";
	}
	
	@ResponseBody
	@RequestMapping(value="/kakaopay.do", method=RequestMethod.POST)
	public int kakopay(@RequestParam(value="pay_option")String pay_option, @RequestParam(value="addr")String addr, @RequestParam(value="cNoArr[]")List<String> cNoArr, @RequestParam(value="totalPrice")int totalPrice, HttpServletRequest request, Model model, PayDto pDto, CartDto cDto) {
		logger.info("[PAY INSERT]");
		
		//파라미터 값 확인(잘 넘어왔는지)
		System.out.println("pg="+pay_option);
		System.out.println("totalPrice="+totalPrice);
		System.out.println("addr="+addr);
		System.out.println("cNoArr"+cNoArr);
		
		int cartNo = 0;
		//결제 번호만 불러오는 쿼리문
		int seq = pBiz.selectPaySeq();  
		pDto.setPayNo(seq);
		
		//결제 번호는 고정 카트 번호는 여러 개
		for(String i : cNoArr) { 
			 cartNo = Integer.parseInt(i);
			 pDto.setCartNo(cartNo); 
			 pDto.setMethod(pay_option);
			 totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			 pDto.setTotalPrice(totalPrice);
			 pBiz.insertPay(pDto); 	 
			 
			//결제 내역에 추가한 장바구니 목록 삭제
//			 cDto.setCartNo(cartNo);
//			 cBiz.deleteCart(cDto);
		}
		System.out.println("가격"+pDto.getTotalPrice());
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="/inicispay.do", method=RequestMethod.POST)
	public int inicispay(@RequestParam(value="pay_option")String pay_option, @RequestParam(value="addr")String addr, @RequestParam(value="cNoArr[]")List<String> cNoArr, @RequestParam(value="totalPrice")int totalPrice, HttpServletRequest request, Model model, PayDto pDto, CartDto cDto) {
		logger.info("[PAY INSERT]");
		
		System.out.println("pg="+pay_option);
		System.out.println("totalPrice="+totalPrice);
		System.out.println("addr="+addr);
		System.out.println("cNoArr"+cNoArr);
		
		int cartNo = 0;
		//결제 번호만 불러오는 쿼리문
		int seq = pBiz.selectPaySeq();  
		pDto.setPayNo(seq);
		
		//결제 번호는 고정 카트 번호는 여러 개
		for(String i : cNoArr) {
			 //결제 내역 추가
			 cartNo = Integer.parseInt(i);
			 pDto.setCartNo(cartNo); 
			 pDto.setMethod(pay_option);
			 totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			 pDto.setTotalPrice(totalPrice);
			 pBiz.insertPay(pDto); 	 
			 
			 
			 //결제 내역에 추가한 장바구니 목록 삭제
//			 cDto.setCartNo(cartNo);
//			 cBiz.deleteCart(cDto);
		}
		System.out.println("가격"+pDto.getTotalPrice());
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="/payresultform.do", method=RequestMethod.POST)
	public int payresult(@RequestParam(value="amount")int amount, Model model) {
		logger.info("[PAY RESULT]");
		
		System.out.println("가격"+amount);
		
		model.addAttribute("", amount);
		
				
		return 1;
	}
	
//	@RequestMapping(value="/payresult.do") 
}
