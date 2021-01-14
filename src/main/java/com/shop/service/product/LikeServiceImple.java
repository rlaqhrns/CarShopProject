package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.LikeMapper;
import com.shop.vo.Like_Tbl;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class LikeServiceImple implements LikeService {
	@Setter(onMethod_ = @Autowired)
	LikeMapper mapper;

	@Override
	public int addLike(Like_Tbl like) {
		// TODO Auto-generated method stub
		return mapper.addLike(like);
	}

	@Override
	public List<Like_Tbl> getUserLikedList(String u_id) {
		// TODO Auto-generated method stub
		return mapper.getUserLikedList(u_id);
	}

	@Override
	public int deleteLike(int p_no, String u_id) {
		// TODO Auto-generated method stub
		return mapper.deleteLike(p_no, u_id);
	}
	
	

	
	//prod_tbl에서 유저의 정보를 가져옴 2021.01.12 yhj
	@Override
	public List<Prod_Tbl> prodList(String s_id) {
		
		return mapper.prodList(s_id);
	}
	
	
	@Override
	public boolean getUserLikeProduct(int p_no,String u_id) {
		// TODO Auto-generated method stub
		boolean data = false;
		try {
			Like_Tbl likes = mapper.getUserLikeProduct(p_no, u_id);
			if( likes != null) {
				data = true;
			};
			
		}catch(Exception e) {
			
		}
		
		return data;
	}

	
	
	@Override
	public List<Like_Tbl> getCartUpdate(String u_id) {
		// TODO Auto-generated method stub
		return mapper.getCartUpdate(u_id);
	}

	@Override
	public int deleteAll(String u_id) {
		
		return mapper.deleteAll(u_id);
	}

	@Override
	public int delete(int p_no, String u_id) {
		
		return mapper.delete(p_no, u_id);
	}
}
