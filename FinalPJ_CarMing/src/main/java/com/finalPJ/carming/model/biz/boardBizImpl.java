package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.boardDao;
import com.finalPJ.carming.model.dto.boardDto;

@Service
public class boardBizImpl implements boardBiz{

	@Autowired
	private boardDao dao;
	
	//01. 게시글 전체 목록
	@Override
	public List<boardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public boardDto selectOne(int brdno) {
		return dao.selectOne(brdno);
	}

	@Override
	public int insert(boardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(boardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int brdno) {
		return dao.delete(brdno);
	}

	@Override
	public void viewCount(int brdno) {
	}

}
