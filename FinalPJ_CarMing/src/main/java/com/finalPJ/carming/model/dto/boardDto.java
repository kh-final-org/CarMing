package com.finalPJ.carming.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class boardDto {
	
	private int brdno;				//게시글 번호
	private int bcategoryno;		//카테고리 번호 참조
	private String brdwriter;		//게시글 작성자
	private MultipartFile brdfile;	//파일명
	private String brdfilename;		//실제 파일명
	private MultipartFile brdvideo;	//동영상
	private String brdvideoname;	//동영상 파일명
	private String brdcontent;		//게시글 내용
	private int brdcount;			//게시글 조회 수
	private Date brddate;			//게시글 작성 날짜
	private String brdprivate;		//나만보기 체크 여부
	private String carmapchk;		//차박명소 등록 체크 동의(Y:동의/N:비동의)
	private int memno;				//memno
	private String memnick;			//memnick
	private String mapname;			//map-위치명
	private String maplatitude;		//위도	
	private String maplongtitude;	//경도	


	public boardDto() {
		super();
	}


	public boardDto(int brdno, int bcategoryno, String brdwriter, MultipartFile brdfile, String brdfilename,
			MultipartFile brdvideo, String brdvideoname, String brdcontent, int brdcount, Date brddate,
			String brdprivate, String carmapchk, int memno, String memnick, String mapname, String maplatitude,
			String maplongtitude) {
		super();
		this.brdno = brdno;
		this.bcategoryno = bcategoryno;
		this.brdwriter = brdwriter;
		this.brdfile = brdfile;
		this.brdfilename = brdfilename;
		this.brdvideo = brdvideo;
		this.brdvideoname = brdvideoname;
		this.brdcontent = brdcontent;
		this.brdcount = brdcount;
		this.brddate = brddate;
		this.brdprivate = brdprivate;
		this.carmapchk = carmapchk;
		this.memno = memno;
		this.memnick = memnick;
		this.mapname = mapname;
		this.maplatitude = maplatitude;
		this.maplongtitude = maplongtitude;
	}


	public int getBrdno() {
		return brdno;
	}


	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}


	public int getBcategoryno() {
		return bcategoryno;
	}


	public void setBcategoryno(int bcategoryno) {
		this.bcategoryno = bcategoryno;
	}


	public String getBrdwriter() {
		return brdwriter;
	}


	public void setBrdwriter(String brdwriter) {
		this.brdwriter = brdwriter;
	}


	public MultipartFile getBrdfile() {
		return brdfile;
	}


	public void setBrdfile(MultipartFile brdfile) {
		this.brdfile = brdfile;
	}


	public String getBrdfilename() {
		return brdfilename;
	}


	public void setBrdfilename(String brdfilename) {
		this.brdfilename = brdfilename;
	}


	public MultipartFile getBrdvideo() {
		return brdvideo;
	}


	public void setBrdvideo(MultipartFile brdvideo) {
		this.brdvideo = brdvideo;
	}


	public String getBrdvideoname() {
		return brdvideoname;
	}


	public void setBrdvideoname(String brdvideoname) {
		this.brdvideoname = brdvideoname;
	}


	public String getBrdcontent() {
		return brdcontent;
	}


	public void setBrdcontent(String brdcontent) {
		this.brdcontent = brdcontent;
	}


	public int getBrdcount() {
		return brdcount;
	}


	public void setBrdcount(int brdcount) {
		this.brdcount = brdcount;
	}


	public Date getBrddate() {
		return brddate;
	}


	public void setBrddate(Date brddate) {
		this.brddate = brddate;
	}


	public String getBrdprivate() {
		return brdprivate;
	}


	public void setBrdprivate(String brdprivate) {
		this.brdprivate = brdprivate;
	}


	public String getCarmapchk() {
		return carmapchk;
	}


	public void setCarmapchk(String carmapchk) {
		this.carmapchk = carmapchk;
	}


	public int getMemno() {
		return memno;
	}


	public void setMemno(int memno) {
		this.memno = memno;
	}


	public String getMemnick() {
		return memnick;
	}


	public void setMemnick(String memnick) {
		this.memnick = memnick;
	}


	public String getMapname() {
		return mapname;
	}


	public void setMapname(String mapname) {
		this.mapname = mapname;
	}


	public String getMaplatitude() {
		return maplatitude;
	}


	public void setMaplatitude(String maplatitude) {
		this.maplatitude = maplatitude;
	}


	public String getMaplongtitude() {
		return maplongtitude;
	}


	public void setMaplongtitude(String maplongtitude) {
		this.maplongtitude = maplongtitude;
	}


	@Override
	public String toString() {
		return "boardDto [brdno=" + brdno + ", bcategoryno=" + bcategoryno + ", brdwriter=" + brdwriter + ", brdfile="
				+ brdfile + ", brdfilename=" + brdfilename + ", brdvideo=" + brdvideo + ", brdvideoname=" + brdvideoname
				+ ", brdcontent=" + brdcontent + ", brdcount=" + brdcount + ", brddate=" + brddate + ", brdprivate="
				+ brdprivate + ", carmapchk=" + carmapchk + ", memno=" + memno + ", memnick=" + memnick + ", mapname="
				+ mapname + ", maplatitude=" + maplatitude + ", maplongtitude=" + maplongtitude + "]";
	}

	
	
}
