package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.PCategoryDao;
import com.finalPJ.carming.model.dto.PCategoryDto;



@Service
public class PCategoryBIzImpl implements PCategoryBiz{
	
	@Autowired
	private PCategoryDao dao;

	@Override
	public List<PCategoryDto> selectList() {
		return dao.selectList();
	}

	@Override
	public PCategoryDto selectOne(int pNo) {
		return dao.selectOne(pNo);
	}

}
