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
	public void insertreview(HttpServletRequest request, HttpServletResponse response, RentReviewDto rdto) throws IOException {
		logger.info("[REVIEW INSERT]");
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int reviewStar = Integer.parseInt(request.getParameter("reviewStar"));
		System.out.println("상품 번호: "+pNo);
		System.out.println("별 개수: "+reviewStar);
		System.out.println("reviewWrite: "+rdto.getReviewWriter());
		rdto.setpNo(pNo);
		rdto.setReviewStar(reviewStar);
		
		int insertRes = biz.insertReview(rdto);
		
		if(insertRes > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"alert('리뷰가 등록되었습니다.');"
					+"location.href='productdetail.do?pNo='"
					+rdto.getpNo()
					+ "</script>");
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"alert('리뷰 등록에 실패하였습니다.');"
					+"location.href='productdetail.do?pNo='"
					+rdto.getpNo()
					+ "</script>");
			out.flush();
		}
	}
	
	@RequestMapping(value="/deletereview.do")
	public void deletereview(HttpServletRequest request, HttpServletResponse response, int reviewNo, RentReviewDto rdto) throws IOException {
		logger.info("[REVIEW DELETE");
		
		int deleteres = biz.deleteReview(reviewNo);

		if(deleteres > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"alert('해당 리뷰글이 삭제되었습니다.');"
					+"location.href='productdetail.do?pNo='"
					+rdto.getpNo()
					+ "</script>");
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>"
					+"alert('리뷰삭제에 실패하였습니다.');"
					+"location.href='productdetail.do?pNo='"
					+rdto.getpNo()
					+ "</script>");
			out.flush();
		}
	}
	
}
