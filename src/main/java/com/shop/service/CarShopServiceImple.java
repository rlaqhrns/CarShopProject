package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.CarShopMapper;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service

public class CarShopServiceImple implements CarShopService {

	@Setter(onMethod_ = @Autowired)
	private CarShopMapper mapper;

	@Override
	public List<Prod_Tbl> index() {
		System.out.println("mapper list 들어옴");
		return mapper.index();
	}

}
