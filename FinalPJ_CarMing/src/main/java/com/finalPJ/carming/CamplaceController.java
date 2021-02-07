package com.finalPJ.carming;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalPJ.carming.model.biz.CamplaceBiz;
import com.finalPJ.carming.model.biz.mapLocationBiz;
import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.mapLocationDto;

@Controller
public class CamplaceController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private mapLocationBiz mapbiz;
	
	@Autowired
	private CamplaceBiz campbiz; 
	
	@RequestMapping("/maincamplace.do")
	public String CamplaceForm() {
		logger.info("[CamplaceForm]");
		
		return "camplace/maincamplace"; 
	}
	
	@RequestMapping("/detailcamplace.do")
	public String detailCamplaceForm() {
		logger.info("[CamplaceDetailForm]");
		
		return "camplace/detailcamplace";
	}
	
//	@RequestMapping(value="/ajaxlocation.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String ajaxlocation(@RequestBody int memno){
//
//		logger.info("[ajaxlocation]");
//		
//		List<mapLocationDto> mapdto = mapbiz.locationlist(memno);
//		
//		
//		if(res!=null) {
//			if(passwordEncoder.matches(dto.getMempw(), res.getMempw())) {
//				session.setAttribute("login", res);
//				session.setAttribute("logintype", "normal");
//				check=true;
//			}
//			
//			
//			System.out.println("---------------------확인");
//			System.out.println(res.getMemno());
//			System.out.println(res.getMemid());
//			System.out.println(res.getMempw());
//			System.out.println(res.getMembirth());
//			System.out.println("-----------------------");
//		}
//		
//
//		Map<String, Boolean> map = new HashMap<String,Boolean>();
//		map.put("check", check);
//		 
//		return map;
//	}
}
