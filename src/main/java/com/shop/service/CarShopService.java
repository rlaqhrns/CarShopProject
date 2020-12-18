package com.shop.service;

import java.util.List;

import com.shop.vo.All_User_Tbl;

import com.shop.vo.Cat_Tbl;

import com.shop.vo.Prod_Tbl;

public interface CarShopService {

	public All_User_Tbl getAllUser();  //로그인정보 
	public List<Prod_Tbl> index(); // index Page에서 hit순으로
	public List<Prod_Tbl> index2(); // index Page에서 최신순으로
	public void productForm(Prod_Tbl product); // 상품 등록
	public List<Cat_Tbl> cateParent(); // 상위 카테고리
	public List<Cat_Tbl> category(); // 카테고리


}
