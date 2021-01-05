package com.shop.service.member;

import java.util.List;

import com.shop.vo.Annc_Tbl;
import com.shop.vo.Prod_Tbl;

public interface SalelistService {

	public List<Prod_Tbl> selectall(String s_id);
}
