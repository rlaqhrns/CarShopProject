package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Cart_Tbl;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.User_Tbl;

public interface CheckOutMapper {
	
	public List<User_Tbl> userList(String u_id); //user_tbl에서 유저의 정보를 list로 가져옴 -- 테스트용(재원/20.12.22)
	public User_Tbl getUser(String u_id); //user_tbl에서 유저 아이디 정보로 가져옴  (재원/20.12.23)
	public List<Cart_Tbl> cartList(String u_id); //cart_tbl에서 cart정보 가져옴 -- 테스트용(재원/20.12.22)  
	public void insertBuyList(Order_Histroy_Tbl order); //구매이력 insert(재원/20.12.22)  
	public void deleteCartList(String u_id); // 장바구니 이력 없애기 (재원/20.12.28)
	public User_Tbl isUser(String u_id); //아이디 예외처리(재원/21.01.13)

	
}