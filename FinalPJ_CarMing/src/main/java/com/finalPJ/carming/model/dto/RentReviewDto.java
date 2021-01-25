package com.finalPJ.carming.model.dto;

import java.util.Date;

public class RentReviewDto {
	private int reviewNo;
	private int pNo;
	private String reviewContext;
	private Date reviewDate;
	private String reviewWriter;
	private int reviewStar;
	
	public RentReviewDto() {
		super();
	}

	public RentReviewDto(int reviewNo, int pNo, String reviewContext, Date reviewDate, String reviewWriter,
			int reviewStar) {
		super();
		this.reviewNo = reviewNo;
		this.pNo = pNo;
		this.reviewContext = reviewContext;
		this.reviewDate = reviewDate;
		this.reviewWriter = reviewWriter;
		this.reviewStar = reviewStar;
	}

	
	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getReviewContext() {
		return reviewContext;
	}

	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	@Override
	public String toString() {
		return "RentReviewDto [reviewNo=" + reviewNo + ", pNo=" + pNo + ", reviewContext=" + reviewContext
				+ ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter + ", reviewStar=" + reviewStar + "]";
	}

}
