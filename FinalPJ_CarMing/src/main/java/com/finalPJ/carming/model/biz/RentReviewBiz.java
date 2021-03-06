package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.RentReviewDto;

public interface RentReviewBiz {
	public List<RentReviewDto> selectList();
	public List<RentReviewDto> selectList(int pNo);
	public int insertReview(RentReviewDto dto);
	public int deleteReview(int reviewNo);
	public int countReview(RentReviewDto dto);
	public int countReview(int pNo);
}	
