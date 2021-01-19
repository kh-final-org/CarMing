package com.finalPJ.carming.survey.dao;

import java.util.List;

import com.finalPJ.carming.survey.dto.SurveyDto;

public interface SurveyDao {
	
	String NAMESPACE = "survey.";
	
	public List<SurveyDto> selectList();
	public SurveyDto selectOne(int memno);
	public int insert(SurveyDto dto);
	public SurveyDto update(SurveyDto dto);
}
