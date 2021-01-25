package com.finalPJ.carming.model.dao;

import java.util.ArrayList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.AdmMemberDto;
import com.finalPJ.carming.model.dto.AdmRentDto;
import com.finalPJ.carming.model.dto.InquiryDto;




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

	@Override
	public List<AdmRentDto> RentList() {
		List<AdmRentDto> list = new ArrayList<AdmRentDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectRent");
		} catch (Exception e) {
			System.out.println("[error]:selectRent");
			e.printStackTrace();
		}
		
	return list;
	}

	@Override
	public AdmRentDto selectOneRent(int cartNo) {
		AdmRentDto list = null;
		
		try {
			list = sqlSession.selectOne(NAMESPACE+"selectOneRent", cartNo);
		} catch (Exception e) {
			System.out.println("[error]: select one");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int returnRent(int cartNo) {
		int res = 0;
		 try {
			res = sqlSession.insert(NAMESPACE+"returnRent", cartNo);
			
		} catch (Exception e) {
			System.out.println("[error]: returnRent");
			e.printStackTrace();
		}
		 
		return res;
	}
	


}
