package com.finalPJ.carming;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.RentReviewBiz;
import com.finalPJ.carming.model.dto.ProductDto;
import com.finalPJ.carming.model.dto.RentReviewDto;

@Controller
public class RentReivewController {
	
	private static final Logger logger = LoggerFactory.getLogger(RentReivewController.class);
	
	@Autowired
	private RentReviewBiz biz;
	
	private RentReviewDto rdto;
	
	@RequestMapping(value = "/insertreview.do")
	public void insertreview(Model model, HttpServletRequest request, HttpServletResponse response, RentReviewDto rdto) throws IOException {
		logger.info("[REVIEW INSERT]");
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int reviewStar = Integer.parseInt(request.getParameter("reviewStar"));
		System.out.println("상품 번호: "+pNo);
		System.out.println("별 개수: "+reviewStar);
		System.out.println("reviewWrite: "+rdto.getreviewWriter());
		rdto.setpNo(pNo);
		rdto.setreviewStar(reviewStar);
		
		int insertRes = biz.insertReview(rdto);
		System.out.println();
		//인코딩 설정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(insertRes > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"confirm('리뷰를 등록하시겠습니까?');"
					+"location.href='productdetail.do?pNo="
					+pNo
					+"'"
					+ "</script>");
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"alert('리뷰 등록에 실패하였습니다.');"
					+"location.href='productdetail.do?pNo="
					+pNo
					+"'"
					+ "</script>");
			out.flush();
		}
	}
	
	@RequestMapping(value="/deletereview.do")
	public void deletereview(HttpServletRequest request, HttpServletResponse response, int reviewNo, RentReviewDto rdto) throws IOException {
		logger.info("[REVIEW DELETE");
		
		int deleteres = biz.deleteReview(reviewNo);
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		//인코딩 설정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if(deleteres > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"alert('선택하신 리뷰가 삭제되었습니다.');"
					+"location.href='productdetail.do?pNo="
					+pNo
					+"'"
					+ "</script>");
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"alert('리뷰 삭제에 실패하였습니다.');"
					+"location.href='productdetail.do?pNo="
					+pNo
					+"'"
					+ "</script>");
			out.flush();
		}
	}
	
}
