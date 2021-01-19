package com.finalPJ.carming.survey.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.survey.dao.SurveyDao;
import com.finalPJ.carming.survey.dto.SurveyDto;

@Service
public class SurveyBizImpl implements SurveyBiz {

	@Autowired
	private SurveyDao dao;
	
	@Override
	public List<SurveyDto> selectList() {
		
		return dao.selectList();
	}

	@Override
	public SurveyDto selectOne(int memno) {

		return dao.selectOne(memno);
	}

	@Override
	public int insert(SurveyDto dto) {

		return dao.insert(dto);
	}

	@Override
	public SurveyDto update(SurveyDto dto) {

		return dao.update(dto);
	}

	
}
