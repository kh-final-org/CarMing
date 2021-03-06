package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.CartListDto;
import com.finalPJ.carming.model.dto.PayDto;

public interface PayBiz {
	public List<PayDto> selectPay();
	public PayDto selectOnePay(PayDto pDto);
	public void insertPay( PayDto pDto);
	public int selectPaySeq();
	
	//검색과 페이징을 통한 SELECT//
	public List<PayDto> selectPay(String search, int page);
	public int getPayCnt(String search);
}
