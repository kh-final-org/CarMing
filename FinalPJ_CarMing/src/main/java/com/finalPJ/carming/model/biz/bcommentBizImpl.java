package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.bcommentDao;
import com.finalPJ.carming.model.dto.bcommentDto;

@Service
public class bcommentBizImpl implements bcommentBiz {

	@Autowired
	private bcommentDao dao;
	
	//01. 댓글 목록
	@Override
	public List<bcommentDto> selectList(int brdno) {
		return dao.selectList(brdno);
	}
	
	//02. 댓글 추가
	@Override
	public int insert(bcommentDto dto) {
		return dao.insert(dto);
	}

	//03. 댓글 삭제
	@Transactional
	@Override
	public int delete(int comno) {
		dao.delete(comno);
		return dao.deleteRep(comno);
	}

	//04. 댓글 전체 갯수
	@Override
	public int countComment(bcommentDto dto) {
		return dao.countComment(dto);
	}

	
	
}





