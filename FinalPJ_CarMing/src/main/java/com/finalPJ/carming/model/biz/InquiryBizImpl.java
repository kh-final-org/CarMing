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
	
	/* 페이징 처리를 위한 select list */
	@Override
	public List<InquiryDto> list() {
		return list("",1);
	}
	
	@Override
	public List<InquiryDto> list(int page) {
		return list("",page);
	}
	
	@Override
	public List<InquiryDto> list(String search, int page) {
		return dao.list(search,page);
	}
	
	/* 현재 페이지 구하기 위함 */

	@Override
	public int getlistCount() {
		return dao.getlistCount("");
	}

	@Override
	public int getlistCount(String search) {
		return dao.getlistCount(search);
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

	@Override
	public int deleteInquiry(int inquiryNo) {
		return dao.deleteInquiry(inquiryNo);
	}

	@Override
	public int chatbotinsert(InquiryDto dto) {
		return dao.chatbotinsert(dto);
	}


}
