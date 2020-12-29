package com.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.member.AnnclistMapper;
import com.shop.vo.Annc_Tbl;

import lombok.Setter;

@Service
public class AnnclistServiceImpl implements AnnclistService {

	@Setter(onMethod_=@Autowired)
	protected AnnclistMapper amapper;
	
	@Override
	public List<Annc_Tbl> selectall() {
		return amapper.selectall(); 
	}

}
