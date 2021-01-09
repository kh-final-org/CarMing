package com.finalPJ.carming.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.RecipeDto;


@Repository
public class InquiryDaoImpl implements RecipeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertURL(ArrayList<RecipeDto> list) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertList", list);
		} catch (Exception e) {
			System.out.println("[error]: insert");
			e.printStackTrace();
		}
		return res;
	}

}
