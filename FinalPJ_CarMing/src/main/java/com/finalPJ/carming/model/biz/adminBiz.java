package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import com.finalPJ.carming.model.dto.AdmMemberDto;
import com.finalPJ.carming.model.dto.AdmRentDto;


public interface adminBiz {
	public int delete(int memNo);
	public AdmRentDto selectOneRent(int cartNo);
	public int returnRent(int cartNo);
	public int sendRent(int cartNo);
	public int deleteRent(int cartNo);

	
	/* member select */
	public List<AdmMemberDto> getMemList();
	public List<AdmMemberDto> getMemList(int page);
	public List<AdmMemberDto> getMemList(String search, int page); 
	
	/* member count */
	public int getMemCount();
	public int getMemCount(String search);
	
	/* member select */
	public List<AdmRentDto> RentList();
	public List<AdmRentDto> RentList(int page);
	public List<AdmRentDto> RentList(String search, int page);
	
	/* member count */
	public int rentListCnt();
	public int rentListCnt(String search);
	

}
