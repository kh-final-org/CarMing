package com.finalPJ.carming.model.dto;

public class PCategoryDto {
	private int PCategoryNo;
	private String PCategoryName;
	
	public PCategoryDto() {
		super();
	
	}

	public PCategoryDto(int pCategoryNo, String pCategoryName) {
		super();
		PCategoryNo = pCategoryNo;
		PCategoryName = pCategoryName;
	}

	protected int getPCategoryNo() {
		return PCategoryNo;
	}

	protected void setPCategoryNo(int pCategoryNo) {
		PCategoryNo = pCategoryNo;
	}

	protected String getPCategoryName() {
		return PCategoryName;
	}

	protected void setPCategoryName(String pCategoryName) {
		PCategoryName = pCategoryName;
	}
	
	
	
}
