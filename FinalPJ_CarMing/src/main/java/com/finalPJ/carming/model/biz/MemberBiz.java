package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.MemberDto;

public interface MemberBiz {
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	public MemberDto selectOne(String id);
	// 챗봇에서 사용하는 것입니다! 
	public MemberDto selectNo(int memno);
	public int update(MemberDto dto);
	public int deleteUser(String memid);
	public int pwchange(MemberDto dto);
	
	//암호화 다시 추가 시 삭제
	public int countuser(); 
	public List<MemberDto> selectAll();
}
