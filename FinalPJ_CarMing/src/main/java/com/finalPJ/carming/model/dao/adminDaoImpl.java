package com.finalPJ.carming.model.dao;

import java.util.ArrayList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.AdmMemberDto;




@Repository
public class adminDaoImpl implements adminDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AdmMemberDto> list() {
		List<AdmMemberDto> list = new ArrayList<AdmMemberDto>();
		
			try {
				list = sqlSession.selectList(NAMESPACE+"select");
			} catch (Exception e) {
				System.out.println("[error]:select");
				e.printStackTrace();
			}
			
		return list;
	}

	@Override
	public AdmMemberDto selectOne(int memNo) {
		AdmMemberDto list = null;
		
		try {
			list = sqlSession.selectOne(NAMESPACE+"selectOne", memNo);
		} catch (Exception e) {
			System.out.println("[error]: select one");
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	@Override
	public int insert(AdmMemberDto dto) {
		int res = 0;
		 try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
			
		} catch (Exception e) {
			System.out.println("[error]: insert");
			System.out.println(dto.toString());
			e.printStackTrace();
		}
		 
		return res;
	}

	@Override
	public int delete(int memNo) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"delete",memNo);
		} catch (Exception e) {
			System.out.println("[error]: delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteList(int memNo) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"deleteReport",memNo);
		} catch (Exception e) {
			System.out.println("[error]: delete report");
			e.printStackTrace();
		}
		
		return res;
	}
	


}
