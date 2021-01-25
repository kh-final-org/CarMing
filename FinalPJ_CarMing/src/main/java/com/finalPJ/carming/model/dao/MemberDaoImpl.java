package com.finalPJ.carming.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberDto login(MemberDto dto) {
				MemberDto res = null;
				System.out.println(dto.getMemid());
				System.out.println(dto.getMempw());
				
				try {
					res = sqlSession.selectOne(NAMESPACE+"login",dto);
				} catch (Exception e) {
					System.out.println("[error] : login");
					e.printStackTrace();
				}
				return res;
	}

	@Override
	public int insert(MemberDto dto) {
		int res = 0;
		
		try {
			//암호화 하게 되면 아이디로 검색해서 서비스 단에서 복호화된 암호랑 비교
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : register");
			e.printStackTrace();
		}
		return res;
	}
	
}
