package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.CartMapper;
import com.shop.mapper.product.LikeMapper;
import com.shop.mapper.product.ProductBuyMapper;
import com.shop.vo.Cart_Tbl;
import com.shop.vo.Like_Tbl;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.ProductCategoryJoin;

import lombok.Setter;

@Service
public class ProductBuyServiceImple implements ProductBuyService {
	@Setter(onMethod_ = @Autowired)
	private ProductBuyMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	@Setter(onMethod_ = @Autowired)
	private LikeMapper likeMapper;
	
	@Override
	public List<Prod_Tbl> getProductAll(){
		return mapper.getProductAll();
	}

	@Override
	public Prod_Tbl getProduct(int p_no) {
		return mapper.getProduct(p_no);
	}

	@Override
	public List<ProductCategoryJoin> getProductCategory(Integer categoryParents, Integer categoryDetails,String sorting) {
		// TODO Auto-generated method stub
		//System.out.println(" service 부모 카테고리 : " + categoryParents + ", 자식 카테고리 : " +  categoryDetails + "direction :  " + direction);
		return mapper.getProductCategory(categoryParents, categoryDetails, sorting);
	}

	@Override
	public boolean pushCart(int p_no, String u_id) {
		Prod_Tbl product = getProduct(p_no);
		Cart_Tbl cart = new Cart_Tbl(); 
		cart.setP_no(product.getP_no()); //vo 객체 수정으로 (pno -> p_no) setPno => setP_no 수정 (재원/20.12.29)
		cart.setU_id(u_id);
		cart.setPname(product.getP_name());
		cart.setAmount(product.getAmount());
		cart.setTotal(0);
		int addCartBoolean = cartMapper.addCart(cart);
		return addCartBoolean == 1;
	}

	@Override
	
	public boolean addLike(int p_no, String u_id) {
		Like_Tbl like = new Like_Tbl();
		like.setU_id(u_id);
		like.setP_no(p_no);
		int addLikeBoolean = likeMapper.addLike(like);
		return addLikeBoolean == 1;
	}

//	@Override
//	public List<Prod_Tbl> getSortProduct(String object, String direction) {
//		// TODO Auto-generated method stub
//		return mapper.getSortProduct(object,direction);
//	}
}
