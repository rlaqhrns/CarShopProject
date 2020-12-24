package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.vo.Prod_Tbl;

@Service
public interface ProductBuyService {
	
	public List<Prod_Tbl> getProductAll();
	public Prod_Tbl getProduct(int p_no);
}
