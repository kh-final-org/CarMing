package com.finalPJ.carming;

import java.util.ArrayList;
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
	
	@Autowired
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
	
	@RequestMapping(value="/ajaxlocation.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxlocation(@RequestBody int memno){

		logger.info("[ajaxlocation]");

		
		System.out.println(memno);
		List<mapLocationDto> mapdto = mapbiz.locationlist(memno);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(mapdto!=null) {
		
			for(mapLocationDto dto : mapdto) {
				List<Double> maploc = new ArrayList<Double>();
				double lat = Double.parseDouble(String.format("%.6f", Double.parseDouble(dto.getMaplatitude())));
				double longt = Double.parseDouble(String.format("%.6f", Double.parseDouble(dto.getMaplongtitude())));
				maploc.add(lat);
				maploc.add(longt);
				
				map.put(dto.getMapname(), maploc);
			}
		}

		 
		return map;
	}
}
