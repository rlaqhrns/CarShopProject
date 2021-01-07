package com.shop.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.member.UserUpdateMapper;
import com.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class UserUpdateServiceImpl implements UserUpdateService {

	
	@Setter(onMethod_=@Autowired)
	protected UserUpdateMapper umapper;
	
	
	@Override
	public void user_update(User_Tbl user_tbl) {
		umapper.userUpdate(user_tbl);
	}

}
