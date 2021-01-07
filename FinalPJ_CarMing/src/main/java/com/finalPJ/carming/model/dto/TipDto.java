package com.finalPJ.carming.model.dto;

public class TipDto {

	private String tipTitle;
	private String tipURL;
	private String tipFile;
	private int views;
	
	public TipDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TipDto(String tipTitle, String tipURL, String tipFile, int views) {
		super();
		this.tipTitle = tipTitle;
		this.tipURL = tipURL;
		this.tipFile = tipFile;
		this.views = views;
	}

	public String getTipTitle() {
		return tipTitle;
	}

	public void setTipTitle(String tipTitle) {
		this.tipTitle = tipTitle;
	}

	public String getTipURL() {
		return tipURL;
	}

	public void setTipURL(String tipURL) {
		this.tipURL = tipURL;
	}

	public String getTipFile() {
		return tipFile;
	}

	public void setTipFile(String tipFile) {
		this.tipFile = tipFile;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	@Override
	public String toString() {
		return "TipDto [tipTitle=" + tipTitle + ", tipURL=" + tipURL + ", tipFile=" + tipFile + ", views=" + views
				+ "]";
	}
	
	
	
}
