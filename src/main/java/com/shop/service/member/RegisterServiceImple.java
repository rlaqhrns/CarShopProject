package com.shop.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.member.RegisterMapper;
import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class RegisterServiceImple implements RegisterService {

	@Setter(onMethod_=@Autowired)
	protected RegisterMapper rmapper;
	
	@Override
	public All_User_Tbl idcheck(String id) {
		return rmapper.idcheck(id);
	}

	@Transactional
	@Override
	public boolean adduser(User_Tbl user_tbl) {
		try {   
			int a = rmapper.adduser(user_tbl);
			int b = rmapper.alluser_adduser(user_tbl);
			
			return a == 1 && b == 1;
			
		} catch (Exception e) {
			System.out.println("adduser transaction faild");
			return false;
		}

	}
	
	@Transactional
	@Override
	public boolean addseller(Seller_Tbl seller_tbl) {
		try {   
			int a = rmapper.addseller(seller_tbl);
			int b = rmapper.alluser_addseller(seller_tbl);
			return a == 1 && b == 1;
			
		} catch (Exception e) {
			System.out.println("addseller transaction faild");
			return false;
		}
		
	}
	
	
}
