package com.finalPJ.carming.survey.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.survey.dto.SurveyDto;

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
	public SurveyDto update(SurveyDto dto) {
		return null;
	}

}
