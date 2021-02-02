package com.finalPJ.carming.model.dao;


import com.finalPJ.carming.model.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	public MemberDto selectOne(String id);
	public int update(MemberDto dto);
	public int deleteUser(String memid);
}
