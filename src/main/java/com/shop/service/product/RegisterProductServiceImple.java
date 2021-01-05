package com.shop.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.RegisterProductMapper;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;

@Service
public class RegisterProductServiceImple implements RegisterProductService{
	@Setter(onMethod_= @Autowired)
	private RegisterProductMapper mapper;
	@Override
	public void productForm(Prod_Tbl product) {

		mapper.productForm(product);
	}

}
