package com.finalPJ.carming;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalPJ.carming.model.biz.MemberBiz;
import com.finalPJ.carming.model.dto.MemberDto;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired
	private MemberBiz biz;
	

	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	
	@RequestMapping("/loginform.do")
	public String loginform() {
		logger.info("[login form]");
		return "member/login";
	}
	
	@RequestMapping(value="/ajaxlogin.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(HttpSession session, @RequestBody MemberDto dto){

		logger.info("[login]");
		
		MemberDto res = biz.login(dto);
		boolean check = false;
		if(res!=null) {
			session.setAttribute("login", res);
			check=true;
			
		}
		
		Map<String, Boolean> map = new HashMap<String,Boolean>();
		map.put("check", check);
		 
		return map;
	}
	
	@RequestMapping("/registerform.do")
	public String registform() {
		logger.info("[regist form]");
		return "member/register";
	}
	
	@RequestMapping("/registerform2.do")
	public String registform2() {
		logger.info("[regist form2]");
		return "member/register2";
		
	}
	
	@RequestMapping("/regist.do")
	public String memberInsert(MemberDto dto) {
		int res = 0;
		
		res = biz.insert(dto);
		if(res>0) {
			return "redirect:loginform.do";
		}else {
			return "redirect:registerform2.do";
		}
		
	}
	
	
		
}
