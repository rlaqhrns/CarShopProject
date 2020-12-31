package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.ConfirmationMapper;
import com.shop.vo.Order_Histroy_Tbl;

import lombok.Setter;

@Service
public class ConfirmationServiceImple implements ConfirmationService{

	@Setter(onMethod_ = @Autowired)
	private ConfirmationMapper mapper;
	
	@Override
	public List<Order_Histroy_Tbl> orderList(String u_id) {
		// TODO Auto-generated method stub
		return mapper.orderList(u_id); //전체 구입물품 조회 (재원/20.12.30)
	}

}
