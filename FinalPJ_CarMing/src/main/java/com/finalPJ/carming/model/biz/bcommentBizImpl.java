package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.bcommentDao;
import com.finalPJ.carming.model.dto.bcommentDto;

@Service
public class bcommentBizImpl implements bcommentBiz {

	@Autowired
	private bcommentDao dao;
	
	//01. 댓글 목록
	@Override
	public List<bcommentDto> selectList() {
		return dao.selectList();
	}
	
	//02. 댓글 추가
	@Override
	public int insert(bcommentDto dto) {
		return dao.insert(dto);
	}

	//03. 댓글 삭제
	@Override
	public int delete(int comno) {
		return dao.delete(comno);
	}

	
	
}
