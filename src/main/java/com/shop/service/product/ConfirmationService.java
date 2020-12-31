package com.shop.service.product;

import java.util.List;

import com.shop.vo.Order_Histroy_Tbl;

public interface ConfirmationService {
	
	public List<Order_Histroy_Tbl> orderList(String u_id); //유저의 결제 목록 (재원/20.12.30)
}
