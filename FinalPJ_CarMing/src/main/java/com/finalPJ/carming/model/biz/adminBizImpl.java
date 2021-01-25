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
	public List<AdmMemberDto> list() {
		return dao.list();
	}

	@Override
	public int insertList(ArrayList<AdmMemberDto> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdmMemberDto selectOne(int inquiryNo) {
		// TODO Auto-generated method stub
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
	

}
