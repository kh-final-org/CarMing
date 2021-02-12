package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.boardDto;

public interface boardBiz {


	//02. 게시글 상세보기
	public boardDto selectOne(int brdno);
	//03. 게시글(사진) 추가
	public int insert(boardDto dto);
	//04. 게시글(사진) 수정
	public int update(boardDto dto);
	//05. 게시글 삭제
	public int delete(int brdno);
	//06. 게시글 조회수
	public void viewCount(int brdno);
	//07. 사용자 프로필 페이지 목록
	public List<boardDto> userBoardList(int memno);
	//08. 사용자 프로필, 사용자 정보
	public MemberDto profilemem(int memno);
	//09. 게시글(영상) 추가
	public int insert_v(boardDto dto);
	
	//01. 게시글 전체 목록
	public List<boardDto> selectList();	
	public List<boardDto> selectList(int page);	
	public List<boardDto> selectList(String search, int page);	
	
	//페이징 카운트
	public int listCnt();
	public int listCnt(String search);
	
	
	//01. 마이페이 전체 목록
		public List<boardDto> MypageList(int memno);	
		public List<boardDto> MypageList(int page, int memno);	
		public List<boardDto> MypageList(String search, int page, int memno);	
		
		//페이징 카운트
		public int MypageListCnt(int memno);
		public int MypageListCnt(String search,int memno);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
