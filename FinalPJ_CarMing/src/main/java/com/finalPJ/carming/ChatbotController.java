package com.finalPJ.carming;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalPJ.carming.model.biz.InquiryBiz;
import com.finalPJ.carming.model.biz.MemberBiz;
import com.finalPJ.carming.model.biz.SurveyBiz;
import com.finalPJ.carming.model.dto.InquiryDto;
import com.finalPJ.carming.model.dto.InquiryDto2;
import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.SurveyDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChatbotController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatbotController.class);
	
	@Autowired
	private SurveyBiz surveyBiz;
	@Autowired
	private MemberBiz memberBiz;
	@Autowired
	private InquiryBiz inquiryBiz;
	
	// 임시 세션(제거)
	HttpSession session;
	
	// session 값 저장하기
	int sessionNo = 0;
	
	//MemberDto login = (MemberDto)session.getAttribute("login");
	
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
		model.addAttribute("list", surveyBiz.selectList());
		
		return "chatbot/mvclist";
	}
	
	@RequestMapping("/surveyOne.do")
	public String detail(Model model) {
		
		logger.info("[SELECT ONE]");
		
		model.addAttribute("dto", surveyBiz.selectOne((Integer)session.getAttribute("memno")));
		
		return "chatbot/mvcdetail";
	}
	
	@RequestMapping("/insertres.do")
	public String insertRes(SurveyDto dto) {
		
		// select로 먼저 확인.
		
		// survey 값이 없으면 insert 
		
		// survey 값이 있으면 update
		
		logger.info("[INSERT RES]");
		
		dto.setMemno(((MemberDto)session.getAttribute("login")).getMemno());
		
		dto.setMemno((Integer)session.getAttribute("memno"));
		
		System.out.println("dto.toString : " + dto.toString());
		
		int res = surveyBiz.insert(dto);
		
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
		
		// 받아온 설문조사(SurveyDto)에 session번호 추가.
		// dto.setMemno((Integer)session.getAttribute("memno"));
		
		System.out.println("dto.toString : " + dto.toString());
		
		// insert || update
		int res = surveyBiz.insert(dto);
		
		boolean check = false;
		if(res > 0) {
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		// check 값을 넘겨주자.
		return map;
//		return "redirect:sameFriendOne.do";
	}
	
	
	// [동성] 나에 맞는 친구들 중 한명의 설문조사 가져오기
	@RequestMapping(value = "/FriendOne.do", method=RequestMethod.POST)
	@ResponseBody //@ResponseBody 추가.
	public Map<String, String> FriendOne(Model model, @RequestBody SurveyDto dto) {
		logger.info("[SELECT FRIEND ONE]");
		
		Boolean check = false;
		
		int res = surveyBiz.FriendOne(dto);
		System.out.println("FriendOne()을 넘어온 매개변수 dto에 담긴 정보 : " + dto.toString());
		
		System.out.println("선택된 친구번호는 : " + res);
		
		MemberDto friendDto = memberBiz.selectNo(res);
		
		
		String gender;
		
		/*
		 * System.out.println("dto.getSurvey1() : " + dto.getSurvey1());
		 * if(dto.getSurvey1() == "male") { gender = "남"; } else { gender = "여"; }
		 */
		
		System.out.println("friendDto.getMemgender() : " + friendDto.getMemgender());
		if(friendDto.getMemgender() == 1) {
			gender = "남";
		} else {
			gender = "여";
		}
		
		System.out.println("선택된 친구의 프로필사진 : " + friendDto.getMemfile());
		System.out.println("선택된 친구의 닉네임 : " + friendDto.getMemnick());
		System.out.println("선택된 친구의 성별 : " + gender);
		
		if(res > 0) {
			check = true;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("friendNo", Integer.toString(res));
		map.put("friendFile", friendDto.getMemfile());
		map.put("friendNick", friendDto.getMemnick());
		map.put("friendGender", gender);

		return map;
	}
	
	@RequestMapping(value="/insertInquiry.do", method=RequestMethod.POST)
	@ResponseBody //@ResponseBody 추가.						// @RequestBody 추가.
	public Map<String, Boolean> insertInquiry(@RequestBody InquiryDto2 dto) {
//	public Map<String, Boolean> insertInquiry(@RequestBody String dto) {
		/*
		 * @ResponseBody : 응답시 java 객체를 response 객체에 binding
		 * @RequestBody : 요청시 request객체로 넘어오는 데이터를 java 객체로
		 */
		System.out.println("insertInquiry.do로 넘어옴.");
		
		logger.info("[INSERT AJAX]");
		
		// 받아온 설문조사(SurveyDto)에 session번호 추가.
		// dto.setMemno((Integer)session.getAttribute("memno"));
		
		System.out.println("dto.getCategoryNo : " + dto.getCategoryNo());
		System.out.println("dto.getInquiryContent : " + dto.getInquiryContent());
		System.out.println("dto.getMemNo : " + dto.getMemNo());
		System.out.println("dto.toString : " + dto.toString());
		
		InquiryDto inquiry = new InquiryDto();

		inquiry.setInquiryContent(dto.getInquiryContent());
		inquiry.setCategoryNo(dto.getCategoryNo());
		inquiry.setMemNo(dto.getMemNo());
		
		
		int res = inquiryBiz.chatbotinsert(inquiry);
		
		boolean check = false;
		if(res > 0) {
			check = true;
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		// check 값을 넘겨주자.
		return map;
	}
	
}
