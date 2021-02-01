package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.adminDao;
import com.finalPJ.carming.model.dto.AdmMemberDto;
import com.finalPJ.carming.model.dto.AdmRentDto;

@Service
public class adminBizImpl implements adminBiz{
	
	@Autowired
	private adminDao dao;

	@Override
	public int insertList(ArrayList<AdmMemberDto> list) {
		return 0;
	}

	@Override
	public AdmMemberDto selectOne(int inquiryNo) {
		return null;
	}

	
	@Transactional
	@Override
	public int delete(int memNo) {
		return dao.delete(memNo);
	}

	@Override
	public List<AdmRentDto> RentList() {
		return dao.RentList();
	}

	@Override
	public AdmRentDto selectOneRent(int cartNo) {
		return dao.selectOneRent(cartNo);
	}

	@Override
	public int returnRent(int cartNo) {
		return dao.returnRent(cartNo);
	}
	
	/* 페이징 처리를 위한 select member list */
	@Override
	public List<AdmMemberDto> getMemList() { 
		return getMemList("", 1);
	}

	@Override
	public List<AdmMemberDto> getMemList(int page) {
		return getMemList("", page);
	}

	@Override
	public List<AdmMemberDto> getMemList(String search, int page) {
		return dao.getMemList(search, page);
	}
	
	/* 현재 페이지 구하기 위함 */
	@Override
	public int getMemCount() {
		return dao.getMemCount(""); 
	}

	@Override
	public int getMemCount(String search) {
		return dao.getMemCount(search);
	}
}
