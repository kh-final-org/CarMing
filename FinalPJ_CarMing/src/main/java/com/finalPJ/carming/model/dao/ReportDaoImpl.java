package com.finalPJ.carming.model.dao;

import java.util.ArrayList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.ReportDto;



@Repository
public class ReportDaoImpl implements ReportDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReportDto> list() {
		List<ReportDto> list = new ArrayList<ReportDto>();
		
			try {
				list = sqlSession.selectList(NAMESPACE+"select");
			} catch (Exception e) {
				System.out.println("[error]:select");
				e.printStackTrace();
			}
			
		return list;
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
	


}
