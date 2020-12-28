package com.shop.service.member;

import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

public interface RegisterService {
	
	public All_User_Tbl idcheck(String id);
	public void adduser(User_Tbl user_tbl);
	public void addseller(Seller_Tbl seller_tbl);
	public void alluser_adduser(User_Tbl user_tbl);
	public void alluser_addseller(Seller_Tbl seller_tbl);
	
}
