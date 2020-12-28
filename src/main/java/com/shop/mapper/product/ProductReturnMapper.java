package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Return_Tbl;

public interface ProductReturnMapper {
	
	public List<Return_Tbl> return_(); // 교환 반품 페이지
	public List<Return_Tbl> order_date(String order_date); // 날짜 별


}
