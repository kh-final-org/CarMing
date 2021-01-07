package com.finalPJ.carming.model.dao;

import java.util.ArrayList;

import com.finalPJ.carming.model.dto.RecipeDto;

public interface RecipeDao {
	
	String NAMESPACE = "recipe.";
	
	public int insertURL(ArrayList<RecipeDto> list);
}
