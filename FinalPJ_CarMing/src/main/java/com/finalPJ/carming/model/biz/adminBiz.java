package com.finalPJ.carming.model.biz;

import java.util.ArrayList;

import java.util.List;

import com.finalPJ.carming.model.dto.AdmMemberDto;



public interface adminBiz {
	public List<AdmMemberDto> list();
	public int insertList(ArrayList<AdmMemberDto> list);
	public AdmMemberDto selectOne(int memNo);
	public int insert(AdmMemberDto dto);
	public int delete(int memNo);
}
