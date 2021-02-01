package com.finalPJ.carming.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class boardDto {
	
	private int brdno;				//게시글 번호
	private int bcategoryno;		//카테고리 번호 참조
	private String brdwriter;		//게시글 작성자
	private MultipartFile brdfile;	//파일명
	private String brdfilename;
	private String brdthumbfile;	//파일 썸네일 이미지
	private String brdcontent;		//게시글 내용
	private int brdcount;			//게시글 조회 수
	private Date brddate;			//게시글 작성 날짜
	private String brdprivate;		//나만보기 체크 여부
	private int memno;				//memno
	private String memnick;			//memnick(db랑 같지 않아도 됨)
	private String mapname;			//map-위치명
	
	public boardDto() {
		super();
	}

	



	
	
}
