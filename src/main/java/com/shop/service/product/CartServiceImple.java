package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.CartMapper;
import com.shop.vo.Cart_Tbl;

import lombok.Setter;

@Service
public class CartServiceImple implements CartService {
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

	@Override
	public List<Cart_Tbl> listCart(String u_id) {
		return mapper.listCart(u_id);
	}

	@Override
	public List<Cart_Tbl> cartMoney() {
		// TODO Auto-generated method stub
		return mapper.cartMoney();
	}

	@Override
	public int delete(int cart_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAll(String u_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void update(int p_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public int countCart(String u_id, int p_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateCart(Cart_Tbl vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyCart(Cart_Tbl vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int sumTotal(String u_id) {
		// TODO Auto-generated method stub
		return mapper.sumTotal(u_id);
	}

}
