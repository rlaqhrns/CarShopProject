package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Cart_Tbl;
import com.shop.vo.User_Tbl;

public interface CheckOutMapper {
	
	/*
	 *  결제화면 정보 맵핑  
	 * 	1. 일반 유저 정보 전부 가져오기
	 * 	2. 주소를 상세주소와 대분류 주소로 나눠서 가져오기 -- service 쪽에서?
	 * 	3. 장바구니 정보 전부 가져오기 
	 *  3-1. jstl 안되면 -> quantity랑 amount 따로 장바구니 정보로 가져오기 
	 * 	3-2. 안되면 vo 추가하고 mybatis로 처리
	 * 	4. 구매이력 insert로 넘기기  
	 * 	(재원/20.12.22)
	 * */
	
	public List<User_Tbl> userList(); //user_tbl에서 유저의 정보를 가져옴(재원/20.12.22)
	public List<Cart_Tbl> cartList(); //cart_tbl에서 cart정보 가져옴(재원/20.12.22)  
	public void insertBuyList(); //구매이력 insert(재원/20.12.22)  
	
}