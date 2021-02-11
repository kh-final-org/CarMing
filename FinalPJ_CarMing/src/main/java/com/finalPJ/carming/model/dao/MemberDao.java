package com.finalPJ.carming.model.dao;


import java.util.List;

import com.finalPJ.carming.model.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	public MemberDto selectOne(String id);
	public MemberDto selectNo(int memno);
	public int update(MemberDto dto);
	public int deleteUser(String memid);
	public int pwchange(MemberDto dto);
	//암호화 다시 추가시 삭제
	public int countuser();
	public List<MemberDto> selectAll();
}
