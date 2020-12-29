package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.LikeMapper;
import com.shop.vo.Like_Tbl;

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

	@Override
	public boolean getUserLikeProduct(int p_no,String u_id) {
		// TODO Auto-generated method stub
		boolean data = false;
		try {
			Like_Tbl likes = mapper.getUserLikeProduct(p_no, u_id);
			System.out.println(likes.getU_id() + likes.getP_no());
			if( likes != null) {
				data = true;
			};
			
		}catch(Exception e) {
			
		}
		
		return data;
	}
}
