package com.finalPJ.carming;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.finalPJ.carming.model.dto.CartDto;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.MemberDto;

@Controller

public class CartController {
	
	@InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartBiz biz;
	
	@ResponseBody
	@RequestMapping(value="/cart.do")
	public int cart(@RequestParam(value="cAmount") String cAmount, @RequestParam(value="pAmount") String pAmount, HttpServletRequest request, HttpSession session, CartDto cart) {
		logger.info("[CART INSERT]");
		
		//파라미터값 확인하기 위한 출력 구문
		System.out.println("수량: "+cAmount);
		System.out.println("재고: "+pAmount);
		
		int result = 1;
		
		MemberDto member = (MemberDto)session.getAttribute("member");
		
		System.out.println(cart);
		biz.insertCart(cart);
		System.out.println(result);
		
		return result;
	}
	

	@RequestMapping("/cartlist.do")
	public String cartlist(HttpSession session, Model model) {
		logger.info("[CART LIST]");

		List<CartListDto> cartList = biz.cartList();
		
		model.addAttribute("cartlist", cartList);
		
		return "campingrent/cart";
	}
	
	@ResponseBody
	@RequestMapping(value="/cartdelete.do", method = RequestMethod.POST)
	public int cartdelete(@RequestParam(value="chBox[]") List<String> chArr, CartDto cdto) throws Exception{
		logger.info("[CART DELETE]");
		System.out.println("여기까지 못온듯?");
		
		int result=0;
		int cartNo=0;
		
		for(String i : chArr) {
			cartNo = Integer.parseInt(i);
			cdto.setCartNo(cartNo);
			biz.deleteCart(cdto);
		}
		
		result = 1;
		
		return result;
	}
}
