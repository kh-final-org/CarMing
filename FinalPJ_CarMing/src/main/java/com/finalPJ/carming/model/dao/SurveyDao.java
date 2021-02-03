package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.SurveyDto;

public interface SurveyDao {
	
	String NAMESPACE = "survey.";
	
	public List<SurveyDto> selectList();
	public SurveyDto selectOne(int memno);
	public int insert(SurveyDto dto);
	public List<SurveyDto> sameFriendList(SurveyDto dto);

	public int sameFreindOne(SurveyDto dto);
	
	
	
}
