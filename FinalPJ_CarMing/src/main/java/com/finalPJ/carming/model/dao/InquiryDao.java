package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.InquiryDto;

public interface InquiryDao {
	
	String NAMESPACE = "inquiry.";
	
	public List<InquiryDto> list();
	public InquiryDto selectOne(int inquiryNo);
	public int insert(InquiryDto dto);
	public int deleteInquiry(int inquiryNo);

}
