package com.finalPJ.carming.model.dto;

import java.util.Date;

public class InquiryDto {
	private int inquiryNo;
	private String memNick;
	private int memNo;
	private String inquiryFile;
	private String inquiryContent;
	private Date inquiryDate;
	private int categoryNo;
	
	public InquiryDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public InquiryDto(int inquiryNo, String memNick, int memNo, String inquiryFile, String inquiryContent,
			Date inquiryDate, int categoryNo) {
		super();
		this.inquiryNo = inquiryNo;
		this.memNick = memNick;
		this.memNo = memNo;
		this.inquiryFile = inquiryFile;
		this.inquiryContent = inquiryContent;
		this.inquiryDate = inquiryDate;
		this.categoryNo = categoryNo;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getInquiryFile() {
		return inquiryFile;
	}

	public void setInquiryFile(String inquiryFile) {
		this.inquiryFile = inquiryFile;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "InquiryDto [inquiryNo=" + inquiryNo + ", memNick=" + memNick + ", memNo=" + memNo + ", inquiryFile="
				+ inquiryFile + ", inquiryContent=" + inquiryContent + ", inquiryDate=" + inquiryDate + ", categoryNo="
				+ categoryNo + "]";
	}
	
	
	
	
}
