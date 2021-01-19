package com.finalPJ.carming.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class InquiryDto {
	private int inquiryNo;
	private String memNick;
	private int memNo;
	private MultipartFile inquiryFile;
	private String path;
	private String filename;
	private String inquiryContent;
	private Date inquiryDate;
	private int categoryNo;
	private String categoryName;
	
	public InquiryDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	


	public InquiryDto(int inquiryNo, String memNick, int memNo, MultipartFile inquiryFile, String path, String filename,
			String inquiryContent, Date inquiryDate, int categoryNo, String categoryName) {
		super();
		this.inquiryNo = inquiryNo;
		this.memNick = memNick;
		this.memNo = memNo;
		this.inquiryFile = inquiryFile;
		this.path = path;
		this.filename = filename;
		this.inquiryContent = inquiryContent;
		this.inquiryDate = inquiryDate;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}





	public InquiryDto( String filename, String inquiryContent, int categoryNo) {
		super();
		this.filename = filename;
		this.inquiryContent = inquiryContent;
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public MultipartFile getInquiryFile() {
		return inquiryFile;
	}

	public void setInquiryFile(MultipartFile inquiryFile) {
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}





	@Override
	public String toString() {
		return "InquiryDto [inquiryNo=" + inquiryNo + ", memNick=" + memNick + ", memNo=" + memNo + ", inquiryFile="
				+ inquiryFile + ", path=" + path + ", filename=" + filename + ", inquiryContent=" + inquiryContent
				+ ", inquiryDate=" + inquiryDate + ", categoryNo=" + categoryNo + ", categoryName=" + categoryName
				+ "]";
	}



	
	


	
	
	
}
