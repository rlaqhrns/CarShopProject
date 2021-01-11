package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Annc_Tbl;
import com.shop.vo.Prod_Tbl;

public interface IndexMapper {
	
	public List<Prod_Tbl> index();

	public List<Prod_Tbl> index2(); // 인덱스 페이지 최신순
	
	public List<Annc_Tbl> annc(); // 공지사항

}
