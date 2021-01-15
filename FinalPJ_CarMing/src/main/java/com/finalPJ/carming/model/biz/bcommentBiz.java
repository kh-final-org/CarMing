package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.bcommentDto;

public interface bcommentBiz {

	//01. 댓글 목록
	public List<bcommentDto> selectList();
	//02. 댓글 추가
	public int insert(bcommentDto dto);
	//03. 댓글 삭제
	public int delete(int comno);
		
}
