package com.finalPJ.carming.model.dao;


import java.util.List;

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

	@Override
	public MemberDto selectOne(String id) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOne", id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("[error] : Member/SelectOne");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public MemberDto selectNo(int memno) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectNo", memno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("[error] : Member/SelectNo");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("[error] : Member/update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteUser(String memid) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"deleteUser", memid);
		} catch (Exception e) {
			System.out.println("[error] : Member/deleteUser");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int pwchange(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"pwchange", dto);
		} catch (Exception e) {
			System.out.println("[error] : Member/pwchange");
			e.printStackTrace();
		}
		return res;
	}
	
	//암호화 다시 추가시 삭제
	@Override
	public int countuser() {
		// TODO Auto-generated method stub
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"countuser");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("[error] : Member/countuser");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<MemberDto> selectAll() {
		List<MemberDto> res = null;
		
		try {
			res = sqlSession.selectList(NAMESPACE+"selectAll");
		} catch (Exception e) {
			System.out.println("[error] : Member/selectAll");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int Nickdupltest(String nick) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"nickdupl", nick);
		} catch (Exception e) {
			System.out.println("[error] : Member/Nickdupltest");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int Maildupltest(String mail) {
int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"maildupl", mail);
		} catch (Exception e) {
			System.out.println("[error] : Member/Maildupltest");
			e.printStackTrace();
		}
		return res;
	}
}
