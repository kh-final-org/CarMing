package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.finalPJ.carming.model.dao.ReportDao;
import com.finalPJ.carming.model.dto.ReportDto;






@Service
public class ReportBizImpl implements ReportBiz{
	
	@Autowired
	private ReportDao dao;

	/* 페이징 처리를 위한 select list */
	@Override
	public List<ReportDto> list() {
		return list("",1);
	}

	
	@Override
	public List<ReportDto> list(int page) {
		return list("",page);
	}

	@Override
	public List<ReportDto> list(String search, int page) {
		return dao.list(search,page);
	}

	/* 현재 페이지 구하기 위함 */
	@Override
	public int listCnt() {
		// TODO Auto-generated method stub
		return dao.listCnt("");
	}

	@Override
	public int listCnt(String search) {
		// TODO Auto-generated method stub
		return dao.listCnt(search);
	}
	
	
	@Override
	public int insertList(ArrayList<ReportDto> list) {
		return 0;
	}

	@Override
	public ReportDto selectOne(int reportNo) {
		return dao.selectOne(reportNo);
	}

	@Override
	public int insert(ReportDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int reportNo) {
		// TODO Auto-generated method stub
		return dao.delete(reportNo);
	}

	@Override
	public ReportDto selectOneCom(int reportNo) {
		// TODO Auto-generated method stub
		return dao.selectOneCom(reportNo);
	}

	@Override
	public ReportDto selectOneMem(int reportNo) {
		// TODO Auto-generated method stub
		return dao.selectOneMem(reportNo);
	}



}
