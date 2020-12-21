package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.mapper.product.CategoryMapper;
import com.shop.vo.Cat_Tbl;

@Service
public class CategoryServiceImple {
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
