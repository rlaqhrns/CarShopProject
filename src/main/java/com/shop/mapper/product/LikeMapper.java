package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Like_Tbl;

public interface LikeMapper {
	public int addLike(Like_Tbl like);
	public List<Like_Tbl> getUserLikedList(String u_id);
	public int deleteLike(int p_no, String u_id);
}
