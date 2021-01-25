package com.finalPJ.carming.model.biz;

import com.finalPJ.carming.model.dto.MemberDto;

public interface MemberBiz {
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
}
