package com.finalPJ.carming.model.dto;

import java.util.Date;

public class bcommentDto {
	
	private int comno;			//댓글 번호
	private String comwriter;	//댓글 작성자
	private String comcontext;	//댓글 내용
	private Date comdate;		//댓글 작성 날짜
	
	public bcommentDto() {
		super();
	}

	public bcommentDto(int comno, String comwriter, String comcontext, Date comdate) {
		super();
		this.comno = comno;
		this.comwriter = comwriter;
		this.comcontext = comcontext;
		this.comdate = comdate;
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
	
	
	

}
