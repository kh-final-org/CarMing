package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.SurveyDao;
import com.finalPJ.carming.model.dto.SurveyDto;

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
	public List<SurveyDto> sameFriendList(SurveyDto dto) {

		return dao.sameFriendList(dto);
	}

	@Override
	public int FriendOne(SurveyDto dto) {

		return dao.FriendOne(dto);
	}
	
}
