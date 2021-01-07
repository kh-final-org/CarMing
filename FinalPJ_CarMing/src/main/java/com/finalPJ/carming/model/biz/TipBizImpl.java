package com.finalPJ.carming.model.biz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.TipDao;
import com.finalPJ.carming.model.dto.TipDto;




@Service
public class TipBizImpl implements TipBiz{
	@Autowired
	private TipDao dao;
	
	@Override
	public int insert(ArrayList<TipDto> list) {
		return dao.insertURL(list);
	}

}
