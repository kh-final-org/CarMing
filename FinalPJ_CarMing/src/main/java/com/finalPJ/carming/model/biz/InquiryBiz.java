package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import com.finalPJ.carming.model.dto.InquiryDto;



public interface InquiryBiz {
	
	public int insertList(ArrayList<InquiryDto> list);
	public InquiryDto selectOne(int inquiryNo);
	public int insert(InquiryDto dto);
	public int deleteInquiry(int inquiryNo);
	
//	페이징 리스트	
	public List<InquiryDto> list();
	public List<InquiryDto> list(int page);
	public List<InquiryDto> list(String search, int page);
//	페이징 카운트	
	public int getlistCount();
	public int getlistCount(String search);
	
	// 챗봇 문의하기 insert
	public int chatbotinsert(InquiryDto dto);
}
