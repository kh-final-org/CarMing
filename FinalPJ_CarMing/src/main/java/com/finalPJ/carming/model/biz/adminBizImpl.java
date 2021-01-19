package com.finalPJ.carming.model.biz;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.adminDao;
import com.finalPJ.carming.model.dto.AdmMemberDto;






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

	@Override
	public int insert(AdmMemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Transactional
	@Override
	public int delete(int memNo) {
		return dao.delete(memNo);
	}
	

}
