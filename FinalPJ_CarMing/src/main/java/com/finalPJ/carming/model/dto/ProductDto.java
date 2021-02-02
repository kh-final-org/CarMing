package com.finalPJ.carming.model.dto;


public class ProductDto {
	private int pNo;
	private int pCategoryNo;
	private String pName;
	private int pPrice;
	private String pDesc;
	private String pFile;
	private String pPath;
	private int pAmount;
	
	public ProductDto() {
		super();
	}

	public ProductDto(int pNo, int pCategoryNo, String pName, int pPrice, String pDesc, String pFile, String pPath, int pAmount) {
		super();
		this.pNo = pNo;
		this.pCategoryNo = pCategoryNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pDesc = pDesc;
		this.pFile = pFile;
		this.pPath = pPath;
		this.pAmount = pAmount;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getpCategoryNo() {
		return pCategoryNo;
	}

	public void setpCategoryNo(int pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getpFile() {
		return pFile;
	}

	public void setpFile(String pFile) {
		this.pFile = pFile;
	}

	public String getpPath() {
		return pPath;
	}

	public void setpPath(String pPath) {
		this.pPath = pPath;
	}

	public int getpAmount() {
		return pAmount;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}
	
	
	
}
