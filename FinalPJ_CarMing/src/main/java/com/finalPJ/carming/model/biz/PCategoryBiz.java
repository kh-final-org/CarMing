package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.PCategoryDto;

public interface PCategoryBiz {
	public List<PCategoryDto> selectList();
	public PCategoryDto selectOne(int pNo);
}
