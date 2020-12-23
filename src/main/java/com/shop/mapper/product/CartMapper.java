package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Cart_Tbl;


public interface CartMapper {
	public List<Cart_Tbl> getUserCart(String u_id);
	public int addCart(Cart_Tbl cart);
}
