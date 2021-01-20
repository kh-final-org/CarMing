package com.finalPJ.carming.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.MemberDao;
import com.finalPJ.carming.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {
	
	@Autowired
	private MemberDao dao;
	
	/*
	@Autowired
	BCrpytPasswordEncoder passwordEncoder;
	*/

	@Override
	public MemberDto login(MemberDto dto) {
		/*System.out.println("암호화 전 : "+dto.getMempw());
		System.out.println("암호화 후 : "+res.getMempw());
		if(passwordEncoder.matches(dto.getMempw(), res.getMempw())) {

		}*/ 
		return dao.login(dto);
	}
	
	@Transactional
	@Override
	public int insert(MemberDto dto) {
		/*System.out.println(dto.getMempw());
		dto.setMemberpw(passwordEncoder.encode(dto.getMemberpw()));
		System.out.println(dto.getMempw());*/
		return dao.insert(dto);
	}

}
