package com.shop.mapper.member;

import java.util.List;

import com.shop.vo.Prod_Tbl;

public interface SalelistMapper {

	public List<Prod_Tbl> selectall(String s_id);
}
