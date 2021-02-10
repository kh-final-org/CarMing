package com.finalPJ.carming.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalPJ.carming.model.dao.ProductDao;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.Pagination;
import com.finalPJ.carming.model.dto.ProductDto;

@Service
public class ProductBizImpl implements ProductBiz{
	
	@Autowired
	private ProductDao dao;

	@Override
	public ProductDto selectOne(int pNo) {
		return dao.selectOne(pNo);
	}

	@Override
	public int insertProduct(ProductDto dto) {
		return dao.insertProduct(dto);
	}

	@Override
	public void deleteProduct(ProductDto dto) {
		 dao.deleteProduct(dto);
	}

	@Override
	public int countListTotal() {
		return dao.countListTotal();
	}

	@Override
	public void changeAmount(CartListDto cDto) {
		dao.changeAmount(cDto);
	}
	
	@Override
	public List<ProductDto> selectAll(String search, int page) {
		return dao.selectAll(search, page);
	}

	@Override
	public int getProductCnt(String search) {
		return dao.getProductCnt(search);
	}
	
}
