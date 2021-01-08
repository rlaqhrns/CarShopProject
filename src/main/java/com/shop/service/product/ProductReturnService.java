package com.shop.service.product;

import java.util.List;

import com.shop.vo.Return_Tbl;

public interface ProductReturnService {


	public List<Return_Tbl> retrun_(String s_id); // 교환/반품 페이지
	public List<Return_Tbl> order_date(String click_date,String s_id); // 날짜 별
	public List<Return_Tbl> count(String s_id);

}
