package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.mapLocationDto;

public interface mapLocationDao {

	String NAMESPACE="mapLocation.";
	
	//01. 게시글 추가 목록
	public List<mapLocationDto> selectList(int brdno);
	//02. 게시글 추가
	public int insert(mapLocationDto dto);
	
	
	
	//ex. 차박명소조회
	public List<mapLocationDto> locationlist(int memno);

	
	
	
	
}
