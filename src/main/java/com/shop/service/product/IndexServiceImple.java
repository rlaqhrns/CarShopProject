package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.IndexMapper;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;

@Service
public class IndexServiceImple implements IndexService {

	@Setter(onMethod_ = @Autowired)
	private IndexMapper mapper;

	@Override
	public List<Prod_Tbl> index() {
		// TODO Auto-generated method stub
		return mapper.index();
	}

	@Override
	public List<Prod_Tbl> index2() {
		// TODO Auto-generated method stub
		return mapper.index2();
	}

	}


