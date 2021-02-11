package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import com.finalPJ.carming.model.dto.InquiryDto;
import com.finalPJ.carming.model.dto.ReportDto;



public interface ReportBiz {
	
	public int insertList(ArrayList<ReportDto> list);
	public ReportDto selectOne(int reportNo);
	public int insert(ReportDto dto);
	public int delete(int reportNo);
	public ReportDto selectOneCom(int reportNo);
	public ReportDto selectOneMem(int reportNo);
//	페이징 리스트
	public List<ReportDto> list();
	public List<ReportDto> list(int page);
	public List<ReportDto> list(String search, int page);
//	페이징 카운트		
	public int listCnt ();
	public int listCnt (String search);
	
}
