package com.finalPJ.carming.model.dao;

import java.util.List;


import com.finalPJ.carming.model.dto.ReportDto;

public interface ReportDao {
	
	String NAMESPACE = "report.";
	
	public List<ReportDto> list();
	public ReportDto selectOne(int reportNo);
	public int insert(ReportDto dto);
	public int delete(int reportNo);
	public ReportDto selectOneCom(int reportNo);
	public ReportDto selectOneMem(int reportNo);

}
