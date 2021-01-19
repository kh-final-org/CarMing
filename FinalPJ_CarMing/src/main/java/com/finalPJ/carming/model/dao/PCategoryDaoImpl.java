package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.PCategoryDto;

@Repository
public class PCategoryDaoImpl implements PCategoryDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<PCategoryDto> selectList() {
		List<PCategoryDto> list = new ArrayList<PCategoryDto>(); 
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[ERROR: PCategory SELECTLIST]");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public PCategoryDto selectOne(int pNo) {
		
		PCategoryDto pdto = new PCategoryDto();
		
		try {
			pdto = sqlSession.selectOne(NAMESPACE+"selectOne");
		} catch (Exception e) {
			System.out.println("[ERROR: PCATEGORY SELECTONE]");
			e.printStackTrace();
		}
		
		return pdto;
	}

}
