package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.ProductReturnMapper;
import com.shop.vo.Return_Tbl;

import lombok.Setter;

@Service
public class ProductReturnServiceImple implements ProductReturnService{

	@Setter(onMethod_ = @Autowired)
	private ProductReturnMapper mapper;

	public List<Return_Tbl> retrun_() {
		return mapper.return_();
	}

	@Override
	public List<Return_Tbl> order_date(String order_date) {
		return mapper.order_date(order_date);
	}

}
