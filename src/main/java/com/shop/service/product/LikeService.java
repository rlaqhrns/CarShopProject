package com.shop.service.product;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.vo.Cart_Tbl;
import com.shop.vo.Like_Tbl;
import com.shop.vo.Prod_Tbl;

@Service
public interface LikeService {
	
	public int addLike(Like_Tbl like); // 찜목록 추가 보군님
	public boolean getUserLikeProduct(int p_no,String u_id); // 보군님 
	public int deleteLike(int p_no, String u_id); // 찜목록 취소 보군님 
	
	
	/* public int insertCart(Like_Tbl like); */
	
	public List<Like_Tbl> getCartUpdate(String u_id); // 찜 출력 

	// 찜목록에서 삭제와 비우기 혜정 
	public int deleteAll(String u_id);
	public int delete(int p_no, String u_id);
	

	
	//List<Prod_Tbl> prodList(String s_id); // prolist tbl 
	//public List<Like_Tbl> getUserLikedList(String u_id); //찜목록 보는거 
	
}
