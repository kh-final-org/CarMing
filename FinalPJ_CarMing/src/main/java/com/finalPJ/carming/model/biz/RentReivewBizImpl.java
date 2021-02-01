package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.RentReviewDao;
import com.finalPJ.carming.model.dto.RentReviewDto;

@Service
public class RentReivewBizImpl implements RentReviewBiz{

	@Autowired
	private RentReviewDao dao;
	
	@Override
	public List<RentReviewDto> selectList() {
		return dao.selectList();
	}

	@Override
	public int insertReview(RentReviewDto dto) {
		return dao.insertReivew(dto);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}

	@Override
	public int countReview(RentReviewDto dto) {
		return dao.countReview(dto);
	}

}
