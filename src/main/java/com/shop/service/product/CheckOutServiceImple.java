package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.CheckOutMapper;
import com.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class CheckOutServiceImple implements CheckOutService{
	@Setter(onMethod_ =@Autowired)
	private CheckOutMapper mapper;

	@Override
	public List<User_Tbl> userList() {
		//user_tbl에서 유저의 정보를 가져옴 (재원/20.12.23)
		System.out.println(mapper.userList().get(0).getName());
		return mapper.userList();
	}

	@Override
	public User_Tbl getUser(String u_id) {
		// TODO Auto-generated method stub
		return mapper.getUser(u_id);
	}
	
	
}
