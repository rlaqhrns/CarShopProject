package com.shop.service.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.mapper.member.MyPageMapper;
import com.shop.vo.Criteria;
import com.shop.vo.MyAskPageDTO;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MyPageServiceImple implements MyPageService{
	
	private MyPageMapper mpmapper;

	@Override
	public MyAskPageDTO getAskList(Criteria crit, String s_id, String u_id) {
		// TODO Auto-generated method stub
		return new MyAskPageDTO(mpmapper.getAskCnt(s_id, u_id), mpmapper.getAskWithPaging(crit, s_id, u_id));
	}

	@Override
	public String checkid(String user) {
		// TODO Auto-generated method stub
		return mpmapper.checkId(user);
	}

	@Override
	public List<Prod_Tbl> bestprods() {
		// TODO Auto-generated method stub
		return mpmapper.getproducts();
	}

	@Override
	public Seller_Tbl getseller(String s_id) {
		// TODO Auto-generated method stub
		return mpmapper.getseller(s_id);
	}

	@Override
	public User_Tbl getuser(String u_id) {
		// TODO Auto-generated method stub
		return mpmapper.getuser(u_id);
	}

}
