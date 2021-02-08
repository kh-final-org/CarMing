package com.finalPJ.carming;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.finalPJ.carming.common.fileUpload.profileimgFile;
import com.finalPJ.carming.model.biz.MemberBiz;
import com.finalPJ.carming.model.biz.NaverLoginBO;
import com.finalPJ.carming.model.dto.MemberDto;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	private String apiResult = null;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	
	@RequestMapping(value = "/loginform.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginform(Model model, HttpSession session) {
		logger.info("[login form]");
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "member/login";
	}
	
	@RequestMapping(value="/ajaxlogin.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(HttpSession session, @RequestBody MemberDto dto){

		logger.info("[login]");
		
		MemberDto res = biz.login(dto);
		boolean check = false;
		
		if(res!=null) {
			if(passwordEncoder.matches(dto.getMempw(), res.getMempw())) {
				session.setAttribute("login", res);
				session.setAttribute("logintype", "normal");
				check=true;
			}
			
			
			System.out.println("---------------------확인");
			System.out.println(res.getMemno());
			System.out.println(res.getMemid());
			System.out.println(res.getMempw());
			System.out.println(res.getMembirth());
			System.out.println("-----------------------");
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
		

		if(dto.getMemchk()==null) {
			dto.setMemchk("N");
		}


		System.out.println(dto.getMempw());
		dto.setMempw(passwordEncoder.encode(dto.getMempw()));
		System.out.println(dto.getMempw());
		
		res = biz.insert(dto);
		if(res>0) {
			return "redirect:loginform.do";
		}else {
			return "redirect:registerform2.do";
		}
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/loginform.do";
	}
	

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		logger.info("[naverlogin callback]");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String형식인 apiResult를 json형태로 바꿈
		//요구한 정보(
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 email값 파싱, password용 id값을 파싱해서 추가 문자 기입
		String email = (String)response_obj.get("email");
		String password = "naver"+(String)response_obj.get("id");
		MemberDto res = biz.selectOne(email);
		if(res!=null) {
			session.setAttribute("login", res);
			session.setAttribute("logintype", "naver");
			model.addAttribute("result", apiResult);
			return "redirect:/home.do";
		} else {
			String name = (String)response_obj.get("name");
			String gender = (String)response_obj.get("gender");
			String nickname = (String)response_obj.get("nickname");
			model.addAttribute("email", email);
			model.addAttribute("password", password);
			model.addAttribute("name", name);
			model.addAttribute("gender", gender);
			model.addAttribute("nickname", nickname);
			model.addAttribute("result", apiResult);
			return "member/register2";
		}
	}
	
	@RequestMapping("/profilechangeform.do")
	public String profilechangeform(HttpSession session, Model model) {
		logger.info("[profilechangeform]");
		
		MemberDto dto = (MemberDto)session.getAttribute("login");
		
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		String strNowDate = simpleDateFormat.format(dto.getMembirth());

		model.addAttribute("membirth", strNowDate);
		
		return "member/profilechange";
	}
	
	//수정필요 파일업로드 부분이 안됨
	@RequestMapping(value="/profilechange.do", method = RequestMethod.POST )
	public String profileChange(HttpServletRequest request, MemberDto dto, Model model, BindingResult result, MultipartFile photofile) throws IOException {
		
		logger.info("[profileChange]");
		
		String name = "profileimg_user"+dto.getMemno()+".png";
		
		
		
		
		String filename = photofile.getOriginalFilename();
		
		System.out.println("=================");
		System.out.println(filename);
		System.out.println("=================");
		

		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = photofile.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/profileimg");
			
			System.out.println("업로드 될 실제 경로: "+path);
			
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdir();
			}
			
			File newFile = new File(path + "/" + name);
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			
			outputStream = new FileOutputStream(newFile);
			
			int read = 0;
			byte[] b = new byte[(int)photofile.getSize()];
			
			while((read=inputStream.read(b)) !=-1) {
				outputStream.write(b,0,read);
			}
			
			//경로명과 이름으로 db에 저장
			dto.setMemfile("resources/img/profileimg/"+name);
			System.out.println(name);
			
		} catch (IOException e) {
			System.out.println("파일 저장 에러");
			e.printStackTrace();
		}finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		System.out.println("---------------------");
		System.out.println(dto.getMemchk());
		System.out.println(dto.getMemfile());
		
		if(dto.getMemchk() == null || dto.getMemchk() == "") {
			dto.setMemchk("N");
		}
		
		System.out.println("===================");
		System.out.println(dto.getMemchk());
		
		int res = 0;
		
		res = biz.update(dto);
		
		if(res==1) {
			MemberDto redto = biz.selectOne(dto.getMemid());
			
			HttpSession session = request.getSession();
			
			session.setAttribute("login", redto);
			
			return "redirect:mypage.do";
	
		}else {
			return "redirect:profilechangeform.do";
			
		}
		
	}
	
	@RequestMapping("/PWchangeform.do")
	public String PWchangeform() {
		logger.info("[PWchangeform]");
		
		return "member/passwordchange";
	}
	
	@RequestMapping("/PWchange.do")
	public String PWchange(HttpSession session, Model model, String beforemempw, String newmempw) throws IOException {
		
		MemberDto dto = (MemberDto)session.getAttribute("login");
		
		if(beforemempw.equals(dto.getMempw())) {
			
            model.addAttribute("msg", "이전 비밀번호와 다르게 설정하세요.");
            model.addAttribute("url", "PWchangeform.do");
            return "member/pagealert";
            
		}else {
			if(passwordEncoder.matches(beforemempw, dto.getMempw())) {
				int res = 0;
				
				dto.setMempw(passwordEncoder.encode(newmempw));
				
				res = biz.pwchange(dto);
				if(res>0) {
					System.out.println("==================");
					System.out.println(dto.getMempw());
					session.setAttribute("login", dto);
					return "redirect:profilechangeform.do";
				}else {
					model.addAttribute("msg", "db오류 : 운영자에게 문의하십시오");
		            model.addAttribute("url", "PWchangeform.do");
		            return "member/pagealert";
				}
				
			}else {
				model.addAttribute("msg", "현재 비밀번호를 잘 못 입력하셨습니다.");
	            model.addAttribute("url", "PWchangeform.do");
	            return "member/pagealert";
			}
		}
		

	}
	
	@RequestMapping("/deleteuserform.do")
	public String deleteuserForm() {
		logger.info("[deleteuserForm]");
		
		return "member/deleteuser";
	}
	
	@RequestMapping("/deleteuser.do")
	public String deleteUser(Model model, HttpSession session, String mempw) {
		
		int res = 0;
		MemberDto dto = (MemberDto)session.getAttribute("login");
		String logintype = (String)session.getAttribute("logintype");
		
		if(logintype.equals("normal")) {
			if(passwordEncoder.matches(mempw, dto.getMempw())) {
				res = biz.deleteUser(dto.getMemid());
				if(res==1) {
					session.invalidate();
					return "redirect:home.do";
				}else {
					return "member/deleteuser";
				}
			} else {
				model.addAttribute("missmatch", "비밀번호가 틀립니다.");
				return "member/deleteuser";
			}
		} else {
			res = biz.deleteUser(dto.getMemid());
			if(res==1) {
				session.invalidate();
				return "redirect:home.do";
			}else {
				return "member/deleteuser";
			}
		} 
	}
	
	@RequestMapping("/CheckMail.do") // AJAX와 URL을 매핑시켜줌 
	@ResponseBody 
	public Map<String, String> SendMail(String mail) {
			Random random=new Random();  //난수 생성을 위한 랜덤 클래스
			String key="";  //인증번호 

			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(mail); //스크립트에서 보낸 메일을 받을 사용자 이메일 주소 
			//입력 키를 위한 코드
			for(int i =0; i<3;i++) {
				int index=random.nextInt(25)+65; //A~Z까지 랜덤 알파벳 생성
				key+=(char)index;
			}
			int numIndex=random.nextInt(9999)+1000; //4자리 랜덤 정수를 생성
			key+=numIndex;
			message.setSubject("Carming 회원가입을 위한 인증번호 안내메일입니다.");
			message.setText("인증 번호 : "+key);
			mailSender.send(message);
			
			Map<String, String> map = new HashMap<String,String>();
			map.put("cumkey",key);
			
			return map;
	}
	 
	

}
