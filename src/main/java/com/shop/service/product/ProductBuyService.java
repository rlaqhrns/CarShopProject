package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.vo.Prod_Tbl;
import com.shop.vo.ProductCategoryJoin;
import com.shop.vo.User_Tbl;

@Service
public interface ProductBuyService {
	
	public List<Prod_Tbl> getProductAll();
	public List<ProductCategoryJoin> getProductCategory(Integer categoryParents, Integer categoryDetails,String sorting);
	public Prod_Tbl getProduct(int p_no);
	public boolean pushCart(int p_no,String u_id);
	public boolean addLike(int p_no,String u_id);
	public User_Tbl getUser(String u_id);
}
