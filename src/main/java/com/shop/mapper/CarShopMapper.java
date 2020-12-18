package com.shop.mapper;

import java.util.List;

import com.shop.vo.Cat_Tbl;
import com.shop.vo.Prod_Tbl;

public interface CarShopMapper {

	public List<Prod_Tbl> index(); // 인덱스 페이지 hit 순

	public List<Prod_Tbl> index2(); // 인덱스 페이지 최신순

	public void productForm(Prod_Tbl product); // 상품등록

	public List<Cat_Tbl> cateParent(); // 상위 카테고리

	public List<Cat_Tbl> category(); // 카테고리
}
