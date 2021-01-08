package com.shop.service.member;

import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;


public interface UserUpdateService {

	public boolean user_update(User_Tbl user_tbl);
	public User_Tbl user_select(String id);
	public boolean seller_update(Seller_Tbl seller_tbl);
	public Seller_Tbl seller_select(String id);
}
