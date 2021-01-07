package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.BoardDto;

public interface BoardDao {
	
	String NAMESPACE = "board.";
	
	public List<BoardDto> selectList();
	public BoardDto selectOne(int brdno);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int brdno);
	

}
