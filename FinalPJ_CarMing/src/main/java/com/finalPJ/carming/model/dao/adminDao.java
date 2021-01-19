package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.AdmMemberDto;




public interface adminDao {
	
	String NAMESPACE = "admin.";
	
	public List<AdmMemberDto> list();
	public AdmMemberDto selectOne(int memNo);
	public int insert(AdmMemberDto dto);
	public int delete(int memNo);
	public int deleteList(int memNo);

}
