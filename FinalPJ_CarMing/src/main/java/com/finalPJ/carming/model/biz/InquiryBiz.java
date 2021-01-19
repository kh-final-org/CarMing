package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import com.finalPJ.carming.model.dto.InquiryDto;



public interface InquiryBiz {
	public List<InquiryDto> list();
	public int insertList(ArrayList<InquiryDto> list);
	public InquiryDto selectOne(int inquiryNo);
	public int insert(InquiryDto dto);
}
