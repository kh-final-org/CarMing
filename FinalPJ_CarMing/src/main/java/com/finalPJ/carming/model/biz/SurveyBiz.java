package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.SurveyDto;

public interface SurveyBiz {
	// 전체 선택 (전체 말고 여러개 가져와서 거기서 고르게??) 
	public List<SurveyDto> selectList();
	// 하나 선택
	public SurveyDto selectOne(int memno);
	// 본인(세션) 것 등록 / + 수정
	public int insert(SurveyDto dto);
	
	// [동성] 설문조사 후 친구 리스트 가져오기.
	public List<SurveyDto> sameFriendList(SurveyDto dto); 
	
	public int FriendOne(SurveyDto dto); 
	
}
