package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Cart_Tbl;


public interface CartMapper {
	public List<Cart_Tbl> getUserCart(String u_id); 
	public int addCart(Cart_Tbl cart);
	
	// insert 
	
	public List<Cart_Tbl> cartMoney(); //
	public List<Cart_Tbl> listCart(String u_id); // 장바구니 목록
	public String delete(String u_id); // 장바구니 개별 삭제
	// 칼럼타입 수정 2020.01.08 yunhj
	public int deleteAll(String u_id); // 장바구니 모두 삭제
	public void update(int p_no); // 장바구니 업데이트 
	public int sumTotal(String u_id); // 장바구니 total
	public int countCart(String u_id, int p_no); // 장바구니 상품 개수
	public void updateCart(Cart_Tbl vo); // 장바구니 수정
	public void modifyCart(Cart_Tbl vo);
	

	
	
	
	

}
