package com.shop.service.product;

import java.util.List;

import com.shop.vo.Prod_Tbl;

public interface IndexService {
	
	public List<Prod_Tbl> index(); // index Page에서 hit순으로

	public List<Prod_Tbl> index2(); // index Page에서 최신순으로

}
