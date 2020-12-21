package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.mapper.product.IndexMapper;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;

public class IndexServiceImple {

	@Setter(onMethod_ = @Autowired)
	private IndexMapper mapper;

	public List<Prod_Tbl> index() {
		System.out.println("mapper list 들어옴");
		return mapper.index();
	}

	public List<Prod_Tbl> index2() {
		return mapper.index2();
	}

}
