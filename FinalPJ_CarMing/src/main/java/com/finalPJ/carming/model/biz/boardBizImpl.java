package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.boardDao;
import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.boardDto;

@Service
public class boardBizImpl implements boardBiz{

	@Autowired
	private boardDao dao;
	private int brdno;
	
	//01. 게시글 전체 목록
	
	/*
	 * @Override public List<boardDto> selectList() { return selectList("",1,""); }
	 * 
	 * @Override public List<boardDto> selectList(int page) { return selectList("",
	 * page,""); }
	 */
	
	@Override
	public List<boardDto> selectList(String search, int page, String categoryNo) {
		return dao.selectList(search, page,categoryNo);
	}

	/*
	 * @Override public int listCnt() { return dao.listCnt("",""); }
	 */
	@Override
	public int listCnt(String search, String categoryNo) {
		return dao.listCnt(search,categoryNo);
	}


	//02. 게시글 상세보기
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public boardDto selectOne(int brdno) {
		dao.viewCount(brdno);
		return dao.selectOne(brdno);
	}

	//03. 게시글(사진) 추가
	@Transactional
	@Override
	public int insert(boardDto dto) {
		dao.insertBRD(dto);
		return dao.insertMAP(dto);
	}

	//04. 게시글(사진) 수정
	@Override
	public int update(boardDto dto) {
		return dao.update(dto);
	}

	//05. 게시글 삭제
	@Transactional
	@Override
	public int delete(int brdno) {
		dao.delete(brdno);
		return dao.deleteRep(brdno);
	}

	//06. 게시글 조회수
	@Override
	public void viewCount(int brdno) {
	}

	//07. 사용자 프로필 페이지 목록
	@Override
	public List<boardDto> userBoardList(int memno) {
		return dao.userBoardList(memno);
	}
	
	//08. 사용자 프로필, 사용자 정보
	@Override
	public MemberDto profilemem(int memno) {
		return dao.profilemem(memno);
	}

	//09. 게시글(영상) 추가
	@Transactional
	@Override
	public int insert_v(boardDto dto) {
		 dao.insertBRD_v(dto);
		 return dao.insertMAP_v(dto);
	}

	@Override
	public List<boardDto> MypageList(int memno) {
		return MypageList("",1,memno);
	}

	@Override
	public List<boardDto> MypageList(int page,int memno) {
		return MypageList("",page,memno);
	}

	@Override
	public List<boardDto> MypageList(String search, int page, int memno) {
		return dao.MypageList(search, page, memno);
	}

	@Override
	public int MypageListCnt(int memno) {
		return dao.MypageListCnt("", memno);
	}

	@Override
	public int MypageListCnt(String search, int memno) {
		return dao.MypageListCnt(search, memno);
	}





	
	
	
	
	


}
