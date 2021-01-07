package com.finalPJ.carming.model.dao;

import java.util.ArrayList;

import com.finalPJ.carming.model.dto.TipDto;

public interface TipDao {
	
	String NAMESPACE = "tip.";
	
	public int insertURL(ArrayList<TipDto> list);
}
