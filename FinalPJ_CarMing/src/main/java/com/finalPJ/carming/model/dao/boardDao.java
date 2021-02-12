package com.finalPJ.carming.model.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.boardDto;

public interface boardDao {
	
	String NAMESPACE = "board.";
	
	//01. 게시글 전체 목록
	public List<boardDto> selectList(String search, int page);	
	//02. 게시글 상세보기
	public boardDto selectOne(int brdno);
	//03. 게시글(사진) 추가
	public int insertBRD(boardDto dto);
	public int insertMAP(boardDto dto);
	//04. 게시글 수정
	public int update(boardDto dto);
	//05. 게시글 삭제
	public int delete(int brdno);
	public int deleteRep(int brdno);
	//06. 게시글 조회수
	public void viewCount(int brdno);
	//07. 사용자 프로필 페이지 목록
	public List<boardDto> userBoardList(int memno);
	//08. 사용자 프로필, 사용자 정보
	public MemberDto profilemem(int memno);
	//09. 게시글(영상) 추가
	public int insertBRD_v(boardDto dto);
	public int insertMAP_v(boardDto dto);
	
	//페이징 카운트
	public int listCnt(String search);
	//마이페이지
	public List<boardDto> MypageList(String search, int page, int memno);	
	public int MypageListCnt(String search,int memno);
	
	
	
	
}
