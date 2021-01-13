package com.shop.service.product;

import java.util.List;

import com.shop.vo.Return_Tbl;

public interface ProductReturnService {


	public List<Return_Tbl> retrun_(String s_id); // 교환/반품 페이지
	public List<Return_Tbl> order_date(String click_date,String s_id); // 날짜 별
	public List<Return_Tbl> count(String s_id); // 날짜별 카운트 조회
	public int insert_select(int ono)throws Exception;  // 교환반품처리 시 return_end_tbl에 insert
	

}
