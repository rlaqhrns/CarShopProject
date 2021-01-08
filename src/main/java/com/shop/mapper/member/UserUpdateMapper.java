package com.shop.mapper.member;

import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

public interface UserUpdateMapper {
	public int user_update(User_Tbl user_tbl);
	public User_Tbl user_select(String id);
	public int seller_update(Seller_Tbl seller_tbl);
	public Seller_Tbl seller_select(String id);
	public int all_user_update(User_Tbl user_tbl);
	public int all_seller_update(Seller_Tbl seller_tbl);
}
