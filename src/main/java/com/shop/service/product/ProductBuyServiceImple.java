package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.ProductBuyMapper;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.ProductCategoryJoin;

import lombok.Setter;

@Service
public class ProductBuyServiceImple implements ProductBuyService {
	@Setter(onMethod_ = @Autowired)
	private ProductBuyMapper mapper;
	
	@Override
	public List<Prod_Tbl> getProductAll(){
		return mapper.getProductAll();
	}

	@Override
	public Prod_Tbl getProduct(int p_no) {
		return mapper.getProduct(p_no);
	}

	@Override
	public List<ProductCategoryJoin> getProductCategory(Integer c_parent,Integer c_no) {
		// TODO Auto-generated method stub
		return mapper.getProductCategory(c_parent, c_no);
	}
}
