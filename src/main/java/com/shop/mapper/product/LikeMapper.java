package com.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.Like_Tbl;

public interface LikeMapper {
	public int addLike(Like_Tbl like);
	public List<Like_Tbl> getUserLikedList(String u_id);
	public Like_Tbl getUserLikeProduct(@Param("p_no")int p_no,@Param("u_id")String u_id);
	public int deleteLike(@Param("p_no")int p_no,@Param("u_id")String u_id);
}
