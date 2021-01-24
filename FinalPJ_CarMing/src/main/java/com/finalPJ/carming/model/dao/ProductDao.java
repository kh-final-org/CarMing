package com.finalPJ.carming.model.dao;

import java.util.List;
import java.util.Map;

import com.finalPJ.carming.model.dto.Pagination;
import com.finalPJ.carming.model.dto.ProductDto;
import com.finalPJ.carming.model.dto.boardDto;

public interface ProductDao {
	
	String NAMESPACE = "product.";
	public List<ProductDto> selectAll();
	public ProductDto selectOne(int pNo);
	public int insertProduct(ProductDto dto);
	public void deleteProduct(ProductDto dto);
	public int countListTotal();
}
