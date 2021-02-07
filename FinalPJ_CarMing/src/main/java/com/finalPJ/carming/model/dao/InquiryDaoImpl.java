package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.InquiryDto;



@Repository
public class InquiryDaoImpl implements InquiryDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<InquiryDto> list() {
		List<InquiryDto> list = new ArrayList<InquiryDto>();
		
			try {
				list = sqlSession.selectList(NAMESPACE+"select");
			} catch (Exception e) {
				System.out.println("[error]:select");
				e.printStackTrace();
			}
			
		return list;
	}

	@Override
	public InquiryDto selectOne(int inquiryNo) {
		InquiryDto list = null;
		
		try {
			list = sqlSession.selectOne(NAMESPACE+"selectOne", inquiryNo);
		} catch (Exception e) {
			System.out.println("[error]: select one");
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	@Override
	public int insert(InquiryDto dto) {
		int res = 0;
		 try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
			
		} catch (Exception e) {
			System.out.println("[error]: insert");
			System.out.println(dto.toString());
			e.printStackTrace();
		}
		 
		return res;
	}

	@Override
	public int deleteInquiry(int inquiryNo) {
		int res = 0;
		 
		try {
			res = sqlSession.delete(NAMESPACE+"delete",inquiryNo);
		} catch (Exception e) {
			System.out.println("[error]: delete");
			e.printStackTrace();
		}
		return res;
	}
	


}
