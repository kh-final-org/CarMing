package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.InquiryDto;

public interface InquiryDao {
	
	String NAMESPACE = "inquiry.";
	
	
	public InquiryDto selectOne(int inquiryNo);
	public int insert(InquiryDto dto);
	public int deleteInquiry(int inquiryNo);
	
	
	/* 검색, 페이징을 포함한 member select */
	public List<InquiryDto> list(String search, int page);
	public int getlistCount(String search);

}
