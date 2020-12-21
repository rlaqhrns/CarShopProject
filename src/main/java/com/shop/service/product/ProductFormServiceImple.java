package com.shop.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.ProductFormMapper;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;

@Service
public class ProductFormServiceImple implements ProductFormService{

	@Setter(onMethod_ = @Autowired)
	private ProductFormMapper mapper;

	public void productForm(Prod_Tbl product) {

		mapper.productForm(product);
	}

}
