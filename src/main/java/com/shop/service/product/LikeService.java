package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.vo.Like_Tbl;

@Service
public interface LikeService {
	public int addLike(Like_Tbl like);
	public List<Like_Tbl> getUserLikedList(String u_id);
	public boolean getUserLikeProduct(int p_no,String u_id);
	public int deleteLike(int p_no, String u_id);
	
	
	
}
