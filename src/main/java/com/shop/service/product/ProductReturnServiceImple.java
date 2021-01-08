package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.product.ProductReturnMapper;
import com.shop.vo.Return_Tbl;

import lombok.Setter;

@Service
public class ProductReturnServiceImple implements ProductReturnService{

	@Setter(onMethod_ = @Autowired)
	private ProductReturnMapper mapper;



	@Override
	public List<Return_Tbl> order_date(String click_date,String s_id ) {
		return mapper.order_date(click_date,s_id);
	}

	@Override
	public List<Return_Tbl> count(String s_id) {
		// TODO Auto-generated method stub
		return mapper.count(s_id);
	}

	@Override
	public List<Return_Tbl> retrun_(String s_id) {
		// TODO Auto-generated method stub
		return mapper.return_(s_id);
	}

	
	@Transactional
	@Override
	public int insert_select(int ono) {
		
		mapper.insert_select(ono);
		return mapper.delete(ono);
	}


}
