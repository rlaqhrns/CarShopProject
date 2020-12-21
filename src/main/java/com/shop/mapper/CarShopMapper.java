package com.shop.mapper;

import java.util.List;

import com.shop.vo.All_User_Tbl;

import com.shop.vo.Cat_Tbl;

import com.shop.vo.Prod_Tbl;
import com.shop.vo.Return_Tbl;

public interface CarShopMapper {

	public List<Prod_Tbl> index();
	
	public All_User_Tbl getAllUser();

	public List<Prod_Tbl> index2(); // 인덱스 페이지 최신순

	public void productForm(Prod_Tbl product); // 상품등록

	public List<Cat_Tbl> cateParent(); // 상위 카테고리

	public List<Cat_Tbl> category(); // 카테고리
	
	public List<Cat_Tbl> cateCheck(int c_no); // 카테고리 상위 체크
	
	public List<Return_Tbl> return_end(); // 교환 반품 페이지
}
