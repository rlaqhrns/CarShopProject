package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Prod_Tbl;

public interface ProductBuyMapper {
	public List<Prod_Tbl> getProductAll();
	public Prod_Tbl getProduct(int p_no);
}
