package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.CartMapper;
import com.shop.vo.Cart_Tbl;

import lombok.Setter;

@Service
public class CartServiceImple implements CartService{
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	@Override
	public List<Cart_Tbl> getUserCart(String u_id) {
		return mapper.getUserCart(u_id);
	}

	@Override
	public int addCart(Cart_Tbl cart) {
		return mapper.addCart(cart);
		
	}
}
