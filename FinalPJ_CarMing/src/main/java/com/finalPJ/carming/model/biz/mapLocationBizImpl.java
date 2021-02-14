package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.mapLocationDao;
import com.finalPJ.carming.model.dto.mapLocationDto;

@Service
public class mapLocationBizImpl implements mapLocationBiz{
	
	@Autowired
	private mapLocationDao dao;
	
	//01. 게시글 추가 목록
	@Override
	public List<mapLocationDto> selectList(int brdno) {
		return dao.selectList(brdno);
	}

	//02. 게시글 추가
	@Override
	public int insert(mapLocationDto dto) {
		return dao.insert(dto);
	}
	
	
	//ex. 차박명소 조회
	@Override
	public List<mapLocationDto> locationlistCampl(int memno) {
		// TODO Auto-generated method stub
		return dao.locationlistCampl(memno);
	}

	@Override
	public List<mapLocationDto> locationlistMy(int memno) {
		// TODO Auto-generated method stub
		return dao.locationlistMy(memno);
	}

}
