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

	public int getreviewNo() {
		return reviewNo;
	}

	public void setreviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getreviewContext() {
		return reviewContext;
	}

	public void setreviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}

	public Date getreviewDate() {
		return reviewDate;
	}

	public void setreviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getreviewWriter() {
		return reviewWriter;
	}

	public void setreviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public int getreviewStar() {
		return reviewStar;
	}

	public void setreviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	@Override
	public String toString() {
		return "RentReviewDto [reviewNo=" + reviewNo + ", pNo=" + pNo + ", reviewContext=" + reviewContext
				+ ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter + ", reviewStar=" + reviewStar + "]";
	}

	
	
}
