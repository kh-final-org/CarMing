package com.finalPJ.carming.model.biz;

import java.util.List;
import java.util.Map;

import com.finalPJ.carming.model.dao.ProductDao;
import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.Pagination;
import com.finalPJ.carming.model.dto.ProductDto;

public interface ProductBiz {
	public ProductDto selectOne(int pNo);
	public int insertProduct(ProductDto dto);
	public void deleteProduct(ProductDto dto);
	public int countListTotal();
	public void changeAmount(CartListDto cDto);
	
	//검색과 페이징을 통한 SELECT
	public List<ProductDto> selectAll(String search, int page);
	public int getProductCnt(String search);
}
