package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.ProductBuyMapper;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;

@Service
public class ProductBuyServiceImple implements ProductBuyService {
	@Setter(onMethod_ = @Autowired)
	private ProductBuyMapper mapper;
	
	public List<Prod_Tbl> getProductAll(){
		return mapper.getProductAll();
	}
}
