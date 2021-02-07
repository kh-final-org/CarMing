package com.finalPJ.carming.model.dto;

import java.util.Date;

public class bcommentDto {
	
	private int memno;	 		//회원번호
	private int comno;			//댓글 번호
	private String comwriter;	//댓글 작성자
	private String comcontext;	//댓글 내용
	private Date comdate;		//댓글 작성 날짜
	private int brdno; 			//캠핑토크 게시글 번호

	
	public bcommentDto() {
		super();
	}


	public bcommentDto(int memno, int comno, String comwriter, String comcontext, Date comdate, int brdno) {
		super();
		this.memno = memno;
		this.comno = comno;
		this.comwriter = comwriter;
		this.comcontext = comcontext;
		this.comdate = comdate;
		this.brdno = brdno;
	}


	public int getMemno() {
		return memno;
	}


	public void setMemno(int memno) {
		this.memno = memno;
	}


	public int getComno() {
		return comno;
	}


	public void setComno(int comno) {
		this.comno = comno;
	}


	public String getComwriter() {
		return comwriter;
	}


	public void setComwriter(String comwriter) {
		this.comwriter = comwriter;
	}


	public String getComcontext() {
		return comcontext;
	}


	public void setComcontext(String comcontext) {
		this.comcontext = comcontext;
	}


	public Date getComdate() {
		return comdate;
	}


	public void setComdate(Date comdate) {
		this.comdate = comdate;
	}


	public int getBrdno() {
		return brdno;
	}


	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}


	@Override
	public String toString() {
		return "bcommentDto [memno=" + memno + ", comno=" + comno + ", comwriter=" + comwriter + ", comcontext="
				+ comcontext + ", comdate=" + comdate + ", brdno=" + brdno + "]";
	}

	
}
