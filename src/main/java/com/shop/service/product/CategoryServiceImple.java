package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.CategoryMapper;
import com.shop.vo.Cat_Tbl;

import lombok.Setter;

@Service
public class CategoryServiceImple implements CategoryService{
	
	@Setter(onMethod_=@Autowired)
	private CategoryMapper mapper;

	public List<Cat_Tbl> category() {
		return mapper.category();
	}

	public List<Cat_Tbl> cateParent() {
		return mapper.cateParent();
	}

	public List<Cat_Tbl> cateCheck(int c_no) {
		return mapper.cateCheck(c_no);
	}

}
