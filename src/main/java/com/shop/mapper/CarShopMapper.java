package com.shop.mapper;

import java.util.List;

import com.shop.vo.All_User_Tbl;
import com.shop.vo.Prod_Tbl;

public interface CarShopMapper {

	public List<Prod_Tbl> index();
	public All_User_Tbl getAllUser();

}
