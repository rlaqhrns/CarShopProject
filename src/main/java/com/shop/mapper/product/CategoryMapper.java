package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Cat_Tbl;

public interface CategoryMapper {
	public List<Cat_Tbl> cateParent(); // 상위 카테고리

	public List<Cat_Tbl> category(); // 카테고리

	public List<Cat_Tbl> cateCheck(int c_no); // 카테고리 체크

}
