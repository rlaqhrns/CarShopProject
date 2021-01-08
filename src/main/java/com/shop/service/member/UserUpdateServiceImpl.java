package com.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.member.UserUpdateMapper;
import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class UserUpdateServiceImpl implements UserUpdateService {

	
	@Setter(onMethod_=@Autowired)
	protected UserUpdateMapper umapper;
	
	@Transactional
	@Override
	public boolean user_update(User_Tbl user_tbl) {
		try {   
			int a = umapper.user_update(user_tbl);
			int b = umapper.all_user_update(user_tbl);
			
			return a == 1 && b == 1;
			
		} catch (Exception e) {
			System.out.println("user_update transaction faild");
			return false;
		}
	}

	@Override
	public User_Tbl user_select(String id) {
		 return umapper.user_select(id);
	}

	@Transactional
	@Override
	public boolean seller_update(Seller_Tbl seller_tbl) {
		try {   
			int a = umapper.seller_update(seller_tbl);
			int b = umapper.all_seller_update(seller_tbl);
			
			return a == 1 && b == 1;
			
		} catch (Exception e) {
			System.out.println("user_update transaction faild");
			return false;
		}
	}

	@Override
	public Seller_Tbl seller_select(String id) {
		return umapper.seller_select(id);
	}



}
