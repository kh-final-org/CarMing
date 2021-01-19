package com.finalPJ.carming.model.biz;

import java.util.List;
import java.util.Map;

import com.finalPJ.carming.model.dao.ProductDao;
import com.finalPJ.carming.model.dto.Pagination;
import com.finalPJ.carming.model.dto.ProductDto;

public interface ProductBiz {
	public List<ProductDto> selectAll();
	public ProductDto selectOne(int pNo);
	public int insertProduct(ProductDto dto);
	public void deleteProduct(ProductDto dto);
	public int countListTotal();
}
