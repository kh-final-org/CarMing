package com.finalPJ.carming.model.biz;

import java.util.List;

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
	public MemberDto selectNo(int memno) {
		
		return dao.selectNo(memno);
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

	@Override
	public int pwchange(MemberDto dto) {
		// TODO Auto-generated method stub
		return dao.pwchange(dto);
	}

	
	//암호화 다시 추가시 삭제
	@Override
	public int countuser() {
		// TODO Auto-generated method stub
		return dao.countuser();
	}

	@Override
	public List<MemberDto> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public int Nickdupltest(String nick) {
		// TODO Auto-generated method stub
		return dao.Nickdupltest(nick);
	}

	@Override
	public int Maildupltest(String mail) {
		// TODO Auto-generated method stub
		return dao.Maildupltest(mail);
	}
	
	

	
}