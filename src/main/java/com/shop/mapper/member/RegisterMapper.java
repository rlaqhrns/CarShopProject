package com.shop.mapper.member;

import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

public interface RegisterMapper {

	public All_User_Tbl idcheck(String id);
	public All_User_Tbl toemailcheck(String toemail);
	public int adduser(User_Tbl user_tbl);
	public int addseller(Seller_Tbl seller_tbl);
	public int alluser_adduser(User_Tbl user_tbl);
	public int alluser_addseller(Seller_Tbl seller_tbl);
}
