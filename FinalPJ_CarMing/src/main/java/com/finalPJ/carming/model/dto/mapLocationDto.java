package com.finalPJ.carming.model.dto;

public class mapLocationDto {
	
	private int mapno;				//지도 위치 번호
	private String mapname;			//위치명
	private String maplatitude;		//위도	
	private String maplongtitude;	//경도		
	private String carmapchk;		//차박명소 등록 체크 동의(Y:동의/N:비동의)
	private int memno;				//회원번호
	private int brdno;				//캠핑토크 게시글 번호
	
	public mapLocationDto() {
		super();
	}

	public mapLocationDto(int mapno, String mapname, String maplatitude, String maplongtitude, String carmapchk,
			int memno, int brdno) {
		super();
		this.mapno = mapno;
		this.mapname = mapname;
		this.maplatitude = maplatitude;
		this.maplongtitude = maplongtitude;
		this.carmapchk = carmapchk;
		this.memno = memno;
		this.brdno = brdno;
	}

	public int getMapno() {
		return mapno;
	}
	public void setMapno(int mapno) {
		this.mapno = mapno;
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
	public int getBrdno() {
		return brdno;
	}
	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
