package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.finalPJ.carming.model.dto.SurveyDto;

public interface SurveyDao {
	
	String NAMESPACE = "survey.";
	
	public List<SurveyDto> selectList();
	public SurveyDto selectOne(int memno);
	public int insert(SurveyDto dto);
	public List<SurveyDto> sameFriendList(SurveyDto dto);
	public int FriendOne(SurveyDto dto);
	
	
	
}














