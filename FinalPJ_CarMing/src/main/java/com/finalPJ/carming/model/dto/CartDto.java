package com.finalPJ.carming.model.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CartDto {
	private int cartNo;
	private int cAmount;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	private int memNo;
	private int pNo;
	private int stateNo;
 
	
	public CartDto() {
		super();
	}
	
	public CartDto(int cartNo, int cAmount, Date startDate, Date endDate, int memNo, int pNo, int stateNo) {
		super();
		this.cartNo = cartNo;
		this.cAmount = cAmount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memNo = memNo;
		this.pNo = pNo;
		this.stateNo = stateNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getcAmount() {
		return cAmount;
	}

	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getStateNo() {
		return stateNo;
	}

	public void setStateNo(int stateNo) {
		this.stateNo = stateNo;
	}
	
	
}
