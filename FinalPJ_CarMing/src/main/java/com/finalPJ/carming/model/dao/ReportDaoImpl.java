package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.ReportDto;



@Repository
public class ReportDaoImpl implements ReportDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReportDto> list(String search, int page) {
		List<ReportDto> list = new ArrayList<ReportDto>();
		
		// 검색어, 페이지 맵에 저장
		Map<String,String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("page", Integer.toString(page));
		
			try {
				list = sqlSession.selectList(NAMESPACE+"select", map);
			} catch (Exception e) {
				System.out.println("[error]:select");
				e.printStackTrace();
			}
			
		return list;
	}
	


	@Override
	public int listCnt(String search) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectCnt",search);
		} catch (Exception e) {
			System.out.println("[error]:select Count");
			e.printStackTrace();
		}
				
		return res;
	}


	

	@Override
	public ReportDto selectOne(int reportNo) {
		ReportDto list = null;
		
		try {
			list = sqlSession.selectOne(NAMESPACE+"selectOne", reportNo);
		} catch (Exception e) {
			System.out.println("[error]: select one");
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	@Override
	public int insert(ReportDto dto) {
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
	public int delete(int reportNo) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"delete",reportNo);
		} catch (Exception e) {
			System.out.println("[error]: delete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ReportDto selectOneCom(int reportNo) {
ReportDto list = null;
		
		try {
			list = sqlSession.selectOne(NAMESPACE+"selectOneCom", reportNo);
		} catch (Exception e) {
			System.out.println("[error]: select oneCom");
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}

	@Override
	public ReportDto selectOneMem(int reportNo) {
ReportDto list = null;
		
		try {
			list = sqlSession.selectOne(NAMESPACE+"selectOneMem", reportNo);
		} catch (Exception e) {
			System.out.println("[error]: select oneMem");
			e.printStackTrace();
		}
		return list;
	}







}
