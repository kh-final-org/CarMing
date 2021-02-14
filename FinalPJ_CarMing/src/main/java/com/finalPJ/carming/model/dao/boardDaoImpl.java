package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.boardDto;

@Repository
public class boardDaoImpl implements boardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//01. 게시글 전체 목록
	@Override
	public List<boardDto> selectList(String search, int page, String categoryNo) {
		List<boardDto> list = new ArrayList<boardDto>();
		// 검색어, 페이지 맵에 저장
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("search", search);
		map.put("page", Integer.toString(page));
		map.put("categoryNo", categoryNo);
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList",map);
		} catch (Exception e) {
			System.out.println("[error : board_selectList]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int listCnt(String search, String categoryNo) {
		int res = 0;
		Map<String,String> map = new HashMap<String,String>();
		map.put("search", search);
		map.put("categoryNo",categoryNo);
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectCnt",map);
		} catch (Exception e) {
			System.out.println("[error]:select board Count");
			e.printStackTrace();
		}
		
		return res;
	}

	
	//02. 게시글 상세보기
	@Override
	public boardDto selectOne(int brdno) {
		boardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", brdno);
		} catch (Exception e) {
			System.out.println("[error : board_selectOne]");
			e.printStackTrace();
		}
		return dto;
	}
	
	//03. 게시글(사진) 추가
	@Override
	public int insertBRD(boardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertBRD", dto);
		} catch (Exception e) {
			System.out.println("[error : board_insertbrd]");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int insertMAP(boardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertMAP", dto);
		} catch (Exception e) {
			System.out.println("[error : board_insertmap]");
			e.printStackTrace();
		}
		return res;
	}
	
	//04. 게시글(사진) 수정
	@Override
	public int update(boardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[error : board_update]");
			e.printStackTrace();
		}
		return res;
	}

	//05. 게시글 삭제
	@Override
	public int delete(int brdno) {
		int res = 0 ;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",brdno);
		} catch (Exception e) {

			System.out.println("[error : board_delete]");

			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int deleteRep(int brdno) {
		int res = 0;
		try {
			res = sqlSession.delete(NAMESPACE+"deleteRep",brdno);
		} catch (Exception e) {

			System.out.println("[error : board_deleteRep]");
			e.printStackTrace();
		}
		return res;
	}


	//06. 게시글 조회수
	@Override
	public void viewCount(int brdno) {
		try {
			sqlSession.update(NAMESPACE+"viewCount", brdno);
		} catch (Exception e) {
			System.out.println("[error : board_viewCount]");
			e.printStackTrace();
		}
	}
	
	//07. 사용자 프로필 페이지
	@Override
	public List<boardDto> userBoardList(int memno) {
		List<boardDto> list = new ArrayList<boardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"userBoardList", memno);
		} catch (Exception e) {

			System.out.println("[error : board_userBoardList]");

			e.printStackTrace();
		}
		return list;
	}

	//08. 사용자 프로필, 사용자 정보
	@Override
	public MemberDto profilemem(int memno) {
		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"profilemem", memno);
		} catch (Exception e) {
			System.out.println("[error : profilemem]");
			e.printStackTrace();
		}
		return dto;
	}
	
	//09. 게시글(영상) 추가
	@Override
	public int insertBRD_v(boardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertBRD_v", dto);
		} catch (Exception e) {
			System.out.println("[error : board_insertbrd_v]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertMAP_v(boardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertMAP_v", dto);
		} catch (Exception e) {
			System.out.println("[error : board_insertmap_V]");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<boardDto> MypageList(String search, int page, int memno) {
		List<boardDto> list = new ArrayList<boardDto>();
		// 검색어, 페이지 맵에 저장
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("search", search);
		map.put("page", Integer.toString(page));
		map.put("memno", Integer.toString(memno));
		
		try {
			list = sqlSession.selectList(NAMESPACE+"mypageList",map);
		} catch (Exception e) {
			System.out.println("[error : mypage]");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int MypageListCnt(String search, int memno) {
		int res = 0;
		Map<String,String> map = new HashMap<String,String>();
		map.put("search", search);
		map.put("memno", Integer.toString(memno));
		try {
			res = sqlSession.selectOne(NAMESPACE+"mypageCnt",map);
		} catch (Exception e) {
			System.out.println("[error]:mypageCnt");
			e.printStackTrace();
		}
		
		return res;
	}


	
	
}
