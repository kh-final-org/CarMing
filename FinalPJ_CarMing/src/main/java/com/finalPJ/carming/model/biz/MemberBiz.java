package com.finalPJ.carming.model.biz;

import com.finalPJ.carming.model.dto.MemberDto;

public interface MemberBiz {
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	public MemberDto selectOne(String id);
	public int update(MemberDto dto);
	public int deleteUser(String memid);
	public int pwchange(MemberDto dto);
}
