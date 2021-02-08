package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.Pagination;
import com.finalPJ.carming.model.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ProductDto> selectAll() {
		List<ProductDto> productList = new ArrayList<ProductDto>();
		
		try {
			productList = sqlSession.selectList(NAMESPACE+"selectAll");
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT LIST]");
			e.printStackTrace();
		}
		return productList;
	}
	
	@Override
	public ProductDto selectOne(int pNo) {
		ProductDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", pNo);
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT DETAIL]");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insertProduct(ProductDto dto) {
		int insertRes = 0;
		
		try {
			insertRes = sqlSession.insert(NAMESPACE+"insertProduct", dto);
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT INSERT]");
			e.printStackTrace();
		}
		
		return insertRes;
	}

	@Override
	public void deleteProduct(ProductDto dto) {
		try {
			sqlSession.delete(NAMESPACE+"deleteProduct", dto);
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT DELETE]");
			e.printStackTrace();
		}
	}

	@Override
	public int countListTotal() {
		int ctn = 0;
		
		try {
			ctn = sqlSession.selectOne(NAMESPACE+"countListTotal");
		} catch (Exception e) {
			System.out.println("[ERROR: PRODUCT LIST COUNTTOTAL]");
			e.printStackTrace();
		}
		return ctn;
	}

	@Override
	public void changeAmount(CartListDto cDto) {
		try {
			sqlSession.update(NAMESPACE+"changeAmount", cDto);
		} catch (Exception e) {
			System.out.println("[ERROR: CHANGE STOCK]");
			e.printStackTrace();
		}
	}
	
}
