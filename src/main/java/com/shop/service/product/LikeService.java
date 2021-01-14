package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.vo.Like_Tbl;
import com.shop.vo.Prod_Tbl;

@Service
public interface LikeService {
	public int addLike(Like_Tbl like);
	public List<Like_Tbl> getUserLikedList(String u_id);
	public boolean getUserLikeProduct(int p_no,String u_id);
	public int deleteLike(int p_no, String u_id);
	
	
	
	
	List<Prod_Tbl> prodList(String s_id); // prolist tbl 
	public List<Like_Tbl> getCartUpdate(String u_id);
	// LIKE 출력 
	
	
	
	public int deleteAll(String u_id);
	public int delete(int p_no, String u_id);
	
	
	
	
}
