package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.mapLocationDto;

@Repository
public class mapLocationDaoImpl implements mapLocationDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//01. 게시글 추가 목록
	@Override
	public List<mapLocationDto> selectList(int brdno) {
		List<mapLocationDto> list = new ArrayList<mapLocationDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", brdno);
		} catch (Exception e) {
			System.out.println("[error : mapLocation_selectList]");
			e.printStackTrace();
		}
		
		return null;
	}
	
	//02. 게시글 추가
	@Override
	public int insert(mapLocationDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error : mapLocation_insert]");
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
	//ex. 차박명소 조회
	@Override
	public List<mapLocationDto> locationlistCampl(int memno) {
		List<mapLocationDto> list = new ArrayList<mapLocationDto>();
		
		 try {
				 list = sqlSession.selectList(NAMESPACE+"locationlistcampl", memno);
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("[error : mapLocation_locationlist]");
			e.printStackTrace();
		}
		
		 System.out.println(list.isEmpty());
		 
		return list;
	}

	@Override
	public List<mapLocationDto> locationlistMy(int memno) {
		List<mapLocationDto> list = new ArrayList<mapLocationDto>();
		
		 try {
				 list = sqlSession.selectList(NAMESPACE+"locationlistmy", memno);
			 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("[error : mapLocation_locationlist]");
			e.printStackTrace();
		}
		
		 System.out.println(list.isEmpty());
		 
		return list;
	}
	
	
}
