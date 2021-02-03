package com.finalPJ.carming.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.MemberDao;
import com.finalPJ.carming.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {
	
	@Autowired
	private MemberDao dao;
	


	@Override
	public MemberDto login(MemberDto dto) {
		
		
		return dao.login(dto);
		
		
	}
	
	@Transactional
	@Override
	public int insert(MemberDto dto) {
		
		return dao.insert(dto);
	}

	@Override
	public MemberDto selectOne(String id) {
		
		
		return dao.selectOne(id);
	}

	@Override
	public int update(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int deleteUser(String memid) {
		// TODO Auto-generated method stub
		return dao.deleteUser(memid);
	}
	
	


}