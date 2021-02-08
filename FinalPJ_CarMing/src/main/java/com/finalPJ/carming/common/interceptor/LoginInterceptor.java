package com.finalPJ.carming.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("[interceptor]: preHandle");
		
		//로그인이 필요없는 기능들을 조건에 추가바람
		if(		request.getRequestURI().contains("/loginform.do") ||
				request.getRequestURI().contains("/home.do") ||
				request.getRequestURI().contains("/boardmainform.do") ||
				request.getSession().getAttribute("login")!=null ||
				request.getRequestURI().contains("/registerform.do") ||
				request.getRequestURI().contains("/registerform2.do") ||
				request.getRequestURI().contains("/regist.do") ||

				request.getRequestURI().contains("/ajaxlogin.do") ||
				request.getRequestURI().contains("/maincamplace.do") ||
				request.getRequestURI().contains("/detailcamplace.do")){
			return true;
		}
		
		
		if(request.getSession().getAttribute("login") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 이후 사용하실 수 있습니다.'); location.href='loginform.do'; </script>");
			out.flush();
		}
	
		return false;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.info("[interceptor]: postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("[interceptor]: afterCompletion");
	}
	
}
