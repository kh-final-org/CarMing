package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.bcommentDto;

@Repository
public class bcommentDaoImpl implements bcommentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//01. 댓글 목록
	@Override
	public List<bcommentDto> selectList() {
		List<bcommentDto> list = new ArrayList<bcommentDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error : comment_selectList]");
			e.printStackTrace();
		}
		return list;
	}

	//02. 댓글 추가
	@Override
	public int insert(bcommentDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error : comment_insert]");
			e.printStackTrace();
		}
		return res;
	}

	//03. 댓글 삭제
	@Override
	public int delete(int comno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", comno);
		} catch (Exception e) {
			System.out.println("[error : comment_delete]");
			e.printStackTrace();
		}
		return res;
	}


	
	
}
