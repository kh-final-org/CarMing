package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.PCategoryDto;

public interface PCategoryDao {
	String NAMESPACE = "pcategory.";
	public List<PCategoryDto> selectList();
	public PCategoryDto selectOne(int pNo);
}
