package com.finalPJ.carming.model.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReportDto {
	private int reportNo;
	private String reportWriter;
	private int memNo;
	private MultipartFile reportFile;
	private String reportFileName;
	private String reportContent;
	private String path;
	private Date reportDate;
	private int categoryNo;
	private String categoryName;
	private String targetNo;
	private String targetWriter;
	private String targetTypeNo;
	private String targetTypeName;
	private String memFile;
	private String boardVideo;
	public ReportDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ReportDto(int reportNo, String reportWriter, int memNo, MultipartFile reportFile, String reportFileName,
			String reportContent, String path, Date reportDate, int categoryNo, String categoryName, String targetNo,
			String targetWriter, String targetTypeNo, String targetTypeName, String memFile, String boardVideo) {
		super();
		this.reportNo = reportNo;
		this.reportWriter = reportWriter;
		this.memNo = memNo;
		this.reportFile = reportFile;
		this.reportFileName = reportFileName;
		this.reportContent = reportContent;
		this.path = path;
		this.reportDate = reportDate;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.targetNo = targetNo;
		this.targetWriter = targetWriter;
		this.targetTypeNo = targetTypeNo;
		this.targetTypeName = targetTypeName;
		this.memFile = memFile;
		this.boardVideo = boardVideo;
	}

	

	public String getBoardVideo() {
		return boardVideo;
	}


	public void setBoardVideo(String boardVideo) {
		this.boardVideo = boardVideo;
	}


	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportWriter() {
		return reportWriter;
	}
	public void setReportWriter(String reportWriter) {
		this.reportWriter = reportWriter;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public MultipartFile getReportFile() {
		return reportFile;
	}
	public void setReportFile(MultipartFile reportFile) {
		this.reportFile = reportFile;
	}
	public String getReportFileName() {
		return reportFileName;
	}
	public void setReportFileName(String reportFileName) {
		this.reportFileName = reportFileName;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getTargetNo() {
		return targetNo;
	}
	public void setTargetNo(String targetNo) {
		this.targetNo = targetNo;
	}
	public String getTargetWriter() {
		return targetWriter;
	}
	public void setTargetWriter(String targetWriter) {
		this.targetWriter = targetWriter;
	}
	public String getTargetTypeNo() {
		return targetTypeNo;
	}
	public void setTargetTypeNo(String targetTypeNo) {
		this.targetTypeNo = targetTypeNo;
	}
	public String getTargetTypeName() {
		return targetTypeName;
	}
	public void setTargetTypeName(String targetTypeName) {
		this.targetTypeName = targetTypeName;
	}
	public String getMemFile() {
		return memFile;
	}
	public void setMemFile(String memFile) {
		this.memFile = memFile;
	}


	@Override
	public String toString() {
		return "ReportDto [reportNo=" + reportNo + ", reportWriter=" + reportWriter + ", memNo=" + memNo
				+ ", reportFile=" + reportFile + ", reportFileName=" + reportFileName + ", reportContent="
				+ reportContent + ", path=" + path + ", reportDate=" + reportDate + ", categoryNo=" + categoryNo
				+ ", categoryName=" + categoryName + ", targetNo=" + targetNo + ", targetWriter=" + targetWriter
				+ ", targetTypeNo=" + targetTypeNo + ", targetTypeName=" + targetTypeName + ", memFile=" + memFile
				+ ", boardVideo=" + boardVideo + "]";
	}
	
	
	
	
	
	
	
}
