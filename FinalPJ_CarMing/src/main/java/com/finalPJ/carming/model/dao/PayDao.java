package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.PayDto;

public interface PayDao {
	String NAMESPACE = "pay.";
	public List<PayDto> selectPay();
	public PayDto selectOnePay(int payNo);
	public void insertPay(PayDto pDto);
	public int selectPaySeq();
}
