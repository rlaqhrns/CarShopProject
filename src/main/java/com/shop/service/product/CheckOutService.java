package com.shop.service.product;

import java.util.List;

import com.shop.vo.User_Tbl;

public interface CheckOutService {
	
	public List<User_Tbl> userList(); //user_tbl에서 유저의 정보를 가져옴(재원/20.12.22)
	public User_Tbl getUser(String u_id); //user_tbl에서 유저 아이디 정보로 가져옴  (재원/20.12.23)
}
 