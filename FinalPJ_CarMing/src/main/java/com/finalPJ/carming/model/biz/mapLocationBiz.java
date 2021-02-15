package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.mapLocationDto;

public interface mapLocationBiz {

	//01. 게시글 추가 목록
	public List<mapLocationDto> selectList(int brdno);
	//02. 게시글 추가
	public int insert(mapLocationDto dto);
	
	
	
	
	//ex.차박 명소용 값 조회
	public List<mapLocationDto> locationlistCampl(int memno);
	public List<mapLocationDto> locationlistMy(int memno);

	
}
