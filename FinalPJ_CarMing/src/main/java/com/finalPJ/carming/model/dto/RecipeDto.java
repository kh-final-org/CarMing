package com.finalPJ.carming.model.dto;


import org.springframework.stereotype.Service;



public class RecipeDto {
	
	private int recipeNo;
	private String recipeFile;
	private String recipeTitle;
	private String recipeWriter;
	private String recipeWriterURL;
	private int recipeCount;
	private String views;
	private String recipeURL;
	
	public RecipeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public RecipeDto(int recipeNo, String recipeFile, String recipeTitle, String recipeWriter, String recipeWriterURL,
			String views, String recipeURL) {
		super();
		this.recipeNo = recipeNo;
		this.recipeFile = recipeFile;
		this.recipeTitle = recipeTitle;
		this.recipeWriter = recipeWriter;
		this.recipeWriterURL = recipeWriterURL;
		this.views = views;
		this.recipeURL = recipeURL;
	}


	
	public int getRecipeNo() {
		return recipeNo;
	}



	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}



	public String getRecipeFile() {
		return recipeFile;
	}

	public void setRecipeFile(String recipeFile) {
		this.recipeFile = recipeFile;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getRecipeWriter() {
		return recipeWriter;
	}

	public void setRecipeWriter(String recipeWriter) {
		this.recipeWriter = recipeWriter;
	}

	public String getRecipeWriterURL() {
		return recipeWriterURL;
	}

	public void setRecipeWriterURL(String recipeWriterURL) {
		this.recipeWriterURL = recipeWriterURL;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getRecipeURL() {
		return recipeURL;
	}

	public void setRecipeURL(String recipeURL) {
		this.recipeURL = recipeURL;
	}



	@Override
	public String toString() {
		return "RecipeDto [recipeNo=" + recipeNo + ", recipeFile=" + recipeFile + ", recipeTitle=" + recipeTitle
				+ ", recipeWriter=" + recipeWriter + ", recipeWriterURL=" + recipeWriterURL + ", views=" + views
				+ ", recipeURL=" + recipeURL + "]";
	}

	

	
	
	
	
}
