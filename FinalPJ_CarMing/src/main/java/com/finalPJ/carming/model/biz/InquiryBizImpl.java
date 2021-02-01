package com.finalPJ.carming.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.InquiryDao;
import com.finalPJ.carming.model.dto.InquiryDto;





@Service
public class InquiryBizImpl implements InquiryBiz{
	
	@Autowired
	private InquiryDao dao;
	
	
	@Override
	public List<InquiryDto> list() {
		return dao.list();
	}

	@Override
	public int insertList(ArrayList<InquiryDto> list) {
		return 0;
	}

	@Override
	public InquiryDto selectOne(int inquiryNo) {
		return dao.selectOne(inquiryNo);
	}

	@Override
	public int insert(InquiryDto dto) {
		return dao.insert(dto);
	}

}
