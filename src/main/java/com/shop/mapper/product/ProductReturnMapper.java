package com.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.Return_Tbl;

public interface ProductReturnMapper {
	
	public List<Return_Tbl> return_(String s_id); // 교환 반품 페이지
	public List<Return_Tbl> order_date(@Param("click_date")String click_date, @Param("s_id")String s_id); // 날짜 별
	public List<Return_Tbl> count(String s_id);
	public int insert_select(int ono);  // 교환반품처리 return_end_tbl에 insert
	public int delete(int ono); // 삭제



}
