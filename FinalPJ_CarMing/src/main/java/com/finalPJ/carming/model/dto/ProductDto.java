package com.finalPJ.carming.model.dto;


public class ProductDto {
	private int pNo;
	private int pCategoryNo;
	private String pCategoryName;
	private String pName;
	private int pPrice;
	private String pDesc;
	private String pFile;
	private String pFile2;
	private String pFile3;
	private String pPath;
	private int pAmount;
	
	public ProductDto() {
		super();
	}

	public ProductDto(int pNo, int pCategoryNo, String pCategoryName, String pName, int pPrice, String pDesc,
			String pFile, String pFile2, String pFile3, String pPath, int pAmount) {
		super();
		this.pNo = pNo;
		this.pCategoryNo = pCategoryNo;
		this.pCategoryName = pCategoryName;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pDesc = pDesc;
		this.pFile = pFile;
		this.pFile2 = pFile2;
		this.pFile3 = pFile3;
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

	public String getpCategoryName() {
		return pCategoryName;
	}

	public void setpCategoryName(String pCategoryName) {
		this.pCategoryName = pCategoryName;
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

	public String getpFile2() {
		return pFile2;
	}

	public void setpFile2(String pFile2) {
		this.pFile2 = pFile2;
	}

	public String getpFile3() {
		return pFile3;
	}

	public void setpFile3(String pFile3) {
		this.pFile3 = pFile3;
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

	@Override
	public String toString() {
		return "ProductDto [pNo=" + pNo + ", pCategoryNo=" + pCategoryNo + ", pCategoryName=" + pCategoryName
				+ ", pName=" + pName + ", pPrice=" + pPrice + ", pDesc=" + pDesc + ", pFile=" + pFile + ", pFile2="
				+ pFile2 + ", pFile3=" + pFile3 + ", pPath=" + pPath + ", pAmount=" + pAmount + "]";
	}

	
	
	
	
}
