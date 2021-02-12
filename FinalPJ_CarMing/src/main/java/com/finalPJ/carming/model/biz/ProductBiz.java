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

	public int returnProduct(int cartNo);
	
	//검색, 페이징, 카테고리를  포함한 SELECT//
	public List<ProductDto> selectAll(String search, int page, int viewNo, int pCateNo, String orderBy);
	public int getProductCnt(String search);
	
}
