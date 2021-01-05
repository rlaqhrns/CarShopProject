package com.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.Prod_Tbl;
import com.shop.vo.ProductCategoryJoin;

public interface ProductBuyMapper {
	public List<Prod_Tbl> getProductAll();
	public List<ProductCategoryJoin> getProductCategory(@Param("c_parent")Integer categoryParents,@Param("c_no")Integer categoryDetails,@Param("object") String object,@Param("direction")String direction);
	public Prod_Tbl getProduct(int p_no);
}
