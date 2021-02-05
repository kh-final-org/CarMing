package com.finalPJ.carming.model.dto;

import java.util.Date;

public class AdmRentDto {
	private int cartNo;
	private int cAmount;
	private Date startDate;
	private Date endDate;
	private int memNo;
	private int pNo;
	private int stateNo;
	private int pCategoryNo;
	private String memNick;
	private String stateName;
	private String pName;
	private String pCategoryName;
	private int payNo;
	private int totalPrice;
	private String memFile;
	
	public AdmRentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdmRentDto(int cartNo, int cAmount, Date startDate, Date endDate, int memNo, int pNo, int stateNo,
			int pCategoryNo, String memNick, String stateName, String pName, String pCategoryName, int payNo,
			int totalPrice, String memFile) {
		super();
		this.cartNo = cartNo;
		this.cAmount = cAmount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memNo = memNo;
		this.pNo = pNo;
		this.stateNo = stateNo;
		this.pCategoryNo = pCategoryNo;
		this.memNick = memNick;
		this.stateName = stateName;
		this.pName = pName;
		this.pCategoryName = pCategoryName;
		this.payNo = payNo;
		this.totalPrice = totalPrice;
		this.memFile = memFile;
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

	public int getpCategoryNo() {
		return pCategoryNo;
	}

	public void setpCategoryNo(int pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCategoryName() {
		return pCategoryName;
	}

	public void setpCategoryName(String pCategoryName) {
		this.pCategoryName = pCategoryName;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getMemFile() {
		return memFile;
	}

	public void setMemFile(String memFile) {
		this.memFile = memFile;
	}

	@Override
	public String toString() {
		return "AdmRentDto [cartNo=" + cartNo + ", cAmount=" + cAmount + ", startDate=" + startDate + ", endDate="
				+ endDate + ", memNo=" + memNo + ", pNo=" + pNo + ", stateNo=" + stateNo + ", pCategoryNo="
				+ pCategoryNo + ", memNick=" + memNick + ", stateName=" + stateName + ", pName=" + pName
				+ ", pCategoryName=" + pCategoryName + ", payNo=" + payNo + ", totalPrice=" + totalPrice + ", memFile="
				+ memFile + "]";
	}

	
	
	
}
