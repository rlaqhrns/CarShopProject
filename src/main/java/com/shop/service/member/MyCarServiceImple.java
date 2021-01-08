package com.shop.service.member;

import org.springframework.stereotype.Service;

import com.shop.mapper.member.MyCarMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MyCarServiceImple implements MyCarService{
	
	private MyCarMapper carmapper;

	@Override
	public String getcarname(String u_id) {
		// TODO Auto-generated method stub
		return carmapper.getcar(u_id);
	}

	@Override
	public void updatecar(String u_id, String carname) {
		carmapper.updatecar(u_id, carname);
		
	}

}
