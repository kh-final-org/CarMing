package com.finalPJ.carming.model.biz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.RecipeDao;
import com.finalPJ.carming.model.dto.RecipeDto;




@Service
public class RecipeBizImpl implements RecipeBiz{
	@Autowired
	private RecipeDao dao;
	
	@Override
	public int insert(ArrayList<RecipeDto> list) {
		return dao.insertURL(list);
	}

}
