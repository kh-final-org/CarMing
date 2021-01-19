package com.finalPJ.carming.survey.biz;

import java.util.List;

import com.finalPJ.carming.survey.dto.SurveyDto;

public interface SurveyBiz {
	// 전체 선택 (전체 말고 여러개 가져와서 거기서 고르게??) 
	public List<SurveyDto> selectList();
	// 하나 선택
	public SurveyDto selectOne(int memno);
	// 본인(세션) 것 등록
	public int insert(SurveyDto dto);
	// 본인(세션) 것 수정
	public SurveyDto update(SurveyDto dto);
}
