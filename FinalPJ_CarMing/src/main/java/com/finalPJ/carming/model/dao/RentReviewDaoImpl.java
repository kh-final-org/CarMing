package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.RentReviewDto;

@Repository
public class RentReviewDaoImpl implements RentReviewDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<RentReviewDto> selectList() {
		
		List<RentReviewDto> list = new ArrayList<RentReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[ERROR: REVIEW SELECTLIST]");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insertReivew(RentReviewDto dto) {
		
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE+"insertreview", dto);
		} catch (Exception e) {
			System.out.println("[ERROR: REVIEW INSERT]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteReview(int reviewNo) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deletereview", reviewNo);
		} catch (Exception e) {
			System.out.println("[ERROR: DELETE REVIEW]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countReview(RentReviewDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countreview");
		} catch (Exception e) {
			System.out.println("[ERROR: REVIEW COUNT]");
			e.printStackTrace();
		}
		
		return res;
	}
	
}
