package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.CarShopMapper;
import com.shop.vo.Cat_Tbl;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;

@Service
public class CarShopServiceImple implements CarShopService {

	@Setter(onMethod_ = @Autowired)
	private CarShopMapper mapper;

	@Override
	public List<Prod_Tbl> index() {
		System.out.println("mapper list 들어옴");
		return mapper.index();
	}

	@Override
	public List<Prod_Tbl> index2() {
		// TODO Auto-generated method stub
		return mapper.index2();
	}

	@Override
	public void productForm(Prod_Tbl product) {

		mapper.productForm(product);
	}

	@Override
	public List<Cat_Tbl> category() {
		return mapper.category();
	}

	@Override
	public List<Cat_Tbl> cateParent() {
		return mapper.cateParent();
	}

	@Override
	public List<Cat_Tbl> cateCheck(int c_no) {
		return mapper.cateCheck(c_no);
	}

}
