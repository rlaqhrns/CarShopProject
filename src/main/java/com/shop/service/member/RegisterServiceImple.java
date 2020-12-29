package com.shop.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public void adduser(User_Tbl user_tbl) {
		rmapper.adduser(user_tbl);
	}

	@Override
	public void addseller(Seller_Tbl seller_tbl) {
		rmapper.addseller(seller_tbl);
	}

	@Override
	public void alluser_adduser(User_Tbl user_tbl) {
		rmapper.alluser_adduser(user_tbl);
	}

	@Override
	public void alluser_addseller(Seller_Tbl seller_tbl) {
		rmapper.alluser_addseller(seller_tbl);
	}
	
}
