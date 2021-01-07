package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.vo.Cart_Tbl;

@Service
public interface CartService {
	public List<Cart_Tbl> getUserCart(String u_id);
	public int addCart(Cart_Tbl cart); // 장바구니 추가 

	public List<Cart_Tbl> cartMoney(); //
	public List<Cart_Tbl> listCart(String u_id); // 장바구니 목록
	public int delete(int cart_id); // 장바구니 개별 삭제
	public int deleteAll(String u_id); // 장바구니 모두 삭제
	public void update(int p_no); // 장바구니 업데이트 
	public int sumTotal(String u_id); // 장바구니 total
	public int countCart(String u_id, int p_no); // 장바구니 상품 개수
	public void updateCart(Cart_Tbl vo); // 장바구니 수정
	public void modifyCart(Cart_Tbl vo);

	
	
	
	
	
	
	
	
}
