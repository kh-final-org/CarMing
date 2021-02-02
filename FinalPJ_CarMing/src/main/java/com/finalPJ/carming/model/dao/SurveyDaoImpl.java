package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.SurveyDto;

//Dao니까 @Repository를 달아주자.
@Repository
public class SurveyDaoImpl implements SurveyDao {

	// 자동 주입 되도록.
	@Autowired 
	// 이친구를 통해 DB에 저장.
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<SurveyDto> selectList() {
		// 결과를 담을 리스트 생성
		List<SurveyDto> list = new ArrayList<SurveyDto>();
		
		try {					// ??? 뭐지 이건.
			list = sqlSession.selectList(NAMESPACE + "selectList");
			System.out.println("list.size() : " +list.size());
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public SurveyDto selectOne(int memno) {
		// 결과를 담아줄 dto
		SurveyDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", memno);
			System.out.println("DaoImpl.selectOne()");
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(SurveyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<SurveyDto> sameFriendList(SurveyDto dto) {
		// 결과를 담을 친구 리스트 생성
		List<SurveyDto> list = new ArrayList<SurveyDto>();
		
		try {					
			list = sqlSession.selectList(NAMESPACE + "sameFriendList", dto);
			System.out.println("list.size() : " + list.size());
		} catch (Exception e) {
			System.out.println("[error] : sameFriendList");
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public int FriendOne(SurveyDto dto) {
		// 결과를 담을 친구 번호 생성
		int res = 0;
		
		try {					
			if(sqlSession.selectOne(NAMESPACE + "FriendOne", dto) != null) {
				res = sqlSession.selectOne(NAMESPACE + "FriendOne", dto);
				System.out.println("null이 아니다.");
			} else {
				res = 0;
				System.out.println("null이다.");
			}
			
		} catch (Exception e) {
			System.out.println("[error] : FriendOne");
			e.printStackTrace();
		}
		return res;
	}

}





