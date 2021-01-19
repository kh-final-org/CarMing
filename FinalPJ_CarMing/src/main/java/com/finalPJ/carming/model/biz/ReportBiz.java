package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import com.finalPJ.carming.model.dto.InquiryDto;
import com.finalPJ.carming.model.dto.ReportDto;



public interface ReportBiz {
	public List<ReportDto> list();
	public int insertList(ArrayList<ReportDto> list);
	public ReportDto selectOne(int reportNo);
	public int insert(ReportDto dto);
}
