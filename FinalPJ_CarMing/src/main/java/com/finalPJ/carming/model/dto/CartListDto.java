package com.finalPJ.carming.model.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CartListDto {
	//CartDto VO
	private int cartNo;
	private int cAmount;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;
	private int memNo;
	private int pNo;
	private int stateNo;
	
	//ProductDto VO
	private int pAmount;
	private int pPrice;
	private String pName;
	private String pFile;
	
	public CartListDto() {
		super();
	}

	public CartListDto(int cartNo, int cAmount, Date startDate, Date endDate, int memNo, int pNo, int stateNo,
			int pAmount, int pPrice, String pName, String pFile) {
		super();
		this.cartNo = cartNo;
		this.cAmount = cAmount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memNo = memNo;
		this.pNo = pNo;
		this.stateNo = stateNo;
		this.pAmount = pAmount;
		this.pPrice = pPrice;
		this.pName = pName;
		this.pFile = pFile;
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

	public int getpAmount() {
		return pAmount;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpFile() {
		return pFile;
	}

	public void setpFile(String pFile) {
		this.pFile = pFile;
	}
	
}
