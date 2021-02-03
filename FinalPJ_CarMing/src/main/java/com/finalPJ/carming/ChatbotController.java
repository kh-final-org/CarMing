package com.finalPJ.carming;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalPJ.carming.model.biz.SurveyBiz;
import com.finalPJ.carming.model.dto.SurveyDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChatbotController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatbotController.class);
	
	@Autowired
	private SurveyBiz biz;
	
	// 임시 세션(제거)
	HttpSession session;
	
	// session 값 저장하기
	int sessionNo = 0;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/chatbot.do", method = RequestMethod.GET)
	public String chatbot(Locale locale, Model model) {
		
		return "chatbot/chatbot";
	}
	
	// 전체 List
	@RequestMapping(value = "/surveyList.do")
	public String list(Model model) {
		logger.info("[SELECT LIST]");
		
		// model에 list라는 이름으로 biz.selectList()의 결과 값을 담아주자. 
		model.addAttribute("list", biz.selectList());
		
		return "chatbot/mvclist";
	}
	
	@RequestMapping("/surveyOne.do")
	public String detail(Model model) {
		
		logger.info("[SELECT ONE]");
		
		model.addAttribute("dto", biz.selectOne((Integer)session.getAttribute("memno")));
		
		return "chatbot/mvcdetail";
	}
	
	@RequestMapping("/insertres.do")
	public String insertRes(SurveyDto dto) {
		
		// select로 먼저 확인.
		
		// survey 값이 없으면 insert 
		
		// survey 값이 있으면 update
		
		logger.info("[INSERT RES]");
		
		dto.setMemno((Integer)session.getAttribute("memno"));
		
		System.out.println("dto.toString : " + dto.toString());
		
		int res = biz.insert(dto);
		
		if(res > 0) {
			return "redirect:surveyList.do";
		} else {
			return "redirect:insertform.do";
		}
		
	}
	
//	@RequestMapping(value = "/userLogin.do", method = RequestMethod.GET)
//    public String login(HttpServletRequest request) {
//        
//		session = request.getSession();
//        
//		System.out.println("No session");
//        
//        return "chatbot/chatbot";
//    }
	
	@RequestMapping(value = "/userLogin.do", method = RequestMethod.GET)
    public String login(int memno, HttpServletRequest request) {
        
		session = request.getSession();
		
        session.setAttribute("memno", memno);
        
        // Session에서 사용 할 값 저장.
        sessionNo = memno;
        
        System.out.println("sessionNo의 값 : " + sessionNo);
        
        return "chatbot/chatbot";
    }
	
	//userLogout.do
	@RequestMapping(value = "/userLogout.do", method = RequestMethod.GET)
    public String userRemove(HttpServletRequest request) {
        
		session.invalidate();
        
//        System.out.println("session의 값 : " + session.getAttribute("memno"));
        
        return "chatbot/chatbot";
    }
	
	@RequestMapping(value="/insertAjax.do", method=RequestMethod.POST)
	@ResponseBody //@ResponseBody 추가.						// @RequestBody 추가.
	public Map<String, Boolean> insertAjax(@RequestBody SurveyDto dto) {
		/*
		 * @ResponseBody : 응답시 java 객체를 response 객체에 binding
		 * @RequestBody : 요청시 request객체로 넘어오는 데이터를 java 객체로
		 */
		logger.info("[INSERT AJAX]");
		
		dto.setMemno((Integer)session.getAttribute("memno"));
		
		System.out.println("dto.toString : " + dto.toString());
		
		int res = biz.insert(dto);
		
		boolean check = false;
		if(res > 0) {
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		// check 값을 넘겨주자.
		return map;
	}
	
	// [동성] 나에 맞는 친구들의 설문조사 리스트 가져오기
	@RequestMapping(value = "/sameFriendList.do", method=RequestMethod.POST)
	@ResponseBody //@ResponseBody 추가.
//	public String sameFriendList(Model model, @RequestBody SurveyDto dto) {
	public Map<String, Boolean> sameFriendList(Model model, @RequestBody SurveyDto dto) {
		logger.info("[SELECT SAME FRIEND LIST]");
		
		logger.info(dto.toString());
		dto.setMemno((Integer)session.getAttribute("memno"));
		logger.info(dto.toString());
		
		// model에 list라는 이름으로 biz.sameFriendList()의 결과 값을 담아주자. 
		// model.addAttribute("list", biz.sameFriendList(dto));
		
		boolean check = false;
		
		List<SurveyDto> list = biz.sameFriendList(dto);
		
		System.out.println("list.size : " + list.size());
		
		for(int i=0; i<list.size(); i++) {
			System.out.print(list.get(i) + " / ");
		}
		
		if(list.size() > 0) {
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
//		return "chatbot/mvclist";
		return map;
	}
	
	
	@RequestMapping(value = "/otherfriendList.do")
	public String otherfriendList(Model model) {
		logger.info("[SELECT OTHER FRIEND LIST]");
		
		// model에 list라는 이름으로 biz.selectList()의 결과 값을 담아주자. 
//			model.addAttribute("list", biz.otherFriendList());
		
		return "chatbot/mvclist";
	}
	
	
	
	// [동성] 나에 맞는 친구들의 설문조사 리스트 가져오기
	@RequestMapping(value = "/sameFriendOne.do", method=RequestMethod.POST)
	@ResponseBody //@ResponseBody 추가.
//		public String sameFriendList(Model model, @RequestBody SurveyDto dto) {
	public Map<String, Boolean> sameFriendOne(Model model, @RequestBody SurveyDto dto) {
		logger.info("[SELECT SAME FRIEND ONE]");
		
		logger.info(dto.toString());
		dto.setMemno((Integer)session.getAttribute("memno"));
		logger.info(dto.toString());
		
		// model에 list라는 이름으로 biz.sameFriendList()의 결과 값을 담아주자. 
		// model.addAttribute("list", biz.sameFriendList(dto));
		
		boolean check = false;
		
		int res = biz.sameFriendOne(dto);
		
		System.out.println("선택된 친구번호는 : " + res);
		
		if(res > 0) {
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
//			return "chatbot/mvclist";
		return map;
	}
	
	
}
