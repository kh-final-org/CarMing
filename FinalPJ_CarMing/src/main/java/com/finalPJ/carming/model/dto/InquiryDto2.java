package com.finalPJ.carming.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class InquiryDto2 {
	
	//private int memNo;
	private int memNo;
	private int categoryNo;
	private String inquiryContent;
	
	public InquiryDto2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InquiryDto2(int memNo, int categoryNo, String inquiryContent) {
		super();
		this.memNo = memNo;
		this.categoryNo = categoryNo;
		this.inquiryContent = inquiryContent;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	@Override
	public String toString() {
		return "InquiryDto2 [memNo=" + memNo + ", categoryNo=" + categoryNo + ", inquiryContent=" + inquiryContent
				+ "]";
	}

}
