package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.PayDto;

public interface PayBiz {
	public List<PayDto> selectPay();
	public PayDto selectOnePay(PayDto pDto);
	public void insertPay( PayDto pDto);
	public int selectPaySeq();
}
