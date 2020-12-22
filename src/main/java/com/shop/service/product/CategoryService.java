package com.shop.service.product;

import java.util.List;

import com.shop.vo.Cat_Tbl;

public interface CategoryService {
	public List<Cat_Tbl> cateParent(); // �긽�쐞 移댄뀒怨좊━

	public List<Cat_Tbl> category(); // 移댄뀒怨좊━

	public List<Cat_Tbl> cateCheck(int c_no); // 移댄뀒怨좊━ 泥댄겕
}
