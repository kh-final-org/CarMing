package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.bcommentDto;

public interface bcommentDao {

	String NAMESPACE = "bcomment.";
	
	//01. 댓글 목록
	public List<bcommentDto> selectList(int brdno);
	//02. 댓글 추가
	public int insert(bcommentDto dto);
	//03. 댓글 삭제
	public int delete(int comno);
	//04. 댓글 전체 갯수
	public int countComment(bcommentDto dto);
	
	
}
