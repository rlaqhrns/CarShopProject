package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.vo.Cart_Tbl;

@Service
public interface CartService {
	public List<Cart_Tbl> getUserCart(String u_id);
	public int addCart(Cart_Tbl cart);
}
