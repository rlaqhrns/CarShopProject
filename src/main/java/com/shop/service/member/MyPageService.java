package com.shop.service.member;

import java.util.List;

import com.shop.vo.Criteria;
import com.shop.vo.MyAskPageDTO;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

public interface MyPageService {
	public MyAskPageDTO getAskList(Criteria crit, String s_id, String u_id);
	public String checkid(String user);
	public List<Prod_Tbl> bestprods();
	public Seller_Tbl getseller(String s_id);
	public User_Tbl getuser(String u_id);
	
}
