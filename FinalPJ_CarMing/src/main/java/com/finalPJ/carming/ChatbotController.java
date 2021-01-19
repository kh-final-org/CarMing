package com.finalPJ.carming;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.survey.biz.SurveyBiz;
import com.finalPJ.carming.survey.dto.SurveyDto;

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
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "chatbot/chatbot";
	}
	
//	@RequestMapping(value = "/surveyList.do", method = RequestMethod.GET)
	@RequestMapping(value = "/surveyList.do")
	public String list(Model model) {
		logger.info("[SELECT LIST]");
		
		// model에 list라는 이름으로 biz.selectList()의 결과 값을 담아주자. 
		model.addAttribute("list", biz.selectList());
		
		return "chatbot/mvclist";
	}
	
	@RequestMapping("/surveyOne.do")
	public String detail(Model model, int memno) {
		
		logger.info("[SELECT ONE]");
		
		model.addAttribute("dto", biz.selectOne(memno));
		
		return "chatbot/mvcdetail";
	}
	
	@RequestMapping("/insertres.do")
	public String insertRes(SurveyDto dto) {
		
		logger.info("[INSERT RES]");
		
		dto.setMemno(sessionNo);
		
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
	
	
	
	
	
	
	
}
