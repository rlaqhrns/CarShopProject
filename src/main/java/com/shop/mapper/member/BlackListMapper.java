package com.shop.mapper.member;

import java.util.List;

import com.shop.vo.Black_Tbl;
import com.shop.vo.Criteria;

public interface BlackListMapper {
	
	public List<Black_Tbl> getBlack();
	
	public List<Black_Tbl> getBlackWithPaging(Criteria crit);

}
