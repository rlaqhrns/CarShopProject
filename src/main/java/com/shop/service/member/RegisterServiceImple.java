package com.shop.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.member.RegisterMapper;
import com.shop.vo.All_User_Tbl;

import lombok.Setter;

@Service
public class RegisterServiceImple implements RegisterService {

	@Setter(onMethod_=@Autowired)
	protected RegisterMapper rmapper;
	
	@Override
	public All_User_Tbl idcheck(String id) {
		return rmapper.idcheck(id);
	}
	
}
