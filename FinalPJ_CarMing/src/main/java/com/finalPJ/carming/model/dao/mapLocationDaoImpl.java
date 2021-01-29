package com.finalPJ.carming.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalPJ.carming.model.dto.mapLocationDto;

public class mapLocationDaoImpl implements mapLocationDao{

	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(mapLocationDto dto) {
		return 0;
	}

}
