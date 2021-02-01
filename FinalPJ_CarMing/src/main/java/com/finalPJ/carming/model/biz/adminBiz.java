package com.finalPJ.carming.model.biz;

import java.util.ArrayList;

import java.util.List;

import com.finalPJ.carming.model.dto.AdmMemberDto;
import com.finalPJ.carming.model.dto.AdmRentDto;



public interface adminBiz {
	public List<AdmMemberDto> list();
	public int insertList(ArrayList<AdmMemberDto> list);
	public AdmMemberDto selectOne(int memNo);
	public int delete(int memNo);
	public List<AdmRentDto> RentList();
	public AdmRentDto selectOneRent(int cartNo);
	public int returnRent(int cartNo);
}
